-- Copyright 2021 SmartThings
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
local log = require "log"
local thread = require "st.thread"
local capabilities = require "st.capabilities"
local base64 = require "base64"
local json = require "st.json"
local devices_api = _envlibrequire("devices")
local utils = require "st.utils"

--- @module device
local device_module = {}

local STATE_CACHE_KEY = "__state_cache"
local PARENT_KEY = "__parent_device"

device_module.NETWORK_TYPE_ZIGBEE = "DEVICE_ZIGBEE"
device_module.NETWORK_TYPE_ZWAVE = "DEVICE_ZWAVE"
device_module.NETWORK_TYPE_MATTER = "DEVICE_MATTER"
device_module.NETWORK_TYPE_CHILD = "DEVICE_EDGE_CHILD"
device_module.NETWORK_TYPE_LAN = "DEVICE_LAN"
device_module.FIND_CHILD_KEY = "__find_child_fn"

local st_store_mt = {}
st_store_mt.__newindex = function(self, key, value)
    error("st_store is for readonly SmartThings info only. Use set_field to add a value to the device.")
end
st_store_mt.__index = function(self, key)
    local mt = getmetatable(self)
    local values = mt.__proxies[self]
    return values[key]
end
st_store_mt.__pairs = function(self)
    local mt = getmetatable(self)
    local values = mt.__proxies[self]
    return pairs(values)
end
st_store_mt.__proxies = setmetatable({}, {__mode = "k" })

local function convert_st_store_to_readonly(value)
    if type(value) ~= "table" then
        return value
    end
    local proxy = {}
    for k,v in pairs(value) do
        if type(v) == "table" then
            value[k] = convert_st_store_to_readonly(v)
        end
    end
    setmetatable(proxy, st_store_mt)
    st_store_mt.__proxies[proxy] = value
    return proxy
end

local function convert_and_set_st_store(device, raw_st_store)
    if raw_st_store.zigbee_eui then
        raw_st_store.zigbee_eui = base64.decode(raw_st_store.zigbee_eui)
    end

    -- Build a more natural component structure
    for comp_id, component in pairs(raw_st_store.profile.components) do
        component.emit_event = function(self, capability_event)
            device:emit_component_event(component, capability_event)
        end
    end

    local device_mt = getmetatable(device)

    if raw_st_store.profile.components.main ~= nil then
        device_mt.__values["emit_event"] = raw_st_store.profile.components.main.emit_event
    else
        device_mt.__values["emit_event"] = function(...)
            local err_msg = string.format("Device %s does not have \"main\" component, use component specific event generation", device.id)
            log.warn_with({ hub_logs = true }, err_msg)
            return false, err_msg
        end
    end

    local new_st_store = convert_st_store_to_readonly(raw_st_store)
    device_mt.__values["st_store"] = new_st_store
end

-- Device definition
--- @class st.Device
---
--- A device object contains all of the information we have about a given device that is set to be managed by this
--- driver.  It also provides a number of utility functions that make normal operations for dealing with devices
--- simpler.
---
--- @field public transient_store table Used to store driver specific data about a device that will not persist through driver restart.
--- @field public persistent_store table Used to store driver specific data about a device that will be persisted through restart.  The actual flash writes are on a schedule so some data loss is possible if the hub experiences a power loss
--- @field public st_store table Contains the SmartThings device model.  Read only and can be updated as a result of changes made elsewhere in the system.
--- @field public state_cache table Caches the most recent event state generated for each component/capability/attribute this is per run session, and is persisted through restart.
--- @field public thread st.thread.Thread The handle to the cosock thread that executes events for this device. This can also be used directly to schedule your own events or use its `register_socket` function to handle a device-specific socket.
local Device = {}
Device.CLASS_NAME = "Device"

--- @function Device:emit_event
--- Emit a capability event for this devices main component.  Will log a warning and do nothing if there is no "main" component on the device
---
--- @param capability_event table the capability event to emit
local function emit_event(self, capability_event) end

--- @function component:emit_event
--- Emit a capability event for the corresponding component
---
--- @param capability_event table the capability event to emit
local function comp_emit_event(self, capability_event) end

--- Generate a capability event for this device and component
---
--- Usage: ``device:emit_component_event(device.profile.components.main, capabilities.switch.switch.on())``
---
--- @param component table The component to generate this event for
--- @param capability_event table The event table generated from a capability
--- @return table The converted SmartThings event generated by this device
function Device:emit_component_event(component, capability_event)
    if not self:supports_capability(capability_event.capability, component.id) then
        local err_msg = string.format("Attempted to generate event for %s.%s but it does not support capability %s", self.id, component.id, capability_event.capability.NAME)
        log.warn_with({ hub_logs = true }, err_msg)
        return false, err_msg
    end
    local event, err = capabilities.emit_event(self, component.id, self.capability_channel, capability_event)
    if event ~= nil then
        self.state_cache[component.id] = self.state_cache[component.id] or {}
        self.state_cache[component.id][capability_event.capability.ID] = self.state_cache[component.id][capability_event.capability.ID] or {}
        self.state_cache[component.id][capability_event.capability.ID][capability_event.attribute.NAME] = event.state
    end
    if err ~= nil then
        log.warn_with({ hub_logs = true }, err)
    end
    return event, err
end

local function device_index(self, key)
    local mt = getmetatable(self)

    local base_value = mt.__values[key]
    if base_value ~= nil then
        return base_value
    end

    local st_store = mt.__values["st_store"]
    if type(st_store) == "table" and st_store[key] ~= nil then
        return st_store[key]
    end

    local override_fns = mt.__values["override_fns"]
    if type(override_fns) == "table" and override_fns[key] ~= nil then
        return override_fns[key]
    end

    return mt.__cls[key]
end

local function device_new_index(self, key, value)
    error("Device table access is readonly.  Use set_field to add a new field to the device.")
end

local function device_pairs(self)
    local mt = getmetatable(self)
    return pairs(mt.__values)
end

local function new_device_mt(cls, device_proto)
    local mt = {}
    mt.__values = device_proto
    mt.__cls = cls

    mt.__index = device_index
    mt.__newindex = device_new_index
    mt.__pairs = device_pairs
    mt.__tostring = cls.pretty_print
    return mt
end

--- Set a device specific value to be stored and retrieved when needed.  The key names are unique across both persistent and transient stores.
---
--- @param field string The field name for this value
--- @param value value The value to set the field to. If setting to persistent store it must be serializable
--- @param addtional_params table Optional: contains additional description of the field.  Currently only usage is the `persist` field which, if true, will store the field to the persistent store instead of transient
function Device:set_field(field, value, additional_params)
    local persisted = false
    if field == nil then
        error("Field key cannot be nil", 2)
    end

    if type(additional_params) == "table" then
        persisted = additional_params["persist"] or false
    elseif type(additional_params) ~= "nil" then
        error("additional_params must be a table")
    end
    -- Clear the old value out if it existed.
    self.transient_store[field] = nil
    self.persistent_store[field] = nil

    -- Set the new value in the corresponding persistence table
    if persisted then
        self.persistent_store[field] = value
    else
        self.transient_store[field] = value
    end
end

--- Get the `st.Device` object that is the parent of this device.  This _can_ result in a blocking request for the
--- parents device data, and can be subject to race conditions based on order of data sync.  This should _NOT_ be used
--- within an `added` or `init` lifecycle event to avoid race conditions and deadlocks.
---
--- @return st.Device the parent device object of this device
function Device:get_parent_device()
    local parent_device = self:get_field(PARENT_KEY)
    if parent_device == nil then
        parent_device = self.driver:get_device_info(self.parent_device_id)
        self:set_field(PARENT_KEY, parent_device)
    end
    return parent_device
end

--- Set a function used to find a child given an "endpoint" input specific to each protocol
---
--- @param find_child_fn function A function that takes a protocol specific endpoint identifier to find a child from
function Device:set_find_child(find_child_fn)
    self:set_field(device_module.FIND_CHILD_KEY, find_child_fn)
end

--- Get a list of all the children of this device
---
--- @return st.Device[] a list of the child devices of this device.  The type will be specific to the protocol
function Device:get_child_list()
  -- TODO: revisit once inventory child list is completed
  local dev_list = {}
  for uuid, dev in pairs(self.driver:get_devices()) do
    if dev.parent_device_id == self.id then
      table.insert(dev_list, dev)
    end
  end
  return dev_list
end

--- Find a child of this device by the parent assigned child key given at creation
---
--- @param parent_assigned_key string the key assigned by the parent to identify a child at creation
--- @return st.Device|st.zigbee.ChildDevice|st.zwave.ChildDevice|st.matter.ChildDevice|nil the child device with this key
function Device:get_child_by_parent_assigned_key(parent_assigned_key)
    -- TODO: optimize when possible from child device list in st_store
    for uuid, dev in pairs(self.driver:get_devices()) do
        if dev.parent_device_id == self.id then
            if dev.parent_assigned_child_key == parent_assigned_key then
                return dev
            end
        end
    end
end

--- Retrieve the value a previously set field.  nil if non-existent
---
--- @param field string The field name for this value
--- @return value value The value the field was set to.
function Device:get_field(field)
    if self.transient_store[field] ~= nil then
        return self.transient_store[field]
    elseif self.persistent_store[field] ~= nil then
        return self.persistent_store[field]
    end
end

--- Check if this device has a capability in its profile
---
--- @param capability Capability The capability to check for existence
--- @param component string Optional: The component id to check for capability support.  If nil, any component match will return true
--- @return boolean true if the capability is present in this devices profile
function Device:supports_capability(capability, component)
  return self:supports_capability_by_id(capability.ID, component)
end

--- Check if this device has a component_id in its profile
---
--- @param component_id string
--- @return boolean true if the component is present in this devices profile
function Device:component_exists(component_id)
  for comp_id, _ in pairs(self.st_store.profile.components) do
      if (component_id == comp_id) then
        return true
      end
  end
  return false
end

--- Get the latest state of this device for a given component, capability, attribute
---
--- @param component_id string the component ID to get the state for
--- @param capability_id string the capability ID to get the state for
--- @param attribute_name string the capability attribute name to get the state for
--- @param default_value any Optional value to return if the state_cache for the lookup is nil
--- @param default_state_table any Optional value to return if the state_cache for the lookup is nil
--- @return any, any The first return value is the state.value present for the attribute, the second return is the state
---                  table (e.g. it would include both the value and unit keys if both are present)
function Device:get_latest_state(component_id, capability_id, attribute_name, default_value, default_state_table)
    utils.verify_type(component_id, "string", "component_id")
    utils.verify_type(capability_id, "string", "capability_id")
    utils.verify_type(attribute_name, "string", "attribute_name")
    local state = ((self.state_cache[component_id] or {})[capability_id] or {})[attribute_name]
    local value = (state or {}).value
    if value == nil then
        value = default_value
    end
    if state == nil then
        state = default_state_table
    end
    return value, state
end

--- @return number count of components in device profile
function Device:component_count()
  local i = 0
  for _, _ in pairs(self.st_store.profile.components) do
    i = i + 1
  end
  return i
end

--- Check if this device has a capability_id in its profile
---
--- @param capability_id string The capability ID to check for existence
--- @param component string Optional: The component id to check for capability support.  If nil, any component match will return true
--- @return boolean true if the capability is present in this devices profile
function Device:supports_capability_by_id(capability_id, component)
    for comp_id, comp in pairs(self.st_store.profile.components) do
        if (component == nil) or (component == comp_id) then
            for cap_id, cap in pairs(comp.capabilities) do
                if cap.id == capability_id then
                    return true
                end
            end
        end
    end
    return false
end

local log_mt = {}
function log_mt.__index(self, key)
    if key == "log" then
        return function(opts, level, ...)
            log.log(opts, level, tostring(self.device) .. " " .. ...)
        end
    elseif string.find(key, "_with") ~= nil then
        return log[key] and function(opts, ...) log[key](opts, tostring(self.device) .. " " .. ...) end or nil
    else
        return log[key] and function(...) log[key](tostring(self.device) .. " " .. ...) end or nil
    end
end

local function pers_store_new_index(self, key, value)
    local mt = getmetatable(self)
    if mt == nil then
        error("Device has persistent_store with no metatable")
    end

    if mt.__transient_store[key] ~= nil and value ~= nil then
        log.warn_with({ hub_logs = true }, "Key: " .. key .. " already exists in the transient store.  Use set_field if you want to move it.")
    else
        mt.__persistent_store[key] = value
    end
end
local function pers_store_index(self, key)
    local mt = getmetatable(self)
    if mt == nil then
        error("Device has persistent_store with no metatable")
    end
    return mt.__persistent_store[key]
end

local function pers_store_pairs(self)
    local mt = getmetatable(self)
    if mt == nil then
        error("Device has persistent_store with no metatable")
    end
    return pairs(mt.__persistent_store)
end


local function trans_store_new_index(self, key, value)
    local mt = getmetatable(self)
    if mt.__persistent_store[key] ~= nil and value ~= nil then
        log.warn_with({ hub_logs = true }, "Key: " .. key .. " already exists in the persistent store.  Use set_field if you want to move it.")
    else
        rawset(self, key, value)
    end
end

Device.init = function(cls, driver, raw_device)
    local device = {}

    device.log = setmetatable({}, log_mt)

    device.capability_channel = driver.capability_channel
    device.device_api = driver.device_api

    driver.datastore.__devices_store = driver.datastore.__devices_store or {}
    driver.datastore.__devices_store[raw_device.id] = driver.datastore.__devices_store[raw_device.id] or {}

    device.transient_store = {}

    local pers_store_mt = {}
    pers_store_mt.__newindex = pers_store_new_index
    pers_store_mt.__index = pers_store_index
    pers_store_mt.__pairs = pers_store_pairs
    pers_store_mt.__persistent_store = driver.datastore.__devices_store[raw_device.id]
    pers_store_mt.__transient_store = device.transient_store

    device.persistent_store = setmetatable({}, pers_store_mt)
    device.datastore = driver.datastore

    device.override_fns = {}

    device.persistent_store[STATE_CACHE_KEY] = device.persistent_store[STATE_CACHE_KEY] or {}
    device.state_cache = device.persistent_store[STATE_CACHE_KEY]

    device.thread = thread.Thread(driver, raw_device.label)

    local trans_store_mt = {}
    trans_store_mt.__newindex = trans_store_new_index
    trans_store_mt.__persistent_store = device.persistent_store
    setmetatable(device.transient_store, trans_store_mt)

    device.driver = driver

    return device
end

--- Send a request to update only the changed metadata of a device.
---
--- Example usage: ``device:try_update_metadata({profile = "bulb.rgb.v1", vendor_provided_label = "My RGB Bulb"})``
---
--- All metadata fields are type string. Valid metadata fields are:
---
--- For all network types (LAN/ZIGBEE/ZWAVE/MATTER):
---     profile - profile name defined in the profile .yaml file.
---     provisioning_state - the provisioning state of the device (TYPED/PROVISIONED/NONFUNCTIONAL)
---
--- LAN specific:
---     manufacturer - device manufacturer
---     model - model name of the device
---     vendor_provided_label - device label provided by the manufacturer/vendor
---
--- @param metadata table A table of device metadata
function Device:try_update_metadata(metadata)
  -- Ensure that data provided to this method as input is of `type` `table`
  if type(metadata) ~= "table" then
    error(string.format("New metadata provided to update device driver is of type `%s`, which is not of the expected type `table`.", type(metadata)), 2)
  end
  
  -- Table used to store data to be encoded to JSON
  local normalized_metadata = {}
  
  -- Counter for number of elements in `metadata` table
  local normalized_metadata_table_size = 0
  
  -- Provisioning state of device is expected to be valid for the following:
  -- `TYPED`
  -- `PROVISIONED`
  -- `NONFUNCTIONAL`
  local valid_provisioning_state_options = {
    ["TYPED"] = true,
    ["PROVISIONED"] = true,
    ["NONFUNCTIONAL"] = true
  }
  
  -- Unlikely case but still checked if the case where self.id is nil or not of type `string`
  if self.id == nil then
    error("Device `id` is missing but is required.", 2)
  elseif type(self.id) ~= "string" then
    error(string.format("Value provided for device id is of type `%s`, which is not of the expected type `string`.", type(self.id)), 2)
  end
  normalized_metadata.deviceId = self.id
  normalized_metadata_table_size = normalized_metadata_table_size + 1
  
  for metadata_key, metadata_value in pairs(metadata) do
    if type(metadata_value) ~= "string" then
      error(string.format("Value provided for device key `%s` is of type `%s`, which is not of the expected type `string`.", metadata_key, type(metadata_value)), 2)
    elseif metadata_key == "provisioning_state" and valid_provisioning_state_options[metadata_value] == nil then
      error("Invalid `provisioning_state` value provided.", 2)
    end
    normalized_metadata_table_size = normalized_metadata_table_size + 1
  end
  
  -- Store only data of interest
  local normalized_metadata = {
    deviceId = self.id,
    profileReference = metadata.profile,
    provisioningState = metadata.provisioning_state,
    manufacturer = metadata.manufacturer,
    model = metadata.model,
    vendorProvidedLabel = metadata.vendor_provided_label
  }
  
  if normalized_metadata_table_size == 1 then
    log.warn("Method call to update the device's metadata was provided the device's id only.")
    -- return value 1 chosen since this is the success case for the `st_devices.update_device` call
    return 1
  end
  
  local metadata_json = json.encode(normalized_metadata)
  if metadata_json == nil then
    error("error parsing device metadata", -1)
  end
  return devices_api.update_device(self.id, metadata_json)
end

Device._protect = function(cls, device)
    local mt = new_device_mt(cls, device)
    -- set metatable to new table to ensure device is readonly
    local final_device = setmetatable({}, mt)
    -- the internal device.log needs access to the final device's __tostring method
    device.log.device = final_device
    return final_device
end


--- @function Device.build
--- Build a device object from a raw st_store of the SmartThings device model
---
--- @param cls table The Device class
--- @param driver Driver The driver context this device will run under
--- @param raw_device table The SmartThings device model representation, used to populate the st_store and generate
---                         helper event generation functions
--- @return Device The created device
function Device.build(cls, driver, raw_device)

    local device = Device.init(cls, driver, raw_device)

    device = Device._protect(cls, device)

    -- This is the data synced from the cloud and will be overwritten when data is updated
    device:load_updated_data(raw_device)

    return device
end


--- Update the st_store data with newly provided data from the cloud.
function Device:load_updated_data(new_device_data)
    convert_and_set_st_store(self, new_device_data)
    return self
end


--- Add a function to this device object, or override an existing function
---
--- @param func_name string the name of the function to add/overwrite
--- @param func function the function to add to the device object
function Device:extend_device(func_name, func)
    self.override_fns[func_name] = func
end

--- This will do any necessary cleanup if the device is removed.  The device object will not
--- be functional after this call.
function Device:deleted()
    if self.thread then
        self.thread:close()
    end

    self.datastore.__devices_store[self.id] = nil
    self.datastore:save()
    local old_id = self.id
    local new_mt = {}
    new_mt.__index = function(s, key)
        log.warn_with({ hub_logs = true }, "This device (former ID: " .. old_id .. ") has been deleted, and is no longer usable")
        return nil
    end
    new_mt.__newindex = function(s, key, value)
        log.warn_with({ hub_logs = true }, "This device (former ID: " .. old_id .. ") has been deleted, and is no longer usable")
        return nil
    end
    setmetatable(self, new_mt)
end

--- Private function for updating store values, should not be called outside of `st.driver`
---@param merge_table table
function Device:_updated(merge_table)
    if type(merge_table) ~= "table" then
        error(string.format("Expected table found %q", type(merge_table)))
    end
    for k,v in pairs(merge_table or {}) do
        local persist = false
        if k == "persistent_store" then
            persist = true
        elseif k ~= "transient_store" then
            error(string.format("can only update datastore values %q is not a know store", k))
        end
        if type(v) ~= "table" then
            error(string.format("Expected store value to be a table found %q", type(v)))
        end
        for k,v in pairs(v) do
            self:set_field(k, v, {persist = persist})
        end
    end
end

--- Get a string with the ID and label of the device
---
--- @return string a short string representation of the device
function Device:pretty_print()
    local label_str = ""
    if self.label ~= nil then
        label_str = string.format(" (%s)", self.label)
    end
    return string.format("<%s: %s%s>", self.CLASS_NAME, self.id, label_str)
end

--- Mark device as being online
---
--- Only useable on LAN type devices and children of LAN type devices. Calls to this API for
--- ZIGBEE, ZWAVE, or MATTER type devices are ignored as their online/offline status are
--- automatically determined at the radio level. When a parent device is marked online, the
--- online state of its children will be determined independently (i.e. they can be either
--- online or offline).
---
--- @return status boolean Status of whether the call was successful or not
--- @return error string The error that occured if status was falsey
function Device:online()
    return self.device_api.device_online(self)
end

--- Mark device as being offline and unavailable
---
--- Only useable on LAN type devices and children of LAN type devices. Calls to this API for
--- ZIGBEE, ZWAVE, or MATTER type devices are ignored as their online/offline status are
--- automatically determined at the radio level. When a parent device is marked offline,
--- its children will also be marked offline.
---
--- @return status boolean Status of whether the call was successful or not
--- @return error string The error that occured if status was falsey
function Device:offline()
    return self.device_api.device_offline(self)
end

--- Register a capability command to be handled natively by the hub.
---
--- Starting with API version 11, the hub can run the Zigbee/Z-Wave/Matter default handler implementations
--- for some capability commands outside of the driver's Lua environment. A driver can opt-in to using these
--- handlers for capability commands which will provide substantial latency improvements over the
--- handlers defined in the driver.
---
--- When handled natively, a command will not be forwarded to the driver; however, all protocol messages
--- received from the device will still be handled by the driver.
---
--- If a particular command cannot be supported for a device, this API will return an error message. Only
--- single component Matter, Z-Wave, and Zigbee devices  currently support having commands handled natively. And
--- only some capability commands (i.e. ``switch`` ``on``/``off`` and ``switchLevel`` ``setLevel``) are available
--- for those devices.
---
--- It is expected that even if a driver is opting into this functionality, that the driver provides a handler
--- for all the capability commands it supports. This functionality is a latency optimization and there are no
--- guarantees that it will always be available to a driver on all hub platforms.
---
--- @param capability_id string The ID of the capability to be handled natively
--- @param capability_cmd_id string The ID of the command to be handled natively
--- @return status|nil userdata if success, or nil if there was an error
--- @return nil|error string error message if an any
function Device:register_native_capability_cmd_handler(capability_id, capability_cmd_id)
    if self.network_type == self.NETWORK_TYPE_LAN or self.network_type == self.NETWORK_TYPE_CHILD then
        return nil, string.format("Native capability cmd handling not supported for device type %s", self.network_type)
    elseif utils.table_size(self.profile.components) > 1 then
        return nil, "Native capability cmd handling not supported for multi component devices"
    end
    self.log.info_with({hub_logs = true}, string.format("registering for %s:%s command to be handled natively", capability_id, capability_cmd_id))
    if type(self.device_api.register_native_capability_cmd_handler) == "function" then
        return self.device_api.register_native_capability_cmd_handler(self.id, capability_id, capability_cmd_id)
    else
        return nil, "Native handlers not supported on hub"
    end
end

setmetatable(Device, {
    __call = Device.build,
})
device_module.Device = Device

return device_module
