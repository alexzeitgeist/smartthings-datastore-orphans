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

local capability_utils = {}
local cap_cache = {}

local command_mt = {
  __index = {
    validate_and_normalize_command = function(self, cap_command_table)
      self:convert_to_kv_args(cap_command_table)
      return true
    end,
    convert_to_kv_args = function(self, cap_command_table)
      cap_command_table.positional_args = cap_command_table.args
      cap_command_table.args = cap_command_table.named_args
      return cap_command_table
    end
  },
}

local function new_command(key)
  local nc = {}
  nc.NAME = key
  nc.ID = key
  setmetatable(nc, command_mt)
  return nc
end

local commands_mt = {
  __index = function(self, key)
    self[key] = new_command(key)
    return self[key]
  end
}

local enum_mt = {
  __call = function(enum, metadata)
    return enum.attr(enum.NAME, metadata)
  end
}

local function new_enum(key, attr)
  local ne = {}
  ne.NAME = string.gsub(key, "_", " ")
  ne.attr = attr
  setmetatable(ne, enum_mt)
  return ne
end

local attr_mt = {
  __index = function(self, key)
    local enums = rawget(self, "_enums")
    if rawget(self, key) ~= nil then
      return rawget(self, key)
    elseif enums[key] ~= nil then
      return enums[key]
    else
      enums[key] = new_enum(key, self)
      return enums[key]
    end
  end,
  __call = function(attr, value, metadata)
    local event = {}
    if type(value) ~= "table" then
      value = {value = value}
    end
    -- This is trying to handle the most common case of expecting a single `value` within the generated
    -- event, but not wanting the developer to have to wrap every emit_event with `{value = their_event_value}`
    if value.value == nil then
      value = {value = value}
    end
    event.capability = attr.capability
    event.attribute = attr
    event.value = value
    utils.merge(event, metadata)
    return event
  end
}

local function new_attr(key, cap)
  local na = {}
  na.ID = key
  na.NAME = key
  na._enums = {}
  na.capability = cap
  setmetatable(na, attr_mt)
  return na
end

local cap_metatable = {
  __index = function(self, key)
    local attrs = rawget(self, "_attributes")
    if attrs[key] ~= nil then
      return attrs[key]
    elseif rawget(self, key) ~= nil then
      return rawget(self, key)
    else
      attrs[key] = new_attr(key, self)
      return attrs[key]
      end
  end
}

local function new_cap(key)
  local nc = {}
  nc.ID = key
  nc.NAME = key
  nc.version = 1
  nc._attributes = {}
  nc.commands = {}
  setmetatable(nc.commands, commands_mt)
  setmetatable(nc, cap_metatable)
  return nc
end

local reactive_capabilities = {}
setmetatable(reactive_capabilities, {
  __index = function(self, key)
    if capability_utils[key] ~= nil then
      return capability_utils[key]
    elseif cap_cache[key] ~= nil then
      return cap_cache[key]
    else
      cap_cache[key] = new_cap(key)
      return cap_cache[key]
    end
  end

})

reactive_capabilities.build_cap_from_json_string = function(cap_json, _pre_inlined)
  local raw_cap = json.decode(cap_json)
  return new_cap(raw_cap.id)
end

reactive_capabilities.stringify_event = function(value)
  local t = type(value)
  if (t == "string") then
    return value
  elseif (t == "number") then
    return tostring(value)
  elseif (t == "table") then
    return utils.stringify_table(value)
  end
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

  return edge_device_event
end

capability_utils.emit_event = function(device, component_id, sock, event)
  local empty_json_object = {}
  setmetatable(empty_json_object, {__jsontype = "object"})
  if type(event.value) ~= "table" then
    event.value = { value = event.value }
  end
  local edge_device_event = capability_utils.raw_event_to_edge_event(component_id, event)
  device.log.info_with({ hub_logs = true }, string.format("emitting event: %s", json.encode(edge_device_event)))
  local _, err = sock:send(device.id, json.encode(edge_device_event))
  if err ~= nil then
    log.warn_with({ hub_logs = true }, "Failed to send event: " .. utils.stringify_table(event.value) .. " for " .. event.capability.NAME .. "." .. event.attribute.NAME .. " " .. tostring(err))
    return nil
  end
  return edge_device_event
end

capability_utils.validate_and_normalize_command = function(self, cap_command_table)
  return cap_command_table
end

return reactive_capabilities
