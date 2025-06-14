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

--- @class st.zwave.CommandClass.Time
--- @alias Time st.zwave.CommandClass.Time
---
--- Supported versions: 1,2
---
--- @field public GET number 0x01 - TIME_GET command id
--- @field public REPORT number 0x02 - TIME_REPORT command id
--- @field public DATE_GET number 0x03 - DATE_GET command id
--- @field public DATE_REPORT number 0x04 - DATE_REPORT command id
--- @field public OFFSET_SET number 0x05 - TIME_OFFSET_SET command id
--- @field public OFFSET_GET number 0x06 - TIME_OFFSET_GET command id
--- @field public OFFSET_REPORT number 0x07 - TIME_OFFSET_REPORT command id
local Time = {}
Time.GET = 0x01
Time.REPORT = 0x02
Time.DATE_GET = 0x03
Time.DATE_REPORT = 0x04
Time.OFFSET_SET = 0x05
Time.OFFSET_GET = 0x06
Time.OFFSET_REPORT = 0x07

Time._commands = {
  [Time.GET] = "GET",
  [Time.REPORT] = "REPORT",
  [Time.DATE_GET] = "DATE_GET",
  [Time.DATE_REPORT] = "DATE_REPORT",
  [Time.OFFSET_SET] = "OFFSET_SET",
  [Time.OFFSET_GET] = "OFFSET_GET",
  [Time.OFFSET_REPORT] = "OFFSET_REPORT"
}

--- Instantiate a versioned instance of the Time Command Class module, optionally setting strict to require explicit passing of all parameters to constructors.
---
--- @param params st.zwave.CommandClass.Params command class instance parameters
--- @return st.zwave.CommandClass.Time versioned command class instance
function Time:init(params)
  local version = params and params.version or nil
  if (params or {}).strict ~= nil then
  local strict = params.strict
  else
  local strict = true -- default
  end
  local strict = params and params.strict or nil
  assert(version == nil or zw._versions[zw.TIME][version] ~= nil, "unsupported version")
  assert(strict == nil or type(strict) == "boolean", "strict must be a boolean")
  local mt = {
    __index = self
  }
  local instance = setmetatable({}, mt)
  instance._serialization_version = version
  instance._strict = strict
  return instance
end

setmetatable(Time, {
  __call = Time.init
})

Time._serialization_version = nil
Time._strict = false
zw._deserialization_versions = zw.deserialization_versions or {}
zw._versions = zw._versions or {}
setmetatable(zw._deserialization_versions, { __index = zw._versions })
zw._versions[zw.TIME] = {
  [1] = true,
  [2] = true
}

--- @class st.zwave.CommandClass.Time.GetV1Args
--- @alias GetV1Args st.zwave.CommandClass.Time.GetV1Args
local GetV1Args = {}

--- @class st.zwave.CommandClass.Time.GetV1:st.zwave.Command
--- @alias GetV1 st.zwave.CommandClass.Time.GetV1
---
--- v1 and forward-compatible v2 TIME_GET
---
--- @field public cmd_class number 0x8A
--- @field public cmd_id number 0x01
--- @field public version number 1
--- @field public args st.zwave.CommandClass.Time.GetV1Args command-specific arguments
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

--- Initialize a v1 and forward-compatible v2 TIME_GET object.
---
--- @param module st.zwave.CommandClass.Time command class module instance
--- @param args st.zwave.CommandClass.Time.GetV1Args command-specific arguments
function GetV1:init(module, args, ...)
  zw.Command._parse(self, module, zw.TIME, Time.GET, 1, args, ...)
end

--- Serialize v1 or forward-compatible v2 TIME_GET arguments.
---
--- @return string serialized payload
function GetV1:serialize()
  local writer = buf.Writer()
  return writer.buf
end

--- Deserialize a v1 or forward-compatible v2 TIME_GET payload.
---
--- @return st.zwave.CommandClass.Time.GetV1Args deserialized arguments
function GetV1:deserialize()
  local reader = buf.Reader(self.payload)
  return reader.parsed
end

--- Return a deep copy of self.args, merging defaults for unset, but required parameters.
---
--- @param self st.zwave.CommandClass.Time.GetV1
--- @return st.zwave.CommandClass.Time.GetV1Args
function GetV1._defaults(self)
  return {}
end

--- Return a deep copy of self.args, merging defaults for all unset parameters.
---
--- @param self st.zwave.CommandClass.Time.GetV1
--- @return st.zwave.CommandClass.Time.GetV1Args
function GetV1._template(self)
  return {}
end

--- Set defaults for any required, but unset arguments.
---
--- @param self st.zwave.CommandClass.Time.GetV1
function GetV1._set_defaults(self)
  local defaults = self:_defaults()
  utils.merge(self.args, defaults)
end

--- Set const reflectors to allow enum stringification.
---
--- @param self st.zwave.CommandClass.Time.GetV1
function GetV1._set_reflectors(self)
end

--- @class st.zwave.CommandClass.Time.ReportV1Args
--- @alias ReportV1Args st.zwave.CommandClass.Time.ReportV1Args
--- @field public hour_local_time integer [0,31]
--- @field public rtc_failure boolean
--- @field public minute_local_time integer [0,255]
--- @field public second_local_time integer [0,255]
local ReportV1Args = {}

--- @class st.zwave.CommandClass.Time.ReportV1:st.zwave.Command
--- @alias ReportV1 st.zwave.CommandClass.Time.ReportV1
---
--- v1 and forward-compatible v2 TIME_REPORT
---
--- @field public cmd_class number 0x8A
--- @field public cmd_id number 0x02
--- @field public version number 1
--- @field public args st.zwave.CommandClass.Time.ReportV1Args command-specific arguments
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

--- Initialize a v1 and forward-compatible v2 TIME_REPORT object.
---
--- @param module st.zwave.CommandClass.Time command class module instance
--- @param args st.zwave.CommandClass.Time.ReportV1Args command-specific arguments
function ReportV1:init(module, args, ...)
  zw.Command._parse(self, module, zw.TIME, Time.REPORT, 1, args, ...)
end

--- Serialize v1 or forward-compatible v2 TIME_REPORT arguments.
---
--- @return string serialized payload
function ReportV1:serialize()
  local writer = buf.Writer()
  local args = self.args
  writer:write_bits(5, args.hour_local_time)
  writer:write_bits(2, 0) -- reserved
  writer:write_bool(args.rtc_failure)
  writer:write_u8(args.minute_local_time)
  writer:write_u8(args.second_local_time)
  return writer.buf
end

--- Deserialize a v1 or forward-compatible v2 TIME_REPORT payload.
---
--- @return st.zwave.CommandClass.Time.ReportV1Args deserialized arguments
function ReportV1:deserialize()
  local reader = buf.Reader(self.payload)
  reader:read_bits(5, "hour_local_time")
  reader:read_bits(2) -- reserved
  reader:read_bool("rtc_failure")
  reader:read_u8("minute_local_time")
  reader:read_u8("second_local_time")
  return reader.parsed
end

--- Return a deep copy of self.args, merging defaults for unset, but required parameters.
---
--- @param self st.zwave.CommandClass.Time.ReportV1
--- @return st.zwave.CommandClass.Time.ReportV1Args
function ReportV1._defaults(self)
  local args = {}
  args.hour_local_time = self.args.hour_local_time or 0
  args.rtc_failure = self.args.rtc_failure or false
  args.minute_local_time = self.args.minute_local_time or 0
  args.second_local_time = self.args.second_local_time or 0
  return args
end

--- Return a deep copy of self.args, merging defaults for all unset parameters.
---
--- @param self st.zwave.CommandClass.Time.ReportV1
--- @return st.zwave.CommandClass.Time.ReportV1Args
function ReportV1._template(self)
  local args = self:_defaults()
  return args
end

--- Set defaults for any required, but unset arguments.
---
--- @param self st.zwave.CommandClass.Time.ReportV1
function ReportV1._set_defaults(self)
  local defaults = self:_defaults()
  utils.merge(self.args, defaults)
end

--- Set const reflectors to allow enum stringification.
---
--- @param self st.zwave.CommandClass.Time.ReportV1
function ReportV1._set_reflectors(self)
end

--- @class st.zwave.CommandClass.Time.DateGetV1Args
--- @alias DateGetV1Args st.zwave.CommandClass.Time.DateGetV1Args
local DateGetV1Args = {}

--- @class st.zwave.CommandClass.Time.DateGetV1:st.zwave.Command
--- @alias DateGetV1 st.zwave.CommandClass.Time.DateGetV1
---
--- v1 and forward-compatible v2 DATE_GET
---
--- @field public cmd_class number 0x8A
--- @field public cmd_id number 0x03
--- @field public version number 1
--- @field public args st.zwave.CommandClass.Time.DateGetV1Args command-specific arguments
local DateGetV1 = {}
setmetatable(DateGetV1, {
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

--- Initialize a v1 and forward-compatible v2 DATE_GET object.
---
--- @param module st.zwave.CommandClass.Time command class module instance
--- @param args st.zwave.CommandClass.Time.DateGetV1Args command-specific arguments
function DateGetV1:init(module, args, ...)
  zw.Command._parse(self, module, zw.TIME, Time.DATE_GET, 1, args, ...)
end

--- Serialize v1 or forward-compatible v2 DATE_GET arguments.
---
--- @return string serialized payload
function DateGetV1:serialize()
  local writer = buf.Writer()
  return writer.buf
end

--- Deserialize a v1 or forward-compatible v2 DATE_GET payload.
---
--- @return st.zwave.CommandClass.Time.DateGetV1Args deserialized arguments
function DateGetV1:deserialize()
  local reader = buf.Reader(self.payload)
  return reader.parsed
end

--- Return a deep copy of self.args, merging defaults for unset, but required parameters.
---
--- @param self st.zwave.CommandClass.Time.DateGetV1
--- @return st.zwave.CommandClass.Time.DateGetV1Args
function DateGetV1._defaults(self)
  return {}
end

--- Return a deep copy of self.args, merging defaults for all unset parameters.
---
--- @param self st.zwave.CommandClass.Time.DateGetV1
--- @return st.zwave.CommandClass.Time.DateGetV1Args
function DateGetV1._template(self)
  return {}
end

--- Set defaults for any required, but unset arguments.
---
--- @param self st.zwave.CommandClass.Time.DateGetV1
function DateGetV1._set_defaults(self)
  local defaults = self:_defaults()
  utils.merge(self.args, defaults)
end

--- Set const reflectors to allow enum stringification.
---
--- @param self st.zwave.CommandClass.Time.DateGetV1
function DateGetV1._set_reflectors(self)
end

--- @class st.zwave.CommandClass.Time.DateReportV1Args
--- @alias DateReportV1Args st.zwave.CommandClass.Time.DateReportV1Args
--- @field public year integer [0,65535]
--- @field public month integer [0,255]
--- @field public day integer [0,255]
local DateReportV1Args = {}

--- @class st.zwave.CommandClass.Time.DateReportV1:st.zwave.Command
--- @alias DateReportV1 st.zwave.CommandClass.Time.DateReportV1
---
--- v1 and forward-compatible v2 DATE_REPORT
---
--- @field public cmd_class number 0x8A
--- @field public cmd_id number 0x04
--- @field public version number 1
--- @field public args st.zwave.CommandClass.Time.DateReportV1Args command-specific arguments
local DateReportV1 = {}
setmetatable(DateReportV1, {
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

--- Initialize a v1 and forward-compatible v2 DATE_REPORT object.
---
--- @param module st.zwave.CommandClass.Time command class module instance
--- @param args st.zwave.CommandClass.Time.DateReportV1Args command-specific arguments
function DateReportV1:init(module, args, ...)
  zw.Command._parse(self, module, zw.TIME, Time.DATE_REPORT, 1, args, ...)
end

--- Serialize v1 or forward-compatible v2 DATE_REPORT arguments.
---
--- @return string serialized payload
function DateReportV1:serialize()
  local writer = buf.Writer()
  local args = self.args
  writer:write_be_u16(args.year)
  writer:write_u8(args.month)
  writer:write_u8(args.day)
  return writer.buf
end

--- Deserialize a v1 or forward-compatible v2 DATE_REPORT payload.
---
--- @return st.zwave.CommandClass.Time.DateReportV1Args deserialized arguments
function DateReportV1:deserialize()
  local reader = buf.Reader(self.payload)
  reader:read_be_u16("year")
  reader:read_u8("month")
  reader:read_u8("day")
  return reader.parsed
end

--- Return a deep copy of self.args, merging defaults for unset, but required parameters.
---
--- @param self st.zwave.CommandClass.Time.DateReportV1
--- @return st.zwave.CommandClass.Time.DateReportV1Args
function DateReportV1._defaults(self)
  local args = {}
  args.year = self.args.year or 0
  args.month = self.args.month or 0
  args.day = self.args.day or 0
  return args
end

--- Return a deep copy of self.args, merging defaults for all unset parameters.
---
--- @param self st.zwave.CommandClass.Time.DateReportV1
--- @return st.zwave.CommandClass.Time.DateReportV1Args
function DateReportV1._template(self)
  local args = self:_defaults()
  return args
end

--- Set defaults for any required, but unset arguments.
---
--- @param self st.zwave.CommandClass.Time.DateReportV1
function DateReportV1._set_defaults(self)
  local defaults = self:_defaults()
  utils.merge(self.args, defaults)
end

--- Set const reflectors to allow enum stringification.
---
--- @param self st.zwave.CommandClass.Time.DateReportV1
function DateReportV1._set_reflectors(self)
end

--- @class st.zwave.CommandClass.Time.OffsetSetV2Args
--- @alias OffsetSetV2Args st.zwave.CommandClass.Time.OffsetSetV2Args
--- @field public hour_tzo integer [0,127]
--- @field public sign_tzo boolean
--- @field public minute_tzo integer [0,255]
--- @field public minute_offset_dst integer [0,127]
--- @field public sign_offset_dst boolean
--- @field public month_start_dst integer [0,255]
--- @field public day_start_dst integer [0,255]
--- @field public hour_start_dst integer [0,255]
--- @field public month_end_dst integer [0,255]
--- @field public day_end_dst integer [0,255]
--- @field public hour_end_dst integer [0,255]
local OffsetSetV2Args = {}

--- @class st.zwave.CommandClass.Time.OffsetSetV2:st.zwave.Command
--- @alias OffsetSetV2 st.zwave.CommandClass.Time.OffsetSetV2
---
--- v2 TIME_OFFSET_SET
---
--- @field public cmd_class number 0x8A
--- @field public cmd_id number 0x05
--- @field public version number 2
--- @field public args st.zwave.CommandClass.Time.OffsetSetV2Args command-specific arguments
local OffsetSetV2 = {}
setmetatable(OffsetSetV2, {
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

--- Initialize a v2 TIME_OFFSET_SET object.
---
--- @param module st.zwave.CommandClass.Time command class module instance
--- @param args st.zwave.CommandClass.Time.OffsetSetV2Args command-specific arguments
function OffsetSetV2:init(module, args, ...)
  zw.Command._parse(self, module, zw.TIME, Time.OFFSET_SET, 2, args, ...)
end

--- Serialize v2 TIME_OFFSET_SET arguments.
---
--- @return string serialized payload
function OffsetSetV2:serialize()
  local writer = buf.Writer()
  local args = self.args
  writer:write_bits(7, args.hour_tzo)
  writer:write_bool(args.sign_tzo)
  writer:write_u8(args.minute_tzo)
  writer:write_bits(7, args.minute_offset_dst)
  writer:write_bool(args.sign_offset_dst)
  writer:write_u8(args.month_start_dst)
  writer:write_u8(args.day_start_dst)
  writer:write_u8(args.hour_start_dst)
  writer:write_u8(args.month_end_dst)
  writer:write_u8(args.day_end_dst)
  writer:write_u8(args.hour_end_dst)
  return writer.buf
end

--- Deserialize a v2 TIME_OFFSET_SET payload.
---
--- @return st.zwave.CommandClass.Time.OffsetSetV2Args deserialized arguments
function OffsetSetV2:deserialize()
  local reader = buf.Reader(self.payload)
  reader:read_bits(7, "hour_tzo")
  reader:read_bool("sign_tzo")
  reader:read_u8("minute_tzo")
  reader:read_bits(7, "minute_offset_dst")
  reader:read_bool("sign_offset_dst")
  reader:read_u8("month_start_dst")
  reader:read_u8("day_start_dst")
  reader:read_u8("hour_start_dst")
  reader:read_u8("month_end_dst")
  reader:read_u8("day_end_dst")
  reader:read_u8("hour_end_dst")
  return reader.parsed
end

--- Return a deep copy of self.args, merging defaults for unset, but required parameters.
---
--- @param self st.zwave.CommandClass.Time.OffsetSetV2
--- @return st.zwave.CommandClass.Time.OffsetSetV2Args
function OffsetSetV2._defaults(self)
  local args = {}
  args.hour_tzo = self.args.hour_tzo or 0
  args.sign_tzo = self.args.sign_tzo or false
  args.minute_tzo = self.args.minute_tzo or 0
  args.minute_offset_dst = self.args.minute_offset_dst or 0
  args.sign_offset_dst = self.args.sign_offset_dst or false
  args.month_start_dst = self.args.month_start_dst or 0
  args.day_start_dst = self.args.day_start_dst or 0
  args.hour_start_dst = self.args.hour_start_dst or 0
  args.month_end_dst = self.args.month_end_dst or 0
  args.day_end_dst = self.args.day_end_dst or 0
  args.hour_end_dst = self.args.hour_end_dst or 0
  return args
end

--- Return a deep copy of self.args, merging defaults for all unset parameters.
---
--- @param self st.zwave.CommandClass.Time.OffsetSetV2
--- @return st.zwave.CommandClass.Time.OffsetSetV2Args
function OffsetSetV2._template(self)
  local args = self:_defaults()
  return args
end

--- Set defaults for any required, but unset arguments.
---
--- @param self st.zwave.CommandClass.Time.OffsetSetV2
function OffsetSetV2._set_defaults(self)
  local defaults = self:_defaults()
  utils.merge(self.args, defaults)
end

--- Set const reflectors to allow enum stringification.
---
--- @param self st.zwave.CommandClass.Time.OffsetSetV2
function OffsetSetV2._set_reflectors(self)
end

--- @class st.zwave.CommandClass.Time.OffsetGetV2Args
--- @alias OffsetGetV2Args st.zwave.CommandClass.Time.OffsetGetV2Args
local OffsetGetV2Args = {}

--- @class st.zwave.CommandClass.Time.OffsetGetV2:st.zwave.Command
--- @alias OffsetGetV2 st.zwave.CommandClass.Time.OffsetGetV2
---
--- v2 TIME_OFFSET_GET
---
--- @field public cmd_class number 0x8A
--- @field public cmd_id number 0x06
--- @field public version number 2
--- @field public args st.zwave.CommandClass.Time.OffsetGetV2Args command-specific arguments
local OffsetGetV2 = {}
setmetatable(OffsetGetV2, {
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

--- Initialize a v2 TIME_OFFSET_GET object.
---
--- @param module st.zwave.CommandClass.Time command class module instance
--- @param args st.zwave.CommandClass.Time.OffsetGetV2Args command-specific arguments
function OffsetGetV2:init(module, args, ...)
  zw.Command._parse(self, module, zw.TIME, Time.OFFSET_GET, 2, args, ...)
end

--- Serialize v2 TIME_OFFSET_GET arguments.
---
--- @return string serialized payload
function OffsetGetV2:serialize()
  local writer = buf.Writer()
  return writer.buf
end

--- Deserialize a v2 TIME_OFFSET_GET payload.
---
--- @return st.zwave.CommandClass.Time.OffsetGetV2Args deserialized arguments
function OffsetGetV2:deserialize()
  local reader = buf.Reader(self.payload)
  return reader.parsed
end

--- Return a deep copy of self.args, merging defaults for unset, but required parameters.
---
--- @param self st.zwave.CommandClass.Time.OffsetGetV2
--- @return st.zwave.CommandClass.Time.OffsetGetV2Args
function OffsetGetV2._defaults(self)
  return {}
end

--- Return a deep copy of self.args, merging defaults for all unset parameters.
---
--- @param self st.zwave.CommandClass.Time.OffsetGetV2
--- @return st.zwave.CommandClass.Time.OffsetGetV2Args
function OffsetGetV2._template(self)
  return {}
end

--- Set defaults for any required, but unset arguments.
---
--- @param self st.zwave.CommandClass.Time.OffsetGetV2
function OffsetGetV2._set_defaults(self)
  local defaults = self:_defaults()
  utils.merge(self.args, defaults)
end

--- Set const reflectors to allow enum stringification.
---
--- @param self st.zwave.CommandClass.Time.OffsetGetV2
function OffsetGetV2._set_reflectors(self)
end

--- @class st.zwave.CommandClass.Time.OffsetReportV2Args
--- @alias OffsetReportV2Args st.zwave.CommandClass.Time.OffsetReportV2Args
--- @field public hour_tzo integer [0,127]
--- @field public sign_tzo boolean
--- @field public minute_tzo integer [0,255]
--- @field public minute_offset_dst integer [0,127]
--- @field public sign_offset_dst boolean
--- @field public month_start_dst integer [0,255]
--- @field public day_start_dst integer [0,255]
--- @field public hour_start_dst integer [0,255]
--- @field public month_end_dst integer [0,255]
--- @field public day_end_dst integer [0,255]
--- @field public hour_end_dst integer [0,255]
local OffsetReportV2Args = {}

--- @class st.zwave.CommandClass.Time.OffsetReportV2:st.zwave.Command
--- @alias OffsetReportV2 st.zwave.CommandClass.Time.OffsetReportV2
---
--- v2 TIME_OFFSET_REPORT
---
--- @field public cmd_class number 0x8A
--- @field public cmd_id number 0x07
--- @field public version number 2
--- @field public args st.zwave.CommandClass.Time.OffsetReportV2Args command-specific arguments
local OffsetReportV2 = {}
setmetatable(OffsetReportV2, {
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

--- Initialize a v2 TIME_OFFSET_REPORT object.
---
--- @param module st.zwave.CommandClass.Time command class module instance
--- @param args st.zwave.CommandClass.Time.OffsetReportV2Args command-specific arguments
function OffsetReportV2:init(module, args, ...)
  zw.Command._parse(self, module, zw.TIME, Time.OFFSET_REPORT, 2, args, ...)
end

--- Serialize v2 TIME_OFFSET_REPORT arguments.
---
--- @return string serialized payload
function OffsetReportV2:serialize()
  local writer = buf.Writer()
  local args = self.args
  writer:write_bits(7, args.hour_tzo)
  writer:write_bool(args.sign_tzo)
  writer:write_u8(args.minute_tzo)
  writer:write_bits(7, args.minute_offset_dst)
  writer:write_bool(args.sign_offset_dst)
  writer:write_u8(args.month_start_dst)
  writer:write_u8(args.day_start_dst)
  writer:write_u8(args.hour_start_dst)
  writer:write_u8(args.month_end_dst)
  writer:write_u8(args.day_end_dst)
  writer:write_u8(args.hour_end_dst)
  return writer.buf
end

--- Deserialize a v2 TIME_OFFSET_REPORT payload.
---
--- @return st.zwave.CommandClass.Time.OffsetReportV2Args deserialized arguments
function OffsetReportV2:deserialize()
  local reader = buf.Reader(self.payload)
  reader:read_bits(7, "hour_tzo")
  reader:read_bool("sign_tzo")
  reader:read_u8("minute_tzo")
  reader:read_bits(7, "minute_offset_dst")
  reader:read_bool("sign_offset_dst")
  reader:read_u8("month_start_dst")
  reader:read_u8("day_start_dst")
  reader:read_u8("hour_start_dst")
  reader:read_u8("month_end_dst")
  reader:read_u8("day_end_dst")
  reader:read_u8("hour_end_dst")
  return reader.parsed
end

--- Return a deep copy of self.args, merging defaults for unset, but required parameters.
---
--- @param self st.zwave.CommandClass.Time.OffsetReportV2
--- @return st.zwave.CommandClass.Time.OffsetReportV2Args
function OffsetReportV2._defaults(self)
  local args = {}
  args.hour_tzo = self.args.hour_tzo or 0
  args.sign_tzo = self.args.sign_tzo or false
  args.minute_tzo = self.args.minute_tzo or 0
  args.minute_offset_dst = self.args.minute_offset_dst or 0
  args.sign_offset_dst = self.args.sign_offset_dst or false
  args.month_start_dst = self.args.month_start_dst or 0
  args.day_start_dst = self.args.day_start_dst or 0
  args.hour_start_dst = self.args.hour_start_dst or 0
  args.month_end_dst = self.args.month_end_dst or 0
  args.day_end_dst = self.args.day_end_dst or 0
  args.hour_end_dst = self.args.hour_end_dst or 0
  return args
end

--- Return a deep copy of self.args, merging defaults for all unset parameters.
---
--- @param self st.zwave.CommandClass.Time.OffsetReportV2
--- @return st.zwave.CommandClass.Time.OffsetReportV2Args
function OffsetReportV2._template(self)
  local args = self:_defaults()
  return args
end

--- Set defaults for any required, but unset arguments.
---
--- @param self st.zwave.CommandClass.Time.OffsetReportV2
function OffsetReportV2._set_defaults(self)
  local defaults = self:_defaults()
  utils.merge(self.args, defaults)
end

--- Set const reflectors to allow enum stringification.
---
--- @param self st.zwave.CommandClass.Time.OffsetReportV2
function OffsetReportV2._set_reflectors(self)
end

--- @class st.zwave.CommandClass.Time.Get
--- @alias _Get st.zwave.CommandClass.Time.Get
---
--- Dynamically versioned TIME_GET
---
--- Supported versions: 1,2; unique base versions: 1
---
--- @field public cmd_class number 0x8A
--- @field public cmd_id number 0x01
--- @field public version number 1
--- @field public args st.zwave.CommandClass.Time.GetV1Args
local _Get = {}
setmetatable(_Get, {
  __call = function(cls, self, ...)
    return cls:construct(self, ...)
  end,
})

--- Construct a TIME_GET object at the module instance serialization version.
---
--- @param module st.zwave.CommandClass.Time command class module instance
--- @param args st.zwave.CommandClass.Time.GetV1Args command-specific arguments
--- @return st.zwave.CommandClass.Time.Get
function _Get:construct(module, args, ...)
  return zw.Command._construct(module, Time.GET, module._serialization_version, args, ...)
end

--- @class st.zwave.CommandClass.Time.Report
--- @alias _Report st.zwave.CommandClass.Time.Report
---
--- Dynamically versioned TIME_REPORT
---
--- Supported versions: 1,2; unique base versions: 1
---
--- @field public cmd_class number 0x8A
--- @field public cmd_id number 0x02
--- @field public version number 1
--- @field public args st.zwave.CommandClass.Time.ReportV1Args
local _Report = {}
setmetatable(_Report, {
  __call = function(cls, self, ...)
    return cls:construct(self, ...)
  end,
})

--- Construct a TIME_REPORT object at the module instance serialization version.
---
--- @param module st.zwave.CommandClass.Time command class module instance
--- @param args st.zwave.CommandClass.Time.ReportV1Args command-specific arguments
--- @return st.zwave.CommandClass.Time.Report
function _Report:construct(module, args, ...)
  return zw.Command._construct(module, Time.REPORT, module._serialization_version, args, ...)
end

--- @class st.zwave.CommandClass.Time.DateGet
--- @alias _DateGet st.zwave.CommandClass.Time.DateGet
---
--- Dynamically versioned DATE_GET
---
--- Supported versions: 1,2; unique base versions: 1
---
--- @field public cmd_class number 0x8A
--- @field public cmd_id number 0x03
--- @field public version number 1
--- @field public args st.zwave.CommandClass.Time.DateGetV1Args
local _DateGet = {}
setmetatable(_DateGet, {
  __call = function(cls, self, ...)
    return cls:construct(self, ...)
  end,
})

--- Construct a DATE_GET object at the module instance serialization version.
---
--- @param module st.zwave.CommandClass.Time command class module instance
--- @param args st.zwave.CommandClass.Time.DateGetV1Args command-specific arguments
--- @return st.zwave.CommandClass.Time.DateGet
function _DateGet:construct(module, args, ...)
  return zw.Command._construct(module, Time.DATE_GET, module._serialization_version, args, ...)
end

--- @class st.zwave.CommandClass.Time.DateReport
--- @alias _DateReport st.zwave.CommandClass.Time.DateReport
---
--- Dynamically versioned DATE_REPORT
---
--- Supported versions: 1,2; unique base versions: 1
---
--- @field public cmd_class number 0x8A
--- @field public cmd_id number 0x04
--- @field public version number 1
--- @field public args st.zwave.CommandClass.Time.DateReportV1Args
local _DateReport = {}
setmetatable(_DateReport, {
  __call = function(cls, self, ...)
    return cls:construct(self, ...)
  end,
})

--- Construct a DATE_REPORT object at the module instance serialization version.
---
--- @param module st.zwave.CommandClass.Time command class module instance
--- @param args st.zwave.CommandClass.Time.DateReportV1Args command-specific arguments
--- @return st.zwave.CommandClass.Time.DateReport
function _DateReport:construct(module, args, ...)
  return zw.Command._construct(module, Time.DATE_REPORT, module._serialization_version, args, ...)
end

--- @class st.zwave.CommandClass.Time.OffsetSet
--- @alias _OffsetSet st.zwave.CommandClass.Time.OffsetSet
---
--- Dynamically versioned TIME_OFFSET_SET
---
--- Supported versions: 2; unique base versions: 2
---
--- @field public cmd_class number 0x8A
--- @field public cmd_id number 0x05
--- @field public version number 2
--- @field public args st.zwave.CommandClass.Time.OffsetSetV2Args
local _OffsetSet = {}
setmetatable(_OffsetSet, {
  __call = function(cls, self, ...)
    return cls:construct(self, ...)
  end,
})

--- Construct a TIME_OFFSET_SET object at the module instance serialization version.
---
--- @param module st.zwave.CommandClass.Time command class module instance
--- @param args st.zwave.CommandClass.Time.OffsetSetV2Args command-specific arguments
--- @return st.zwave.CommandClass.Time.OffsetSet
function _OffsetSet:construct(module, args, ...)
  return zw.Command._construct(module, Time.OFFSET_SET, module._serialization_version, args, ...)
end

--- @class st.zwave.CommandClass.Time.OffsetGet
--- @alias _OffsetGet st.zwave.CommandClass.Time.OffsetGet
---
--- Dynamically versioned TIME_OFFSET_GET
---
--- Supported versions: 2; unique base versions: 2
---
--- @field public cmd_class number 0x8A
--- @field public cmd_id number 0x06
--- @field public version number 2
--- @field public args st.zwave.CommandClass.Time.OffsetGetV2Args
local _OffsetGet = {}
setmetatable(_OffsetGet, {
  __call = function(cls, self, ...)
    return cls:construct(self, ...)
  end,
})

--- Construct a TIME_OFFSET_GET object at the module instance serialization version.
---
--- @param module st.zwave.CommandClass.Time command class module instance
--- @param args st.zwave.CommandClass.Time.OffsetGetV2Args command-specific arguments
--- @return st.zwave.CommandClass.Time.OffsetGet
function _OffsetGet:construct(module, args, ...)
  return zw.Command._construct(module, Time.OFFSET_GET, module._serialization_version, args, ...)
end

--- @class st.zwave.CommandClass.Time.OffsetReport
--- @alias _OffsetReport st.zwave.CommandClass.Time.OffsetReport
---
--- Dynamically versioned TIME_OFFSET_REPORT
---
--- Supported versions: 2; unique base versions: 2
---
--- @field public cmd_class number 0x8A
--- @field public cmd_id number 0x07
--- @field public version number 2
--- @field public args st.zwave.CommandClass.Time.OffsetReportV2Args
local _OffsetReport = {}
setmetatable(_OffsetReport, {
  __call = function(cls, self, ...)
    return cls:construct(self, ...)
  end,
})

--- Construct a TIME_OFFSET_REPORT object at the module instance serialization version.
---
--- @param module st.zwave.CommandClass.Time command class module instance
--- @param args st.zwave.CommandClass.Time.OffsetReportV2Args command-specific arguments
--- @return st.zwave.CommandClass.Time.OffsetReport
function _OffsetReport:construct(module, args, ...)
  return zw.Command._construct(module, Time.OFFSET_REPORT, module._serialization_version, args, ...)
end

Time.GetV1 = GetV1
Time.ReportV1 = ReportV1
Time.DateGetV1 = DateGetV1
Time.DateReportV1 = DateReportV1
Time.OffsetSetV2 = OffsetSetV2
Time.OffsetGetV2 = OffsetGetV2
Time.OffsetReportV2 = OffsetReportV2
Time.Get = _Get
Time.Report = _Report
Time.DateGet = _DateGet
Time.DateReport = _DateReport
Time.OffsetSet = _OffsetSet
Time.OffsetGet = _OffsetGet
Time.OffsetReport = _OffsetReport

Time._lut = {
  [0] = { -- dynamically versioned constructors
    [Time.GET] = Time.Get,
    [Time.REPORT] = Time.Report,
    [Time.DATE_GET] = Time.DateGet,
    [Time.DATE_REPORT] = Time.DateReport,
    [Time.OFFSET_SET] = Time.OffsetSet,
    [Time.OFFSET_GET] = Time.OffsetGet,
    [Time.OFFSET_REPORT] = Time.OffsetReport
  },
  [1] = { -- version 1
    [Time.GET] = Time.GetV1,
    [Time.REPORT] = Time.ReportV1,
    [Time.DATE_GET] = Time.DateGetV1,
    [Time.DATE_REPORT] = Time.DateReportV1
  },
  [2] = { -- version 2
    [Time.GET] = Time.GetV1,
    [Time.REPORT] = Time.ReportV1,
    [Time.DATE_GET] = Time.DateGetV1,
    [Time.DATE_REPORT] = Time.DateReportV1,
    [Time.OFFSET_SET] = Time.OffsetSetV2,
    [Time.OFFSET_GET] = Time.OffsetGetV2,
    [Time.OFFSET_REPORT] = Time.OffsetReportV2
  }
}

return Time
