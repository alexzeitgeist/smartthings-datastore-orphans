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

--- @class st.zwave.CommandClass.TimeParameters
--- @alias TimeParameters st.zwave.CommandClass.TimeParameters
---
--- Supported versions: 1
---
--- @field public SET number 0x01 - TIME_PARAMETERS_SET command id
--- @field public GET number 0x02 - TIME_PARAMETERS_GET command id
--- @field public REPORT number 0x03 - TIME_PARAMETERS_REPORT command id
local TimeParameters = {}
TimeParameters.SET = 0x01
TimeParameters.GET = 0x02
TimeParameters.REPORT = 0x03

TimeParameters._commands = {
  [TimeParameters.SET] = "SET",
  [TimeParameters.GET] = "GET",
  [TimeParameters.REPORT] = "REPORT"
}

--- Instantiate a versioned instance of the TimeParameters Command Class module, optionally setting strict to require explicit passing of all parameters to constructors.
---
--- @param params st.zwave.CommandClass.Params command class instance parameters
--- @return st.zwave.CommandClass.TimeParameters versioned command class instance
function TimeParameters:init(params)
  local version = params and params.version or nil
  if (params or {}).strict ~= nil then
  local strict = params.strict
  else
  local strict = true -- default
  end
  local strict = params and params.strict or nil
  assert(version == nil or zw._versions[zw.TIME_PARAMETERS][version] ~= nil, "unsupported version")
  assert(strict == nil or type(strict) == "boolean", "strict must be a boolean")
  local mt = {
    __index = self
  }
  local instance = setmetatable({}, mt)
  instance._serialization_version = version
  instance._strict = strict
  return instance
end

setmetatable(TimeParameters, {
  __call = TimeParameters.init
})

TimeParameters._serialization_version = nil
TimeParameters._strict = false
zw._deserialization_versions = zw.deserialization_versions or {}
zw._versions = zw._versions or {}
setmetatable(zw._deserialization_versions, { __index = zw._versions })
zw._versions[zw.TIME_PARAMETERS] = {
  [1] = true
}

--- @class st.zwave.CommandClass.TimeParameters.SetV1Args
--- @alias SetV1Args st.zwave.CommandClass.TimeParameters.SetV1Args
--- @field public year integer [0,65535]
--- @field public month integer [0,255]
--- @field public day integer [0,255]
--- @field public hour_utc integer [0,255]
--- @field public minute_utc integer [0,255]
--- @field public second_utc integer [0,255]
local SetV1Args = {}

--- @class st.zwave.CommandClass.TimeParameters.SetV1:st.zwave.Command
--- @alias SetV1 st.zwave.CommandClass.TimeParameters.SetV1
---
--- v1 TIME_PARAMETERS_SET
---
--- @field public cmd_class number 0x8B
--- @field public cmd_id number 0x01
--- @field public version number 1
--- @field public args st.zwave.CommandClass.TimeParameters.SetV1Args command-specific arguments
local SetV1 = {}
setmetatable(SetV1, {
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

--- Initialize a v1 TIME_PARAMETERS_SET object.
---
--- @param module st.zwave.CommandClass.TimeParameters command class module instance
--- @param args st.zwave.CommandClass.TimeParameters.SetV1Args command-specific arguments
function SetV1:init(module, args, ...)
  zw.Command._parse(self, module, zw.TIME_PARAMETERS, TimeParameters.SET, 1, args, ...)
end

--- Serialize v1 TIME_PARAMETERS_SET arguments.
---
--- @return string serialized payload
function SetV1:serialize()
  local writer = buf.Writer()
  local args = self.args
  writer:write_be_u16(args.year)
  writer:write_u8(args.month)
  writer:write_u8(args.day)
  writer:write_u8(args.hour_utc)
  writer:write_u8(args.minute_utc)
  writer:write_u8(args.second_utc)
  return writer.buf
end

--- Deserialize a v1 TIME_PARAMETERS_SET payload.
---
--- @return st.zwave.CommandClass.TimeParameters.SetV1Args deserialized arguments
function SetV1:deserialize()
  local reader = buf.Reader(self.payload)
  reader:read_be_u16("year")
  reader:read_u8("month")
  reader:read_u8("day")
  reader:read_u8("hour_utc")
  reader:read_u8("minute_utc")
  reader:read_u8("second_utc")
  return reader.parsed
end

--- Return a deep copy of self.args, merging defaults for unset, but required parameters.
---
--- @param self st.zwave.CommandClass.TimeParameters.SetV1
--- @return st.zwave.CommandClass.TimeParameters.SetV1Args
function SetV1._defaults(self)
  local args = {}
  args.year = self.args.year or 0
  args.month = self.args.month or 0
  args.day = self.args.day or 0
  args.hour_utc = self.args.hour_utc or 0
  args.minute_utc = self.args.minute_utc or 0
  args.second_utc = self.args.second_utc or 0
  return args
end

--- Return a deep copy of self.args, merging defaults for all unset parameters.
---
--- @param self st.zwave.CommandClass.TimeParameters.SetV1
--- @return st.zwave.CommandClass.TimeParameters.SetV1Args
function SetV1._template(self)
  local args = self:_defaults()
  return args
end

--- Set defaults for any required, but unset arguments.
---
--- @param self st.zwave.CommandClass.TimeParameters.SetV1
function SetV1._set_defaults(self)
  local defaults = self:_defaults()
  utils.merge(self.args, defaults)
end

--- Set const reflectors to allow enum stringification.
---
--- @param self st.zwave.CommandClass.TimeParameters.SetV1
function SetV1._set_reflectors(self)
end

--- @class st.zwave.CommandClass.TimeParameters.GetV1Args
--- @alias GetV1Args st.zwave.CommandClass.TimeParameters.GetV1Args
local GetV1Args = {}

--- @class st.zwave.CommandClass.TimeParameters.GetV1:st.zwave.Command
--- @alias GetV1 st.zwave.CommandClass.TimeParameters.GetV1
---
--- v1 TIME_PARAMETERS_GET
---
--- @field public cmd_class number 0x8B
--- @field public cmd_id number 0x02
--- @field public version number 1
--- @field public args st.zwave.CommandClass.TimeParameters.GetV1Args command-specific arguments
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

--- Initialize a v1 TIME_PARAMETERS_GET object.
---
--- @param module st.zwave.CommandClass.TimeParameters command class module instance
--- @param args st.zwave.CommandClass.TimeParameters.GetV1Args command-specific arguments
function GetV1:init(module, args, ...)
  zw.Command._parse(self, module, zw.TIME_PARAMETERS, TimeParameters.GET, 1, args, ...)
end

--- Serialize v1 TIME_PARAMETERS_GET arguments.
---
--- @return string serialized payload
function GetV1:serialize()
  local writer = buf.Writer()
  return writer.buf
end

--- Deserialize a v1 TIME_PARAMETERS_GET payload.
---
--- @return st.zwave.CommandClass.TimeParameters.GetV1Args deserialized arguments
function GetV1:deserialize()
  local reader = buf.Reader(self.payload)
  return reader.parsed
end

--- Return a deep copy of self.args, merging defaults for unset, but required parameters.
---
--- @param self st.zwave.CommandClass.TimeParameters.GetV1
--- @return st.zwave.CommandClass.TimeParameters.GetV1Args
function GetV1._defaults(self)
  return {}
end

--- Return a deep copy of self.args, merging defaults for all unset parameters.
---
--- @param self st.zwave.CommandClass.TimeParameters.GetV1
--- @return st.zwave.CommandClass.TimeParameters.GetV1Args
function GetV1._template(self)
  return {}
end

--- Set defaults for any required, but unset arguments.
---
--- @param self st.zwave.CommandClass.TimeParameters.GetV1
function GetV1._set_defaults(self)
  local defaults = self:_defaults()
  utils.merge(self.args, defaults)
end

--- Set const reflectors to allow enum stringification.
---
--- @param self st.zwave.CommandClass.TimeParameters.GetV1
function GetV1._set_reflectors(self)
end

--- @class st.zwave.CommandClass.TimeParameters.ReportV1Args
--- @alias ReportV1Args st.zwave.CommandClass.TimeParameters.ReportV1Args
--- @field public year integer [0,65535]
--- @field public month integer [0,255]
--- @field public day integer [0,255]
--- @field public hour_utc integer [0,255]
--- @field public minute_utc integer [0,255]
--- @field public second_utc integer [0,255]
local ReportV1Args = {}

--- @class st.zwave.CommandClass.TimeParameters.ReportV1:st.zwave.Command
--- @alias ReportV1 st.zwave.CommandClass.TimeParameters.ReportV1
---
--- v1 TIME_PARAMETERS_REPORT
---
--- @field public cmd_class number 0x8B
--- @field public cmd_id number 0x03
--- @field public version number 1
--- @field public args st.zwave.CommandClass.TimeParameters.ReportV1Args command-specific arguments
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

--- Initialize a v1 TIME_PARAMETERS_REPORT object.
---
--- @param module st.zwave.CommandClass.TimeParameters command class module instance
--- @param args st.zwave.CommandClass.TimeParameters.ReportV1Args command-specific arguments
function ReportV1:init(module, args, ...)
  zw.Command._parse(self, module, zw.TIME_PARAMETERS, TimeParameters.REPORT, 1, args, ...)
end

--- Serialize v1 TIME_PARAMETERS_REPORT arguments.
---
--- @return string serialized payload
function ReportV1:serialize()
  local writer = buf.Writer()
  local args = self.args
  writer:write_be_u16(args.year)
  writer:write_u8(args.month)
  writer:write_u8(args.day)
  writer:write_u8(args.hour_utc)
  writer:write_u8(args.minute_utc)
  writer:write_u8(args.second_utc)
  return writer.buf
end

--- Deserialize a v1 TIME_PARAMETERS_REPORT payload.
---
--- @return st.zwave.CommandClass.TimeParameters.ReportV1Args deserialized arguments
function ReportV1:deserialize()
  local reader = buf.Reader(self.payload)
  reader:read_be_u16("year")
  reader:read_u8("month")
  reader:read_u8("day")
  reader:read_u8("hour_utc")
  reader:read_u8("minute_utc")
  reader:read_u8("second_utc")
  return reader.parsed
end

--- Return a deep copy of self.args, merging defaults for unset, but required parameters.
---
--- @param self st.zwave.CommandClass.TimeParameters.ReportV1
--- @return st.zwave.CommandClass.TimeParameters.ReportV1Args
function ReportV1._defaults(self)
  local args = {}
  args.year = self.args.year or 0
  args.month = self.args.month or 0
  args.day = self.args.day or 0
  args.hour_utc = self.args.hour_utc or 0
  args.minute_utc = self.args.minute_utc or 0
  args.second_utc = self.args.second_utc or 0
  return args
end

--- Return a deep copy of self.args, merging defaults for all unset parameters.
---
--- @param self st.zwave.CommandClass.TimeParameters.ReportV1
--- @return st.zwave.CommandClass.TimeParameters.ReportV1Args
function ReportV1._template(self)
  local args = self:_defaults()
  return args
end

--- Set defaults for any required, but unset arguments.
---
--- @param self st.zwave.CommandClass.TimeParameters.ReportV1
function ReportV1._set_defaults(self)
  local defaults = self:_defaults()
  utils.merge(self.args, defaults)
end

--- Set const reflectors to allow enum stringification.
---
--- @param self st.zwave.CommandClass.TimeParameters.ReportV1
function ReportV1._set_reflectors(self)
end

--- @class st.zwave.CommandClass.TimeParameters.Set
--- @alias _Set st.zwave.CommandClass.TimeParameters.Set
---
--- Dynamically versioned TIME_PARAMETERS_SET
---
--- Supported versions: 1; unique base versions: 1
---
--- @field public cmd_class number 0x8B
--- @field public cmd_id number 0x01
--- @field public version number 1
--- @field public args st.zwave.CommandClass.TimeParameters.SetV1Args
local _Set = {}
setmetatable(_Set, {
  __call = function(cls, self, ...)
    return cls:construct(self, ...)
  end,
})

--- Construct a TIME_PARAMETERS_SET object at the module instance serialization version.
---
--- @param module st.zwave.CommandClass.TimeParameters command class module instance
--- @param args st.zwave.CommandClass.TimeParameters.SetV1Args command-specific arguments
--- @return st.zwave.CommandClass.TimeParameters.Set
function _Set:construct(module, args, ...)
  return zw.Command._construct(module, TimeParameters.SET, module._serialization_version, args, ...)
end

--- @class st.zwave.CommandClass.TimeParameters.Get
--- @alias _Get st.zwave.CommandClass.TimeParameters.Get
---
--- Dynamically versioned TIME_PARAMETERS_GET
---
--- Supported versions: 1; unique base versions: 1
---
--- @field public cmd_class number 0x8B
--- @field public cmd_id number 0x02
--- @field public version number 1
--- @field public args st.zwave.CommandClass.TimeParameters.GetV1Args
local _Get = {}
setmetatable(_Get, {
  __call = function(cls, self, ...)
    return cls:construct(self, ...)
  end,
})

--- Construct a TIME_PARAMETERS_GET object at the module instance serialization version.
---
--- @param module st.zwave.CommandClass.TimeParameters command class module instance
--- @param args st.zwave.CommandClass.TimeParameters.GetV1Args command-specific arguments
--- @return st.zwave.CommandClass.TimeParameters.Get
function _Get:construct(module, args, ...)
  return zw.Command._construct(module, TimeParameters.GET, module._serialization_version, args, ...)
end

--- @class st.zwave.CommandClass.TimeParameters.Report
--- @alias _Report st.zwave.CommandClass.TimeParameters.Report
---
--- Dynamically versioned TIME_PARAMETERS_REPORT
---
--- Supported versions: 1; unique base versions: 1
---
--- @field public cmd_class number 0x8B
--- @field public cmd_id number 0x03
--- @field public version number 1
--- @field public args st.zwave.CommandClass.TimeParameters.ReportV1Args
local _Report = {}
setmetatable(_Report, {
  __call = function(cls, self, ...)
    return cls:construct(self, ...)
  end,
})

--- Construct a TIME_PARAMETERS_REPORT object at the module instance serialization version.
---
--- @param module st.zwave.CommandClass.TimeParameters command class module instance
--- @param args st.zwave.CommandClass.TimeParameters.ReportV1Args command-specific arguments
--- @return st.zwave.CommandClass.TimeParameters.Report
function _Report:construct(module, args, ...)
  return zw.Command._construct(module, TimeParameters.REPORT, module._serialization_version, args, ...)
end

TimeParameters.SetV1 = SetV1
TimeParameters.GetV1 = GetV1
TimeParameters.ReportV1 = ReportV1
TimeParameters.Set = _Set
TimeParameters.Get = _Get
TimeParameters.Report = _Report

TimeParameters._lut = {
  [0] = { -- dynamically versioned constructors
    [TimeParameters.SET] = TimeParameters.Set,
    [TimeParameters.GET] = TimeParameters.Get,
    [TimeParameters.REPORT] = TimeParameters.Report
  },
  [1] = { -- version 1
    [TimeParameters.SET] = TimeParameters.SetV1,
    [TimeParameters.GET] = TimeParameters.GetV1,
    [TimeParameters.REPORT] = TimeParameters.ReportV1
  }
}

return TimeParameters
