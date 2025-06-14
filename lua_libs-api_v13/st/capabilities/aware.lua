-- Copyright 2025 SmartThings
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--     http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.
local utils = require "st.utils"
local json = require "st.json"
local log = require "log"
local cap_socket

local capabilities = {}
local capability_utils = {}

--- @class CapabilityCommand
---
--- A capability command sent from the cloud intended for a device
---
--- @field public capability string the ID of the capability this command is for
--- @field public component string the component this command is for
--- @field public command string the ID of the command this is for
--- @field public args table<string, any> the arguments for this function in a key, value form
--- @field public positional_args any[] The arguments in positional format
local CapabilityCommand = {}

local inline_type_schema

inline_type_schema = function(schema)
  if schema["$ref"] ~= nil then
    local type_name = schema["$ref"]
    if type_name == "color-map" then
      type_name = "COLOR_MAP"
    end
    -- TODO: Should this be a separate RPC call or inlined upstream (rust?, cloud?)
    return inline_type_schema(json.decode(require(string.format("st.capabilities.generated.types.%s", type_name))))
  end
  local out_schema = {}
  for k,v in pairs(schema) do
    if type(v) == "table" then
      out_schema[k] = inline_type_schema(v)
    else
      out_schema[k] = v
    end
  end
  return out_schema
end

capabilities.build_cap_from_json_string = function(cap_json, pre_inlined)
  if pre_inlined == nil then
    pre_inlined = false
  end
  local cap_raw_tab = json.decode(cap_json)
  local cap = capabilities.build_capability(cap_raw_tab.name, cap_raw_tab.id, cap_raw_tab.version)

  -- Attribute definitions
  for attr, def in pairs(cap_raw_tab.attributes) do
    local s = def.schema
    if not pre_inlined then
      s = inline_type_schema(def.schema)
    end
    cap:add_attribute(attr, s)
  end

  -- Command definitions
  for cmd, def in pairs(cap_raw_tab.commands) do
    local arg_list = {}
    for _, arg in ipairs(def.arguments) do
      local s = arg
      if not pre_inlined then
        s = inline_type_schema(arg)
      end
      arg_list[#arg_list + 1] = s
    end
    cap:add_command(cmd, arg_list)
  end
  return cap
end

local cap_not_found_mt = {
  __call = function(proto, version)
    if version == nil then
      version = 1
    end
    return capabilities.get_capability_definition(proto.ID, version)
  end,
  __index = function(self, key)
    local raw_val = rawget(self, key)
    if raw_val ~= nil then
      return raw_val
    else
      local id = rawget(self, "ID")
      local version = rawget(self, "version")
      if id == nil or version == nil then
        error("Unknown capability reference")
      end
      local status, cap_val = pcall(capabilities.get_capability_definition, id, version)
      if status then
        return cap_val[key]
      else
        error(cap_val, 2)
      end
    end
  end
}

local cap_mt = {}
cap_mt.__key_cache = {}
cap_mt.__index = function(self, key)
  if capability_utils[key] ~= nil then
    return capability_utils[key]
  elseif (cap_mt.__key_cache[key] or {})[1] == nil then
    local status, cap_val = pcall(capabilities.get_capability_definition, key, 1) -- default to version 1
    if not status then
      log.warn_with({hub_logs = true}, string.format("Unexpected filesystem lookup for capability %s", key))
      local req_path = string.format("st.capabilities.generated.%s", key)
      local status, cap_val = pcall(require, req_path)
      if status then
        cap_mt.__key_cache[key] = {
          [1] = capabilities.build_cap_from_json_string(cap_val, false),
        }
      else
        local placeholder = {
          ID = key,
          version = 1
        }
        setmetatable(placeholder, cap_not_found_mt)
        return placeholder
      end
    end
  end
  return cap_mt.__key_cache[key][1] -- default to version 1
end

setmetatable(capabilities, cap_mt)

function capabilities.get_capability_definition(capability_id, version, force)
  if cap_socket == nil then
    cap_socket = (require "cosock.socket.capability")()
  end
  if (cap_mt.__key_cache[capability_id] or {})[version] == nil or force == true then
    local cap_def = cap_socket:get_capability_definition(capability_id, version)
    if cap_def ~= nil then
      cap_mt.__key_cache[capability_id] = cap_mt.__key_cache[capability_id] or {}
      cap_mt.__key_cache[capability_id][version] = capabilities.build_cap_from_json_string(cap_def, true)
    else
      error(string.format("Capability %s version %d definition not found", capability_id, version), 2)
    end
  end
  return cap_mt.__key_cache[capability_id][version]
end

-- TODO: add behavior if desired
local event_mt = {}

local capability_mt = {
  __call = function(proto, version)
    if version == nil then
      version = 1
    end
    return capabilities.get_capability_definition(proto.ID, version)
  end
}

local command_mt = {
  __index = {
    validate_and_normalize_command = function(self, cap_command_table)
      local args = cap_command_table.args
      if #args > #self.arg_list then
        error("Too many args for " .. self.capability.NAME .. "." .. self.NAME)
      else
        for arg_idx, arg_value in ipairs(args) do
          local arg_def = self.arg_list[arg_idx]
          -- TODO: Potentially remove when the C side command building can deal with types.
          arg_value = capability_utils.manipulate_type(arg_def.schema, arg_value)
          if not (arg_def.required ~= nil and arg_def.required == false and arg_value == nil) and not capability_utils.validate_type(arg_def.schema, arg_value) then
            error("Invalid value for " .. self.capability.NAME .. "." .. self.NAME .. " arg: " .. arg_def.name .. " value: " .. utils.stringify_table(arg_value))
            return false
          end
        end
      end
      self:convert_to_kv_args(cap_command_table)
      return true
    end,
    convert_to_kv_args = function(self, cap_command_table)
      local args_by_name = {}
      for arg_idx, arg_value in ipairs(cap_command_table.args) do
        local arg_def = self.arg_list[arg_idx]
        args_by_name[arg_def.name] = arg_value
      end
      cap_command_table.positional_args = cap_command_table.args
      cap_command_table.args = args_by_name
      return cap_command_table
    end
  },
}

local enum_value_mt = {
  __index = {},
  __call=function(orig, metadata)
    return orig.attribute(orig.NAME, metadata)
  end
}

local attr_mt = {
  __index = {},
  __call=function(orig, value, metadata)
    local event = {}
    if type(value) ~= "table" then
      value = {value = value}
    end
    -- This is trying to handle the most common case of expecting a single `value` within the generated
    -- event, but not wanting the developer to have to wrap every emit_event with `{value = their_event_value}`
    if value.value == nil and orig.schema.properties.value ~= nil and orig.schema.type == "object" then
      value = {value = value}
    end
    local is_valid = true
    if orig.schema ~= nil then
      is_valid, err = capability_utils.validate_type(orig.schema, value, orig.NAME)
    end
    if is_valid then
      event.capability = orig.capability
      event.attribute = orig
      event.value = value
      setmetatable(event, event_mt)
      utils.merge(event, metadata)
      return event
    else
      error("Invalid value for " .. orig.capability.NAME .. "." .. orig.NAME .. " value: " .. utils.stringify_table(value) .. " error: " .. err)
    end
  end
}

capability_utils.build_capability = function(capability_name, capability_id, version)
  local capability = {}
  capability.NAME = capability_name
  capability.ID = capability_id
  capability.add_attribute = capability_utils.add_attribute
  capability.add_command = capability_utils.add_command
  capability.version = version
  capability.commands = {}
  setmetatable(capability, capability_mt)
  return capability
end


local add_enum_vals = function(attribute, schema)
  if schema.properties ~= nil and schema.properties.value ~= nil then
    if schema.properties.value.enum ~= nil then
      for _, v in ipairs(schema.properties.value.enum) do
        local key_name = string.gsub(v, " ", "_")
        attribute[key_name] = {}
        attribute[key_name].NAME = v
        attribute[key_name].attribute = attribute
        setmetatable(attribute[key_name], enum_value_mt)
      end
    end
  end
end

capability_utils.add_attribute = function(capability, attribute_name, schema)
  local attribute = {}

  attribute.NAME = attribute_name
  attribute.ID = attribute_name
  attribute.capability = capability
  attribute.schema = schema
  add_enum_vals(attribute, schema)
  setmetatable(attribute, attr_mt)
  capability[attribute_name] = attribute
end

capability_utils.add_command = function(capability, command_name, arg_list)
  local command = {}
  command.NAME = command_name
  command.ID = command_name
  command.arg_list = arg_list
  command.capability = capability
  setmetatable(command, command_mt)
  capability.commands[command_name] = command
end

local validate_string = function(t, value, name)
  local field_name = t.title or name or "unknown"
  if type(value) == "string" then
    -- TODO: Handle pattern
    if t.enum ~= nil then
      for _, v in ipairs(t.enum) do
        if v == value then
          return true
        end
      end
    else
      return true
    end
    return false, "Given " .. value .. " for " .. field_name .. ". Incorrect string given"
  end
  return false, "Given ".. type(value) .. " for " .. field_name ..". Required type is a string"
end

local validate_number = function(t, value, name)
  local field_name = t.title or name or "unknown"
  if type(value) == "number" then
    local min_str = ""
    local max_str = ""
    local is_valid = true
    if t.minimum ~= nil then
      is_valid = is_valid and value >= t.minimum
      min_str = "min: " .. t.minimum
    end
    if t.maximum ~= nil then
      is_valid = is_valid and value <= t.maximum
      max_str = "max: " .. t.maximum
    end
    if is_valid then
      return is_valid
    else
      local err_msg = "Given " .. value .. " for ".. field_name .. ". Outside bounds: " .. min_str .. " " .. max_str
      return is_valid, err_msg
    end
  end
  return false, "Given " .. type(value) .. " for " .. field_name .. ". Required type is a number"
end

local validate_integer = function(t, value, name)
  local field_name = t.title or name or "unknown"
  if type(value) == "number" then
    if math.floor(value) ~= value then
      return false, "Given " .. value .. " for " .. field_name .. ". Integer field cannot be fractional."
    end
    local min_str = ""
    local max_str = ""
    local is_valid = true
    if t.minimum ~= nil then
      is_valid = is_valid and value >= t.minimum
      min_str = "min: " .. t.minimum
    end
    if t.maximum ~= nil then
      is_valid = is_valid and value <= t.maximum
      max_str = "max: " .. t.maximum
    end
    if is_valid then
      return true
    else
      return false, "Given " .. value .. " for " .. field_name .. ". Outside bounds: " .. min_str .. " " .. max_str
    end
  end
  return false, "Given " .. type(value) .. " for " .. field_name .. ". Required type is a number"
end

local validate_object = function(t, value, name)
  local field_name = t.title or name or "unknown"
  if type(value) == "table" then
    if t.properties ~= nil then
      local is_valid = true
      local err = nil
      local req_map = {}
      for _, req_field in ipairs(t.required or {}) do
        req_map[req_field] = true
      end
      for k, v in pairs(t.properties) do
        --check if all required fields are present
        if req_map[k] == true and value[k] == nil then
          return false, "Required field missing: " .. k
        elseif value[k] ~= nil then
          if v.type ~= nil then
            local type_valid, type_err = capability_utils.validate_type(v, value[k], k)
            if type_err ~= nil then
              err = type_err
            end
            is_valid = is_valid and type_valid 
          else
            return false, "No type specified"
          end
        end
      end
      if t.additionalProperties == false then
        for k, _ in pairs(value) do
          if t.properties[k] == nil then
            return false, string.format("Incorrect field: %s", k)
          end
        end
      end
      return is_valid, err
    else
      return true
    end
  end
  return false, "Given " .. type(value) .. " for " .. field_name .. ". Required type is a table"
end

local validate_array = function(t, value, name)
  local field_name = t.title or name or "unknown"
  if type(value) == "table" then
    if t.items ~= nil then
      if t.minItems ~= nil and t.minItems > #value then
        return false, "Minimum number of items is " .. t.minItems .. ". Number of items given " .. #value
      elseif t.maxItems ~= nil and t.maxItems < #value then
        return false, "Max number of items is " .. t.maxItems .. ". Number of items given " .. #value
      end
      for _, v in ipairs(value) do
        local is_valid, err = capability_utils.validate_type(t.items, v, field_name)
        if not is_valid then
          return false, err
        end
      end
      if getmetatable(value) == nil then --ensure json array encoding
        setmetatable(value, json.array_mt)
      end
      return true
    end
  end
  return false, "Given " .. type(value) .. " for " .. t.title .. ". Required type is a table"
end

local validate_boolean = function(t, value)
  local val = type(value)
  if val == "boolean" then
    return true
  end
  return false, "Given " .. type(value) .. " for " .. t.title .. ". Required type is a boolean"
end

capability_utils.validate_type = function(t, value, name)
  local validation_map = {
    integer = validate_integer,
    number = validate_number,
    object = validate_object,
    string = validate_string,
    array = validate_array,
    boolean = validate_boolean,
  }
  -- Allow an unexpected type to be passed through as valid
  if validation_map[t.type] == nil then
    return true
  end
  return validation_map[t.type](t, value, name)
end

capabilities.stringify_event = function(value)
  local t = type(value)
  if (t == "string") then
    return value
  elseif (t == "number") then
    return tostring(value)
  elseif (t == "table") then
    return utils.stringify_table(value)
  end
end

capability_utils.manipulate_type = function(t, value)
  if t.type == "integer" and type(value) == "string" then
    return tonumber(value)
  end
  return value
end

capability_utils.raw_event_to_edge_event = function(component_id, event)
  local vis
  if event.visibility ~= nil and type(event.visibility) == "table" then
    for _, key in ipairs({"displayed", "ephemeral", "non_archivable"}) do
      if type(event.visibility[key]) == "boolean" then
        vis = vis or {}
        vis[key] = event.visibility[key]
      end
    end
  end

  local edge_device_event = {
    component_id = component_id,
    capability_id = event.capability.ID,
    attribute_id = event.attribute.NAME,
    state = {
      value = utils.deep_copy(event.value.value),
      unit = utils.deep_copy(event.value.unit),
      data = utils.deep_copy(event.data),
    },
    state_change = event.state_change or nil,
    visibility = vis
  }

  -- Maintain array metatables for serialization to json format, deep_copy removes metatables
  if json.array_mt and debug.getmetatable(event.value.value) == json.array_mt then
    setmetatable(edge_device_event.state.value, json.array_mt)
  end
  return edge_device_event
end

capability_utils.emit_event = function(device, component_id, sock, event)
  if type(event.value) ~= "table" then
    event.value = { value = event.value }
  end
  local is_valid = true
  if event.attribute.schema ~= nil then
    is_valid = capability_utils.validate_type(event.attribute.schema, event.value, event.attribute.NAME)
  end

  if is_valid then
    local edge_device_event = capability_utils.raw_event_to_edge_event(component_id, event)
    device.log.info_with({ hub_logs = true }, string.format("emitting event: %s", json.encode(edge_device_event)))
    local _, err = sock:send(device.id, json.encode(edge_device_event))
    -- Remove array metatable used in serialization since device cache datastore cannot store metatables
    if type(edge_device_event.state.value) == "table" then debug.setmetatable(edge_device_event.state.value, nil) end
    if err ~= nil then
      log.warn_with({ hub_logs = true }, "Failed to send event: " .. utils.stringify_table(event.value) .. " for " .. event.capability.NAME .. "." .. event.attribute.NAME .. " " .. tostring(err))
      return nil
    end
    return edge_device_event
  else
    log.warn_with({ hub_logs = true }, "Received invalid value: " .. utils.stringify_table(event.value) .. " for " .. event.capability.NAME .. "." .. event.attribute.NAME)
    return nil
  end
end

return capabilities
