-- Copyright 2024 SmartThings
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

-- THIS CODE IS AUTOMATICALLY GENERATED BY zwave_lib_generator/gen.py.  DO NOT HAND EDIT.
--
-- Protocol definition XML version: 2.7.4

local zw = require "st.zwave"
local buf = require "st.zwave.utils.buf"
local utils = require "st.utils"

--- @class st.zwave.CommandClass.Battery
--- @alias Battery st.zwave.CommandClass.Battery
---
--- Supported versions: 1,2,3
---
--- @field public GET number 0x02 - BATTERY_GET command id
--- @field public REPORT number 0x03 - BATTERY_REPORT command id
--- @field public HEALTH_GET number 0x04 - BATTERY_HEALTH_GET command id
--- @field public HEALTH_REPORT number 0x05 - BATTERY_HEALTH_REPORT command id
local Battery = {}
Battery.GET = 0x02
Battery.REPORT = 0x03
Battery.HEALTH_GET = 0x04
Battery.HEALTH_REPORT = 0x05

Battery._commands = {
  [Battery.GET] = "GET",
  [Battery.REPORT] = "REPORT",
  [Battery.HEALTH_GET] = "HEALTH_GET",
  [Battery.HEALTH_REPORT] = "HEALTH_REPORT"
}

--- Instantiate a versioned instance of the Battery Command Class module, optionally setting strict to require explicit passing of all parameters to constructors.
---
--- @param params st.zwave.CommandClass.Params command class instance parameters
--- @return st.zwave.CommandClass.Battery versioned command class instance
function Battery:init(params)
  local version = params and params.version or nil
  if (params or {}).strict ~= nil then
  local strict = params.strict
  else
  local strict = true -- default
  end
  local strict = params and params.strict or nil
  assert(version == nil or zw._versions[zw.BATTERY][version] ~= nil, "unsupported version")
  assert(strict == nil or type(strict) == "boolean", "strict must be a boolean")
  local mt = {
    __index = self
  }
  local instance = setmetatable({}, mt)
  instance._serialization_version = version
  instance._strict = strict
  return instance
end

setmetatable(Battery, {
  __call = Battery.init
})

Battery._serialization_version = nil
Battery._strict = false
zw._deserialization_versions = zw.deserialization_versions or {}
zw._versions = zw._versions or {}
setmetatable(zw._deserialization_versions, { __index = zw._versions })
zw._versions[zw.BATTERY] = {
  [1] = true,
  [2] = true,
  [3] = true
}

--- @class st.zwave.CommandClass.Battery.GetV1Args
--- @alias GetV1Args st.zwave.CommandClass.Battery.GetV1Args
local GetV1Args = {}

--- @class st.zwave.CommandClass.Battery.GetV1:st.zwave.Command
--- @alias GetV1 st.zwave.CommandClass.Battery.GetV1
---
--- v1 and forward-compatible v2,v3 BATTERY_GET
---
--- @field public cmd_class number 0x80
--- @field public cmd_id number 0x02
--- @field public version number 1
--- @field public args st.zwave.CommandClass.Battery.GetV1Args command-specific arguments
local GetV1 = {}
setmetatable(GetV1, {
  __index = zw.Command,
  __call = function(cls, self, ...)
    local mt = {
      __index = function(tbl, key)
        if key == "payload" then
          return tbl:serialize()
        else
          return cls[key]
        end
      end,
      __tostring = zw.Command.pretty_print,
      __eq = zw.Command.equals
    }
    local instance = setmetatable({}, mt)
    instance:init(self, ...)
    return instance
  end,
})

--- Initialize a v1 and forward-compatible v2,v3 BATTERY_GET object.
---
--- @param module st.zwave.CommandClass.Battery command class module instance
--- @param args st.zwave.CommandClass.Battery.GetV1Args command-specific arguments
function GetV1:init(module, args, ...)
  zw.Command._parse(self, module, zw.BATTERY, Battery.GET, 1, args, ...)
end

--- Serialize v1 or forward-compatible v2,v3 BATTERY_GET arguments.
---
--- @return string serialized payload
function GetV1:serialize()
  local writer = buf.Writer()
  return writer.buf
end

--- Deserialize a v1 or forward-compatible v2,v3 BATTERY_GET payload.
---
--- @return st.zwave.CommandClass.Battery.GetV1Args deserialized arguments
function GetV1:deserialize()
  local reader = buf.Reader(self.payload)
  return reader.parsed
end

--- Return a deep copy of self.args, merging defaults for unset, but required parameters.
---
--- @param self st.zwave.CommandClass.Battery.GetV1
--- @return st.zwave.CommandClass.Battery.GetV1Args
function GetV1._defaults(self)
  return {}
end

--- Return a deep copy of self.args, merging defaults for all unset parameters.
---
--- @param self st.zwave.CommandClass.Battery.GetV1
--- @return st.zwave.CommandClass.Battery.GetV1Args
function GetV1._template(self)
  return {}
end

--- Set defaults for any required, but unset arguments.
---
--- @param self st.zwave.CommandClass.Battery.GetV1
function GetV1._set_defaults(self)
  local defaults = self:_defaults()
  utils.merge(self.args, defaults)
end

--- Set const reflectors to allow enum stringification.
---
--- @param self st.zwave.CommandClass.Battery.GetV1
function GetV1._set_reflectors(self)
end

--- @class st.zwave.CommandClass.Battery.ReportV1Args
--- @alias ReportV1Args st.zwave.CommandClass.Battery.ReportV1Args
--- @field public battery_level integer see :lua:class:`Battery.battery_level <st.zwave.CommandClass.Battery.battery_level>`
local ReportV1Args = {}

--- @class st.zwave.CommandClass.Battery.ReportV1:st.zwave.Command
--- @alias ReportV1 st.zwave.CommandClass.Battery.ReportV1
---
--- v1 BATTERY_REPORT
---
--- @field public cmd_class number 0x80
--- @field public cmd_id number 0x03
--- @field public version number 1
--- @field public args st.zwave.CommandClass.Battery.ReportV1Args command-specific arguments
local ReportV1 = {}
setmetatable(ReportV1, {
  __index = zw.Command,
  __call = function(cls, self, ...)
    local mt = {
      __index = function(tbl, key)
        if key == "payload" then
          return tbl:serialize()
        else
          return cls[key]
        end
      end,
      __tostring = zw.Command.pretty_print,
      __eq = zw.Command.equals
    }
    local instance = setmetatable({}, mt)
    instance:init(self, ...)
    return instance
  end,
})

--- Initialize a v1 BATTERY_REPORT object.
---
--- @param module st.zwave.CommandClass.Battery command class module instance
--- @param args st.zwave.CommandClass.Battery.ReportV1Args command-specific arguments
function ReportV1:init(module, args, ...)
  zw.Command._parse(self, module, zw.BATTERY, Battery.REPORT, 1, args, ...)
end

--- Serialize v1 BATTERY_REPORT arguments.
---
--- @return string serialized payload
function ReportV1:serialize()
  local writer = buf.Writer()
  local args = self.args
  writer:write_u8(args.battery_level)
  return writer.buf
end

--- Deserialize a v1 BATTERY_REPORT payload.
---
--- @return st.zwave.CommandClass.Battery.ReportV1Args deserialized arguments
function ReportV1:deserialize()
  local reader = buf.Reader(self.payload)
  reader:read_u8("battery_level")
  return reader.parsed
end

--- Return a deep copy of self.args, merging defaults for unset, but required parameters.
---
--- @param self st.zwave.CommandClass.Battery.ReportV1
--- @return st.zwave.CommandClass.Battery.ReportV1Args
function ReportV1._defaults(self)
  local args = {}
  args.battery_level = self.args.battery_level or 0
  return args
end

--- Return a deep copy of self.args, merging defaults for all unset parameters.
---
--- @param self st.zwave.CommandClass.Battery.ReportV1
--- @return st.zwave.CommandClass.Battery.ReportV1Args
function ReportV1._template(self)
  local args = self:_defaults()
  return args
end

--- Set defaults for any required, but unset arguments.
---
--- @param self st.zwave.CommandClass.Battery.ReportV1
function ReportV1._set_defaults(self)
  local defaults = self:_defaults()
  utils.merge(self.args, defaults)
end

--- Set const reflectors to allow enum stringification.
---
--- @param self st.zwave.CommandClass.Battery.ReportV1
function ReportV1._set_reflectors(self)
  local args = self.args
  args._reflect = args._reflect or {}
  args._reflect.battery_level = function()
    return zw._reflect(
      Battery._reflect_battery_level,
      args.battery_level
    )
  end
end

--- @class st.zwave.CommandClass.Battery.ReportV2Args
--- @alias ReportV2Args st.zwave.CommandClass.Battery.ReportV2Args
--- @field public battery_level integer see :lua:class:`Battery.battery_level <st.zwave.CommandClass.Battery.battery_level>`
--- @field public replace_recharge integer [0,3]
--- @field public low_fluid boolean
--- @field public overheating boolean
--- @field public backup_battery boolean
--- @field public rechargeable boolean
--- @field public charging_status integer see :lua:class:`Battery.charging_status <st.zwave.CommandClass.Battery.charging_status>`
--- @field public disconnected boolean
local ReportV2Args = {}

--- @class st.zwave.CommandClass.Battery.ReportV2:st.zwave.Command
--- @alias ReportV2 st.zwave.CommandClass.Battery.ReportV2
---
--- v2 BATTERY_REPORT
---
--- @field public cmd_class number 0x80
--- @field public cmd_id number 0x03
--- @field public version number 2
--- @field public args st.zwave.CommandClass.Battery.ReportV2Args command-specific arguments
local ReportV2 = {}
setmetatable(ReportV2, {
  __index = zw.Command,
  __call = function(cls, self, ...)
    local mt = {
      __index = function(tbl, key)
        if key == "payload" then
          return tbl:serialize()
        else
          return cls[key]
        end
      end,
      __tostring = zw.Command.pretty_print,
      __eq = zw.Command.equals
    }
    local instance = setmetatable({}, mt)
    instance:init(self, ...)
    return instance
  end,
})

--- Initialize a v2 BATTERY_REPORT object.
---
--- @param module st.zwave.CommandClass.Battery command class module instance
--- @param args st.zwave.CommandClass.Battery.ReportV2Args command-specific arguments
function ReportV2:init(module, args, ...)
  zw.Command._parse(self, module, zw.BATTERY, Battery.REPORT, 2, args, ...)
end

--- Serialize v2 BATTERY_REPORT arguments.
---
--- @return string serialized payload
function ReportV2:serialize()
  local writer = buf.Writer()
  local args = self.args
  writer:write_u8(args.battery_level)
  writer:write_bits(2, args.replace_recharge)
  writer:write_bool(args.low_fluid)
  writer:write_bool(args.overheating)
  writer:write_bool(args.backup_battery)
  writer:write_bool(args.rechargeable)
  writer:write_bits(2, args.charging_status)
  writer:write_bool(args.disconnected)
  writer:write_bits(7, 0) -- reserved1
  return writer.buf
end

--- Deserialize a v2 BATTERY_REPORT payload.
---
--- @return st.zwave.CommandClass.Battery.ReportV2Args deserialized arguments
function ReportV2:deserialize()
  local reader = buf.Reader(self.payload)
  reader:read_u8("battery_level")
  reader:read_bits(2, "replace_recharge")
  reader:read_bool("low_fluid")
  reader:read_bool("overheating")
  reader:read_bool("backup_battery")
  reader:read_bool("rechargeable")
  reader:read_bits(2, "charging_status")
  reader:read_bool("disconnected")
  reader:read_bits(7) -- reserved1
  return reader.parsed
end

--- Return a deep copy of self.args, merging defaults for unset, but required parameters.
---
--- @param self st.zwave.CommandClass.Battery.ReportV2
--- @return st.zwave.CommandClass.Battery.ReportV2Args
function ReportV2._defaults(self)
  local args = {}
  args.battery_level = self.args.battery_level or 0
  args.replace_recharge = self.args.replace_recharge or 0
  args.low_fluid = self.args.low_fluid or false
  args.overheating = self.args.overheating or false
  args.backup_battery = self.args.backup_battery or false
  args.rechargeable = self.args.rechargeable or false
  args.charging_status = self.args.charging_status or 0
  args.disconnected = self.args.disconnected or false
  return args
end

--- Return a deep copy of self.args, merging defaults for all unset parameters.
---
--- @param self st.zwave.CommandClass.Battery.ReportV2
--- @return st.zwave.CommandClass.Battery.ReportV2Args
function ReportV2._template(self)
  local args = self:_defaults()
  return args
end

--- Set defaults for any required, but unset arguments.
---
--- @param self st.zwave.CommandClass.Battery.ReportV2
function ReportV2._set_defaults(self)
  local defaults = self:_defaults()
  utils.merge(self.args, defaults)
end

--- Set const reflectors to allow enum stringification.
---
--- @param self st.zwave.CommandClass.Battery.ReportV2
function ReportV2._set_reflectors(self)
  local args = self.args
  args._reflect = args._reflect or {}
  args._reflect.battery_level = function()
    return zw._reflect(
      Battery._reflect_battery_level,
      args.battery_level
    )
  end
  args._reflect = args._reflect or {}
  args._reflect.charging_status = function()
    return zw._reflect(
      Battery._reflect_charging_status,
      args.charging_status
    )
  end
end

--- @class st.zwave.CommandClass.Battery.HealthGetV2Args
--- @alias HealthGetV2Args st.zwave.CommandClass.Battery.HealthGetV2Args
local HealthGetV2Args = {}

--- @class st.zwave.CommandClass.Battery.HealthGetV2:st.zwave.Command
--- @alias HealthGetV2 st.zwave.CommandClass.Battery.HealthGetV2
---
--- v2 and forward-compatible v3 BATTERY_HEALTH_GET
---
--- @field public cmd_class number 0x80
--- @field public cmd_id number 0x04
--- @field public version number 2
--- @field public args st.zwave.CommandClass.Battery.HealthGetV2Args command-specific arguments
local HealthGetV2 = {}
setmetatable(HealthGetV2, {
  __index = zw.Command,
  __call = function(cls, self, ...)
    local mt = {
      __index = function(tbl, key)
        if key == "payload" then
          return tbl:serialize()
        else
          return cls[key]
        end
      end,
      __tostring = zw.Command.pretty_print,
      __eq = zw.Command.equals
    }
    local instance = setmetatable({}, mt)
    instance:init(self, ...)
    return instance
  end,
})

--- Initialize a v2 and forward-compatible v3 BATTERY_HEALTH_GET object.
---
--- @param module st.zwave.CommandClass.Battery command class module instance
--- @param args st.zwave.CommandClass.Battery.HealthGetV2Args command-specific arguments
function HealthGetV2:init(module, args, ...)
  zw.Command._parse(self, module, zw.BATTERY, Battery.HEALTH_GET, 2, args, ...)
end

--- Serialize v2 or forward-compatible v3 BATTERY_HEALTH_GET arguments.
---
--- @return string serialized payload
function HealthGetV2:serialize()
  local writer = buf.Writer()
  return writer.buf
end

--- Deserialize a v2 or forward-compatible v3 BATTERY_HEALTH_GET payload.
---
--- @return st.zwave.CommandClass.Battery.HealthGetV2Args deserialized arguments
function HealthGetV2:deserialize()
  local reader = buf.Reader(self.payload)
  return reader.parsed
end

--- Return a deep copy of self.args, merging defaults for unset, but required parameters.
---
--- @param self st.zwave.CommandClass.Battery.HealthGetV2
--- @return st.zwave.CommandClass.Battery.HealthGetV2Args
function HealthGetV2._defaults(self)
  return {}
end

--- Return a deep copy of self.args, merging defaults for all unset parameters.
---
--- @param self st.zwave.CommandClass.Battery.HealthGetV2
--- @return st.zwave.CommandClass.Battery.HealthGetV2Args
function HealthGetV2._template(self)
  return {}
end

--- Set defaults for any required, but unset arguments.
---
--- @param self st.zwave.CommandClass.Battery.HealthGetV2
function HealthGetV2._set_defaults(self)
  local defaults = self:_defaults()
  utils.merge(self.args, defaults)
end

--- Set const reflectors to allow enum stringification.
---
--- @param self st.zwave.CommandClass.Battery.HealthGetV2
function HealthGetV2._set_reflectors(self)
end

--- @class st.zwave.CommandClass.Battery.HealthReportV2Args
--- @alias HealthReportV2Args st.zwave.CommandClass.Battery.HealthReportV2Args
--- @field public maximum_capacity integer [0,255]
--- @field public size integer [0,7]
--- @field public scale integer [0,3]
--- @field public precision integer [0,7]
--- @field public battery_temperature number [-2147483648,2147483647]
local HealthReportV2Args = {}

--- @class st.zwave.CommandClass.Battery.HealthReportV2:st.zwave.Command
--- @alias HealthReportV2 st.zwave.CommandClass.Battery.HealthReportV2
---
--- v2 and forward-compatible v3 BATTERY_HEALTH_REPORT
---
--- @field public cmd_class number 0x80
--- @field public cmd_id number 0x05
--- @field public version number 2
--- @field public args st.zwave.CommandClass.Battery.HealthReportV2Args command-specific arguments
local HealthReportV2 = {}
setmetatable(HealthReportV2, {
  __index = zw.Command,
  __call = function(cls, self, ...)
    local mt = {
      __index = function(tbl, key)
        if key == "payload" then
          return tbl:serialize()
        else
          return cls[key]
        end
      end,
      __tostring = zw.Command.pretty_print,
      __eq = zw.Command.equals
    }
    local instance = setmetatable({}, mt)
    instance:init(self, ...)
    return instance
  end,
})

--- Initialize a v2 and forward-compatible v3 BATTERY_HEALTH_REPORT object.
---
--- @param module st.zwave.CommandClass.Battery command class module instance
--- @param args st.zwave.CommandClass.Battery.HealthReportV2Args command-specific arguments
function HealthReportV2:init(module, args, ...)
  zw.Command._parse(self, module, zw.BATTERY, Battery.HEALTH_REPORT, 2, args, ...)
end

--- Serialize v2 or forward-compatible v3 BATTERY_HEALTH_REPORT arguments.
---
--- @return string serialized payload
function HealthReportV2:serialize()
  local writer = buf.Writer()
  local args = self.args
  writer:write_u8(args.maximum_capacity)
  writer:write_bits(3, args.size or writer.size(args.battery_temperature))
  writer:write_bits(2, args.scale)
  writer:write_bits(3, args.precision or writer.precision(args.battery_temperature))
  writer:write_vfloat(args.size or writer.size(args.battery_temperature), args.precision or writer.precision(args.battery_temperature), args.battery_temperature)
  return writer.buf
end

--- Deserialize a v2 or forward-compatible v3 BATTERY_HEALTH_REPORT payload.
---
--- @return st.zwave.CommandClass.Battery.HealthReportV2Args deserialized arguments
function HealthReportV2:deserialize()
  local reader = buf.Reader(self.payload)
  reader:read_u8("maximum_capacity")
  reader:read_bits(3, "size")
  reader:read_bits(2, "scale")
  reader:read_bits(3, "precision")
  reader:read_vfloat(reader.parsed.size, reader.parsed.precision, "battery_temperature")
  return reader.parsed
end

--- Return a deep copy of self.args, merging defaults for unset, but required parameters.
---
--- @param self st.zwave.CommandClass.Battery.HealthReportV2
--- @return st.zwave.CommandClass.Battery.HealthReportV2Args
function HealthReportV2._defaults(self)
  local args = {}
  args.maximum_capacity = self.args.maximum_capacity or 0
  args.scale = self.args.scale or 0
  args.battery_temperature = self.args.battery_temperature or 0
  return args
end

--- Return a deep copy of self.args, merging defaults for all unset parameters.
---
--- @param self st.zwave.CommandClass.Battery.HealthReportV2
--- @return st.zwave.CommandClass.Battery.HealthReportV2Args
function HealthReportV2._template(self)
  local args = self:_defaults()
  local writer = buf.Writer()
  args.size = args.size or writer.size(args.battery_temperature)
  args.precision = args.precision or writer.precision(args.battery_temperature)
  return args
end

--- Set defaults for any required, but unset arguments.
---
--- @param self st.zwave.CommandClass.Battery.HealthReportV2
function HealthReportV2._set_defaults(self)
  local defaults = self:_defaults()
  utils.merge(self.args, defaults)
end

--- Set const reflectors to allow enum stringification.
---
--- @param self st.zwave.CommandClass.Battery.HealthReportV2
function HealthReportV2._set_reflectors(self)
end

--- @class st.zwave.CommandClass.Battery.ReportV3Args
--- @alias ReportV3Args st.zwave.CommandClass.Battery.ReportV3Args
--- @field public battery_level integer see :lua:class:`Battery.battery_level <st.zwave.CommandClass.Battery.battery_level>`
--- @field public replace_recharge integer [0,3]
--- @field public low_fluid boolean
--- @field public overheating boolean
--- @field public backup_battery boolean
--- @field public rechargeable boolean
--- @field public charging_status integer see :lua:class:`Battery.charging_status <st.zwave.CommandClass.Battery.charging_status>`
--- @field public disconnected boolean
--- @field public low_temperature_status boolean
local ReportV3Args = {}

--- @class st.zwave.CommandClass.Battery.ReportV3:st.zwave.Command
--- @alias ReportV3 st.zwave.CommandClass.Battery.ReportV3
---
--- v3 BATTERY_REPORT
---
--- @field public cmd_class number 0x80
--- @field public cmd_id number 0x03
--- @field public version number 3
--- @field public args st.zwave.CommandClass.Battery.ReportV3Args command-specific arguments
local ReportV3 = {}
setmetatable(ReportV3, {
  __index = zw.Command,
  __call = function(cls, self, ...)
    local mt = {
      __index = function(tbl, key)
        if key == "payload" then
          return tbl:serialize()
        else
          return cls[key]
        end
      end,
      __tostring = zw.Command.pretty_print,
      __eq = zw.Command.equals
    }
    local instance = setmetatable({}, mt)
    instance:init(self, ...)
    return instance
  end,
})

--- Initialize a v3 BATTERY_REPORT object.
---
--- @param module st.zwave.CommandClass.Battery command class module instance
--- @param args st.zwave.CommandClass.Battery.ReportV3Args command-specific arguments
function ReportV3:init(module, args, ...)
  zw.Command._parse(self, module, zw.BATTERY, Battery.REPORT, 3, args, ...)
end

--- Serialize v3 BATTERY_REPORT arguments.
---
--- @return string serialized payload
function ReportV3:serialize()
  local writer = buf.Writer()
  local args = self.args
  writer:write_u8(args.battery_level)
  writer:write_bits(2, args.replace_recharge)
  writer:write_bool(args.low_fluid)
  writer:write_bool(args.overheating)
  writer:write_bool(args.backup_battery)
  writer:write_bool(args.rechargeable)
  writer:write_bits(2, args.charging_status)
  writer:write_bool(args.disconnected)
  writer:write_bool(args.low_temperature_status)
  writer:write_bits(6, 0) -- reserved1
  return writer.buf
end

--- Deserialize a v3 BATTERY_REPORT payload.
---
--- @return st.zwave.CommandClass.Battery.ReportV3Args deserialized arguments
function ReportV3:deserialize()
  local reader = buf.Reader(self.payload)
  reader:read_u8("battery_level")
  reader:read_bits(2, "replace_recharge")
  reader:read_bool("low_fluid")
  reader:read_bool("overheating")
  reader:read_bool("backup_battery")
  reader:read_bool("rechargeable")
  reader:read_bits(2, "charging_status")
  reader:read_bool("disconnected")
  reader:read_bool("low_temperature_status")
  reader:read_bits(6) -- reserved1
  return reader.parsed
end

--- Return a deep copy of self.args, merging defaults for unset, but required parameters.
---
--- @param self st.zwave.CommandClass.Battery.ReportV3
--- @return st.zwave.CommandClass.Battery.ReportV3Args
function ReportV3._defaults(self)
  local args = {}
  args.battery_level = self.args.battery_level or 0
  args.replace_recharge = self.args.replace_recharge or 0
  args.low_fluid = self.args.low_fluid or false
  args.overheating = self.args.overheating or false
  args.backup_battery = self.args.backup_battery or false
  args.rechargeable = self.args.rechargeable or false
  args.charging_status = self.args.charging_status or 0
  args.disconnected = self.args.disconnected or false
  args.low_temperature_status = self.args.low_temperature_status or false
  return args
end

--- Return a deep copy of self.args, merging defaults for all unset parameters.
---
--- @param self st.zwave.CommandClass.Battery.ReportV3
--- @return st.zwave.CommandClass.Battery.ReportV3Args
function ReportV3._template(self)
  local args = self:_defaults()
  return args
end

--- Set defaults for any required, but unset arguments.
---
--- @param self st.zwave.CommandClass.Battery.ReportV3
function ReportV3._set_defaults(self)
  local defaults = self:_defaults()
  utils.merge(self.args, defaults)
end

--- Set const reflectors to allow enum stringification.
---
--- @param self st.zwave.CommandClass.Battery.ReportV3
function ReportV3._set_reflectors(self)
  local args = self.args
  args._reflect = args._reflect or {}
  args._reflect.battery_level = function()
    return zw._reflect(
      Battery._reflect_battery_level,
      args.battery_level
    )
  end
  args._reflect = args._reflect or {}
  args._reflect.charging_status = function()
    return zw._reflect(
      Battery._reflect_charging_status,
      args.charging_status
    )
  end
end

--- @class st.zwave.CommandClass.Battery.Get
--- @alias _Get st.zwave.CommandClass.Battery.Get
---
--- Dynamically versioned BATTERY_GET
---
--- Supported versions: 1,2,3; unique base versions: 1
---
--- @field public cmd_class number 0x80
--- @field public cmd_id number 0x02
--- @field public version number 1
--- @field public args st.zwave.CommandClass.Battery.GetV1Args
local _Get = {}
setmetatable(_Get, {
  __call = function(cls, self, ...)
    return cls:construct(self, ...)
  end,
})

--- Construct a BATTERY_GET object at the module instance serialization version.
---
--- @param module st.zwave.CommandClass.Battery command class module instance
--- @param args st.zwave.CommandClass.Battery.GetV1Args command-specific arguments
--- @return st.zwave.CommandClass.Battery.Get
function _Get:construct(module, args, ...)
  return zw.Command._construct(module, Battery.GET, module._serialization_version, args, ...)
end

--- @class st.zwave.CommandClass.Battery.Report
--- @alias _Report st.zwave.CommandClass.Battery.Report
---
--- Dynamically versioned BATTERY_REPORT
---
--- Supported versions: 1,2,3; unique base versions: 1,2,3
---
--- @field public cmd_class number 0x80
--- @field public cmd_id number 0x03
--- @field public version number 1,2,3
--- @field public args st.zwave.CommandClass.Battery.ReportV1Args|st.zwave.CommandClass.Battery.ReportV2Args|st.zwave.CommandClass.Battery.ReportV3Args
local _Report = {}
setmetatable(_Report, {
  __call = function(cls, self, ...)
    return cls:construct(self, ...)
  end,
})

--- Construct a BATTERY_REPORT object at the module instance serialization version.
---
--- @param module st.zwave.CommandClass.Battery command class module instance
--- @param args st.zwave.CommandClass.Battery.ReportV1Args|st.zwave.CommandClass.Battery.ReportV2Args|st.zwave.CommandClass.Battery.ReportV3Args command-specific arguments
--- @return st.zwave.CommandClass.Battery.Report
function _Report:construct(module, args, ...)
  return zw.Command._construct(module, Battery.REPORT, module._serialization_version, args, ...)
end

--- @class st.zwave.CommandClass.Battery.HealthGet
--- @alias _HealthGet st.zwave.CommandClass.Battery.HealthGet
---
--- Dynamically versioned BATTERY_HEALTH_GET
---
--- Supported versions: 2,3; unique base versions: 2
---
--- @field public cmd_class number 0x80
--- @field public cmd_id number 0x04
--- @field public version number 2
--- @field public args st.zwave.CommandClass.Battery.HealthGetV2Args
local _HealthGet = {}
setmetatable(_HealthGet, {
  __call = function(cls, self, ...)
    return cls:construct(self, ...)
  end,
})

--- Construct a BATTERY_HEALTH_GET object at the module instance serialization version.
---
--- @param module st.zwave.CommandClass.Battery command class module instance
--- @param args st.zwave.CommandClass.Battery.HealthGetV2Args command-specific arguments
--- @return st.zwave.CommandClass.Battery.HealthGet
function _HealthGet:construct(module, args, ...)
  return zw.Command._construct(module, Battery.HEALTH_GET, module._serialization_version, args, ...)
end

--- @class st.zwave.CommandClass.Battery.HealthReport
--- @alias _HealthReport st.zwave.CommandClass.Battery.HealthReport
---
--- Dynamically versioned BATTERY_HEALTH_REPORT
---
--- Supported versions: 2,3; unique base versions: 2
---
--- @field public cmd_class number 0x80
--- @field public cmd_id number 0x05
--- @field public version number 2
--- @field public args st.zwave.CommandClass.Battery.HealthReportV2Args
local _HealthReport = {}
setmetatable(_HealthReport, {
  __call = function(cls, self, ...)
    return cls:construct(self, ...)
  end,
})

--- Construct a BATTERY_HEALTH_REPORT object at the module instance serialization version.
---
--- @param module st.zwave.CommandClass.Battery command class module instance
--- @param args st.zwave.CommandClass.Battery.HealthReportV2Args command-specific arguments
--- @return st.zwave.CommandClass.Battery.HealthReport
function _HealthReport:construct(module, args, ...)
  return zw.Command._construct(module, Battery.HEALTH_REPORT, module._serialization_version, args, ...)
end

Battery.GetV1 = GetV1
Battery.ReportV1 = ReportV1
Battery.ReportV2 = ReportV2
Battery.HealthGetV2 = HealthGetV2
Battery.HealthReportV2 = HealthReportV2
Battery.ReportV3 = ReportV3
Battery.Get = _Get
Battery.Report = _Report
Battery.HealthGet = _HealthGet
Battery.HealthReport = _HealthReport

Battery._lut = {
  [0] = { -- dynamically versioned constructors
    [Battery.GET] = Battery.Get,
    [Battery.REPORT] = Battery.Report,
    [Battery.HEALTH_GET] = Battery.HealthGet,
    [Battery.HEALTH_REPORT] = Battery.HealthReport
  },
  [1] = { -- version 1
    [Battery.GET] = Battery.GetV1,
    [Battery.REPORT] = Battery.ReportV1
  },
  [2] = { -- version 2
    [Battery.GET] = Battery.GetV1,
    [Battery.REPORT] = Battery.ReportV2,
    [Battery.HEALTH_GET] = Battery.HealthGetV2,
    [Battery.HEALTH_REPORT] = Battery.HealthReportV2
  },
  [3] = { -- version 3
    [Battery.GET] = Battery.GetV1,
    [Battery.REPORT] = Battery.ReportV3,
    [Battery.HEALTH_GET] = Battery.HealthGetV2,
    [Battery.HEALTH_REPORT] = Battery.HealthReportV2
  }
}
--- @class st.zwave.CommandClass.Battery.battery_level
--- @alias battery_level st.zwave.CommandClass.Battery.battery_level
--- @field public BATTERY_LOW_WARNING number 0xFF
local battery_level = {
  BATTERY_LOW_WARNING = 0xFF
}
Battery.battery_level = battery_level
Battery._reflect_battery_level = zw._reflection_builder(Battery.battery_level)

--- @class st.zwave.CommandClass.Battery.charging_status
--- @alias charging_status st.zwave.CommandClass.Battery.charging_status
--- @field public DISCHARGING number 0x00
--- @field public CHARGING number 0x01
--- @field public MAINTAINING number 0x02
local charging_status = {
  DISCHARGING = 0x00,
  CHARGING = 0x01,
  MAINTAINING = 0x02
}
Battery.charging_status = charging_status
Battery._reflect_charging_status = zw._reflection_builder(Battery.charging_status)


return Battery
