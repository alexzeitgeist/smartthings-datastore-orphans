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

--- @class st.zwave.CommandClass.SimpleAvControl
--- @alias SimpleAvControl st.zwave.CommandClass.SimpleAvControl
---
--- Supported versions: 1,2,3,4
---
--- @field public SET number 0x01 - SIMPLE_AV_CONTROL_SET command id
--- @field public GET number 0x02 - SIMPLE_AV_CONTROL_GET command id
--- @field public REPORT number 0x03 - SIMPLE_AV_CONTROL_REPORT command id
--- @field public SUPPORTED_GET number 0x04 - SIMPLE_AV_CONTROL_SUPPORTED_GET command id
--- @field public SUPPORTED_REPORT number 0x05 - SIMPLE_AV_CONTROL_SUPPORTED_REPORT command id
local SimpleAvControl = {}
SimpleAvControl.SET = 0x01
SimpleAvControl.GET = 0x02
SimpleAvControl.REPORT = 0x03
SimpleAvControl.SUPPORTED_GET = 0x04
SimpleAvControl.SUPPORTED_REPORT = 0x05

SimpleAvControl._commands = {
  [SimpleAvControl.SET] = "SET",
  [SimpleAvControl.GET] = "GET",
  [SimpleAvControl.REPORT] = "REPORT",
  [SimpleAvControl.SUPPORTED_GET] = "SUPPORTED_GET",
  [SimpleAvControl.SUPPORTED_REPORT] = "SUPPORTED_REPORT"
}

--- Instantiate a versioned instance of the SimpleAvControl Command Class module, optionally setting strict to require explicit passing of all parameters to constructors.
---
--- @param params st.zwave.CommandClass.Params command class instance parameters
--- @return st.zwave.CommandClass.SimpleAvControl versioned command class instance
function SimpleAvControl:init(params)
  local version = params and params.version or nil
  if (params or {}).strict ~= nil then
  local strict = params.strict
  else
  local strict = true -- default
  end
  local strict = params and params.strict or nil
  assert(version == nil or zw._versions[zw.SIMPLE_AV_CONTROL][version] ~= nil, "unsupported version")
  assert(strict == nil or type(strict) == "boolean", "strict must be a boolean")
  local mt = {
    __index = self
  }
  local instance = setmetatable({}, mt)
  instance._serialization_version = version
  instance._strict = strict
  return instance
end

setmetatable(SimpleAvControl, {
  __call = SimpleAvControl.init
})

SimpleAvControl._serialization_version = nil
SimpleAvControl._strict = false
zw._deserialization_versions = zw.deserialization_versions or {}
zw._versions = zw._versions or {}
setmetatable(zw._deserialization_versions, { __index = zw._versions })
zw._versions[zw.SIMPLE_AV_CONTROL] = {
  [1] = true,
  [2] = true,
  [3] = true,
  [4] = true
}

--- @class st.zwave.CommandClass.SimpleAvControl.SetV1ArgsVg
--- @alias SetV1ArgsVg st.zwave.CommandClass.SimpleAvControl.SetV1ArgsVg
--- @field public command integer [0,65535]
local SetV1ArgsVg = {}

--- @class st.zwave.CommandClass.SimpleAvControl.SetV1Args
--- @alias SetV1Args st.zwave.CommandClass.SimpleAvControl.SetV1Args
--- @field public sequence_number integer [0,255]
--- @field public key_attributes integer [0,7]
--- @field public reserved2 integer [0,65535]
--- @field public vg st.zwave.CommandClass.SimpleAvControl.SetV1ArgsVg[]
local SetV1Args = {}

--- @class st.zwave.CommandClass.SimpleAvControl.SetV1:st.zwave.Command
--- @alias SetV1 st.zwave.CommandClass.SimpleAvControl.SetV1
---
--- v1 and forward-compatible v2,v3,v4 SIMPLE_AV_CONTROL_SET
---
--- @field public cmd_class number 0x94
--- @field public cmd_id number 0x01
--- @field public version number 1
--- @field public args st.zwave.CommandClass.SimpleAvControl.SetV1Args command-specific arguments
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

--- Initialize a v1 and forward-compatible v2,v3,v4 SIMPLE_AV_CONTROL_SET object.
---
--- @param module st.zwave.CommandClass.SimpleAvControl command class module instance
--- @param args st.zwave.CommandClass.SimpleAvControl.SetV1Args command-specific arguments
function SetV1:init(module, args, ...)
  zw.Command._parse(self, module, zw.SIMPLE_AV_CONTROL, SimpleAvControl.SET, 1, args, ...)
end

--- Serialize v1 or forward-compatible v2,v3,v4 SIMPLE_AV_CONTROL_SET arguments.
---
--- @return string serialized payload
function SetV1:serialize()
  local writer = buf.Writer()
  local args = self.args
  writer:write_u8(args.sequence_number)
  writer:write_bits(3, args.key_attributes)
  writer:write_bits(5, 0) -- reserved
  writer:write_be_u16(args.reserved2)
  for i=1,writer.length(args.vg) do
    writer:write_be_u16(args.vg[i].command)
  end
  return writer.buf
end

--- Deserialize a v1 or forward-compatible v2,v3,v4 SIMPLE_AV_CONTROL_SET payload.
---
--- @return st.zwave.CommandClass.SimpleAvControl.SetV1Args deserialized arguments
function SetV1:deserialize()
  local reader = buf.Reader(self.payload)
  reader:read_u8("sequence_number")
  reader:read_bits(3, "key_attributes")
  reader:read_bits(5) -- reserved
  reader:read_be_u16("reserved2")
  reader.parsed.vg = {}
  while reader:remain() > 0 do
    local i = #reader.parsed.vg + 1
    reader.parsed.vg[i] = {}
    reader:read_be_u16("command", reader.parsed.vg[i])
  end
  return reader.parsed
end

--- Return a deep copy of self.args, merging defaults for unset, but required parameters.
---
--- @param self st.zwave.CommandClass.SimpleAvControl.SetV1
--- @return st.zwave.CommandClass.SimpleAvControl.SetV1Args
function SetV1._defaults(self)
  local args = {}
  args.sequence_number = self.args.sequence_number or 0
  args.key_attributes = self.args.key_attributes or 0
  args.reserved2 = self.args.reserved2 or 0
  args.vg = self.args.vg or {}
  for i=1,buf.Writer.length(args.vg) do
    args.vg[i] = args.vg[i] or {}
    args.vg[i].command = self.args.vg[i].command or 0
  end
  return args
end

--- Return a deep copy of self.args, merging defaults for all unset parameters.
---
--- @param self st.zwave.CommandClass.SimpleAvControl.SetV1
--- @return st.zwave.CommandClass.SimpleAvControl.SetV1Args
function SetV1._template(self)
  local args = self:_defaults()
  local writer = buf.Writer()
  for i=1,buf.Writer.length(args.vg) do
    args.vg[i] = args.vg[i] or {}
  end
  return args
end

--- Set defaults for any required, but unset arguments.
---
--- @param self st.zwave.CommandClass.SimpleAvControl.SetV1
function SetV1._set_defaults(self)
  local defaults = self:_defaults()
  utils.merge(self.args, defaults)
end

--- Set const reflectors to allow enum stringification.
---
--- @param self st.zwave.CommandClass.SimpleAvControl.SetV1
function SetV1._set_reflectors(self)
end

--- @class st.zwave.CommandClass.SimpleAvControl.GetV1Args
--- @alias GetV1Args st.zwave.CommandClass.SimpleAvControl.GetV1Args
local GetV1Args = {}

--- @class st.zwave.CommandClass.SimpleAvControl.GetV1:st.zwave.Command
--- @alias GetV1 st.zwave.CommandClass.SimpleAvControl.GetV1
---
--- v1 and forward-compatible v2,v3,v4 SIMPLE_AV_CONTROL_GET
---
--- @field public cmd_class number 0x94
--- @field public cmd_id number 0x02
--- @field public version number 1
--- @field public args st.zwave.CommandClass.SimpleAvControl.GetV1Args command-specific arguments
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

--- Initialize a v1 and forward-compatible v2,v3,v4 SIMPLE_AV_CONTROL_GET object.
---
--- @param module st.zwave.CommandClass.SimpleAvControl command class module instance
--- @param args st.zwave.CommandClass.SimpleAvControl.GetV1Args command-specific arguments
function GetV1:init(module, args, ...)
  zw.Command._parse(self, module, zw.SIMPLE_AV_CONTROL, SimpleAvControl.GET, 1, args, ...)
end

--- Serialize v1 or forward-compatible v2,v3,v4 SIMPLE_AV_CONTROL_GET arguments.
---
--- @return string serialized payload
function GetV1:serialize()
  local writer = buf.Writer()
  return writer.buf
end

--- Deserialize a v1 or forward-compatible v2,v3,v4 SIMPLE_AV_CONTROL_GET payload.
---
--- @return st.zwave.CommandClass.SimpleAvControl.GetV1Args deserialized arguments
function GetV1:deserialize()
  local reader = buf.Reader(self.payload)
  return reader.parsed
end

--- Return a deep copy of self.args, merging defaults for unset, but required parameters.
---
--- @param self st.zwave.CommandClass.SimpleAvControl.GetV1
--- @return st.zwave.CommandClass.SimpleAvControl.GetV1Args
function GetV1._defaults(self)
  return {}
end

--- Return a deep copy of self.args, merging defaults for all unset parameters.
---
--- @param self st.zwave.CommandClass.SimpleAvControl.GetV1
--- @return st.zwave.CommandClass.SimpleAvControl.GetV1Args
function GetV1._template(self)
  return {}
end

--- Set defaults for any required, but unset arguments.
---
--- @param self st.zwave.CommandClass.SimpleAvControl.GetV1
function GetV1._set_defaults(self)
  local defaults = self:_defaults()
  utils.merge(self.args, defaults)
end

--- Set const reflectors to allow enum stringification.
---
--- @param self st.zwave.CommandClass.SimpleAvControl.GetV1
function GetV1._set_reflectors(self)
end

--- @class st.zwave.CommandClass.SimpleAvControl.ReportV1Args
--- @alias ReportV1Args st.zwave.CommandClass.SimpleAvControl.ReportV1Args
--- @field public number_of_reports integer [0,255]
local ReportV1Args = {}

--- @class st.zwave.CommandClass.SimpleAvControl.ReportV1:st.zwave.Command
--- @alias ReportV1 st.zwave.CommandClass.SimpleAvControl.ReportV1
---
--- v1 and forward-compatible v2,v3,v4 SIMPLE_AV_CONTROL_REPORT
---
--- @field public cmd_class number 0x94
--- @field public cmd_id number 0x03
--- @field public version number 1
--- @field public args st.zwave.CommandClass.SimpleAvControl.ReportV1Args command-specific arguments
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

--- Initialize a v1 and forward-compatible v2,v3,v4 SIMPLE_AV_CONTROL_REPORT object.
---
--- @param module st.zwave.CommandClass.SimpleAvControl command class module instance
--- @param args st.zwave.CommandClass.SimpleAvControl.ReportV1Args command-specific arguments
function ReportV1:init(module, args, ...)
  zw.Command._parse(self, module, zw.SIMPLE_AV_CONTROL, SimpleAvControl.REPORT, 1, args, ...)
end

--- Serialize v1 or forward-compatible v2,v3,v4 SIMPLE_AV_CONTROL_REPORT arguments.
---
--- @return string serialized payload
function ReportV1:serialize()
  local writer = buf.Writer()
  local args = self.args
  writer:write_u8(args.number_of_reports)
  return writer.buf
end

--- Deserialize a v1 or forward-compatible v2,v3,v4 SIMPLE_AV_CONTROL_REPORT payload.
---
--- @return st.zwave.CommandClass.SimpleAvControl.ReportV1Args deserialized arguments
function ReportV1:deserialize()
  local reader = buf.Reader(self.payload)
  reader:read_u8("number_of_reports")
  return reader.parsed
end

--- Return a deep copy of self.args, merging defaults for unset, but required parameters.
---
--- @param self st.zwave.CommandClass.SimpleAvControl.ReportV1
--- @return st.zwave.CommandClass.SimpleAvControl.ReportV1Args
function ReportV1._defaults(self)
  local args = {}
  args.number_of_reports = self.args.number_of_reports or 0
  return args
end

--- Return a deep copy of self.args, merging defaults for all unset parameters.
---
--- @param self st.zwave.CommandClass.SimpleAvControl.ReportV1
--- @return st.zwave.CommandClass.SimpleAvControl.ReportV1Args
function ReportV1._template(self)
  local args = self:_defaults()
  return args
end

--- Set defaults for any required, but unset arguments.
---
--- @param self st.zwave.CommandClass.SimpleAvControl.ReportV1
function ReportV1._set_defaults(self)
  local defaults = self:_defaults()
  utils.merge(self.args, defaults)
end

--- Set const reflectors to allow enum stringification.
---
--- @param self st.zwave.CommandClass.SimpleAvControl.ReportV1
function ReportV1._set_reflectors(self)
end

--- @class st.zwave.CommandClass.SimpleAvControl.SupportedGetV1Args
--- @alias SupportedGetV1Args st.zwave.CommandClass.SimpleAvControl.SupportedGetV1Args
--- @field public report_no integer [0,255]
local SupportedGetV1Args = {}

--- @class st.zwave.CommandClass.SimpleAvControl.SupportedGetV1:st.zwave.Command
--- @alias SupportedGetV1 st.zwave.CommandClass.SimpleAvControl.SupportedGetV1
---
--- v1 and forward-compatible v2,v3,v4 SIMPLE_AV_CONTROL_SUPPORTED_GET
---
--- @field public cmd_class number 0x94
--- @field public cmd_id number 0x04
--- @field public version number 1
--- @field public args st.zwave.CommandClass.SimpleAvControl.SupportedGetV1Args command-specific arguments
local SupportedGetV1 = {}
setmetatable(SupportedGetV1, {
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

--- Initialize a v1 and forward-compatible v2,v3,v4 SIMPLE_AV_CONTROL_SUPPORTED_GET object.
---
--- @param module st.zwave.CommandClass.SimpleAvControl command class module instance
--- @param args st.zwave.CommandClass.SimpleAvControl.SupportedGetV1Args command-specific arguments
function SupportedGetV1:init(module, args, ...)
  zw.Command._parse(self, module, zw.SIMPLE_AV_CONTROL, SimpleAvControl.SUPPORTED_GET, 1, args, ...)
end

--- Serialize v1 or forward-compatible v2,v3,v4 SIMPLE_AV_CONTROL_SUPPORTED_GET arguments.
---
--- @return string serialized payload
function SupportedGetV1:serialize()
  local writer = buf.Writer()
  local args = self.args
  writer:write_u8(args.report_no)
  return writer.buf
end

--- Deserialize a v1 or forward-compatible v2,v3,v4 SIMPLE_AV_CONTROL_SUPPORTED_GET payload.
---
--- @return st.zwave.CommandClass.SimpleAvControl.SupportedGetV1Args deserialized arguments
function SupportedGetV1:deserialize()
  local reader = buf.Reader(self.payload)
  reader:read_u8("report_no")
  return reader.parsed
end

--- Return a deep copy of self.args, merging defaults for unset, but required parameters.
---
--- @param self st.zwave.CommandClass.SimpleAvControl.SupportedGetV1
--- @return st.zwave.CommandClass.SimpleAvControl.SupportedGetV1Args
function SupportedGetV1._defaults(self)
  local args = {}
  args.report_no = self.args.report_no or 0
  return args
end

--- Return a deep copy of self.args, merging defaults for all unset parameters.
---
--- @param self st.zwave.CommandClass.SimpleAvControl.SupportedGetV1
--- @return st.zwave.CommandClass.SimpleAvControl.SupportedGetV1Args
function SupportedGetV1._template(self)
  local args = self:_defaults()
  return args
end

--- Set defaults for any required, but unset arguments.
---
--- @param self st.zwave.CommandClass.SimpleAvControl.SupportedGetV1
function SupportedGetV1._set_defaults(self)
  local defaults = self:_defaults()
  utils.merge(self.args, defaults)
end

--- Set const reflectors to allow enum stringification.
---
--- @param self st.zwave.CommandClass.SimpleAvControl.SupportedGetV1
function SupportedGetV1._set_reflectors(self)
end

--- @class st.zwave.CommandClass.SimpleAvControl.SupportedReportV1Args
--- @alias SupportedReportV1Args st.zwave.CommandClass.SimpleAvControl.SupportedReportV1Args
--- @field public report_no integer [0,255]
--- @field public bit_mask string
local SupportedReportV1Args = {}

--- @class st.zwave.CommandClass.SimpleAvControl.SupportedReportV1:st.zwave.Command
--- @alias SupportedReportV1 st.zwave.CommandClass.SimpleAvControl.SupportedReportV1
---
--- v1 and forward-compatible v2,v3,v4 SIMPLE_AV_CONTROL_SUPPORTED_REPORT
---
--- @field public cmd_class number 0x94
--- @field public cmd_id number 0x05
--- @field public version number 1
--- @field public args st.zwave.CommandClass.SimpleAvControl.SupportedReportV1Args command-specific arguments
local SupportedReportV1 = {}
setmetatable(SupportedReportV1, {
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

--- Initialize a v1 and forward-compatible v2,v3,v4 SIMPLE_AV_CONTROL_SUPPORTED_REPORT object.
---
--- @param module st.zwave.CommandClass.SimpleAvControl command class module instance
--- @param args st.zwave.CommandClass.SimpleAvControl.SupportedReportV1Args command-specific arguments
function SupportedReportV1:init(module, args, ...)
  zw.Command._parse(self, module, zw.SIMPLE_AV_CONTROL, SimpleAvControl.SUPPORTED_REPORT, 1, args, ...)
end

--- Serialize v1 or forward-compatible v2,v3,v4 SIMPLE_AV_CONTROL_SUPPORTED_REPORT arguments.
---
--- @return string serialized payload
function SupportedReportV1:serialize()
  local writer = buf.Writer()
  local args = self.args
  writer:write_u8(args.report_no)
  writer:write_bytes(args.bit_mask)
  return writer.buf
end

--- Deserialize a v1 or forward-compatible v2,v3,v4 SIMPLE_AV_CONTROL_SUPPORTED_REPORT payload.
---
--- @return st.zwave.CommandClass.SimpleAvControl.SupportedReportV1Args deserialized arguments
function SupportedReportV1:deserialize()
  local reader = buf.Reader(self.payload)
  reader:read_u8("report_no")
  reader:read_bytes(reader:remain(), "bit_mask")
  return reader.parsed
end

--- Return a deep copy of self.args, merging defaults for unset, but required parameters.
---
--- @param self st.zwave.CommandClass.SimpleAvControl.SupportedReportV1
--- @return st.zwave.CommandClass.SimpleAvControl.SupportedReportV1Args
function SupportedReportV1._defaults(self)
  local args = {}
  args.report_no = self.args.report_no or 0
  args.bit_mask = self.args.bit_mask or ""
  return args
end

--- Return a deep copy of self.args, merging defaults for all unset parameters.
---
--- @param self st.zwave.CommandClass.SimpleAvControl.SupportedReportV1
--- @return st.zwave.CommandClass.SimpleAvControl.SupportedReportV1Args
function SupportedReportV1._template(self)
  local args = self:_defaults()
  return args
end

--- Set defaults for any required, but unset arguments.
---
--- @param self st.zwave.CommandClass.SimpleAvControl.SupportedReportV1
function SupportedReportV1._set_defaults(self)
  local defaults = self:_defaults()
  utils.merge(self.args, defaults)
end

--- Set const reflectors to allow enum stringification.
---
--- @param self st.zwave.CommandClass.SimpleAvControl.SupportedReportV1
function SupportedReportV1._set_reflectors(self)
end

--- @class st.zwave.CommandClass.SimpleAvControl.Set
--- @alias _Set st.zwave.CommandClass.SimpleAvControl.Set
---
--- Dynamically versioned SIMPLE_AV_CONTROL_SET
---
--- Supported versions: 1,2,3,4; unique base versions: 1
---
--- @field public cmd_class number 0x94
--- @field public cmd_id number 0x01
--- @field public version number 1
--- @field public args st.zwave.CommandClass.SimpleAvControl.SetV1Args
local _Set = {}
setmetatable(_Set, {
  __call = function(cls, self, ...)
    return cls:construct(self, ...)
  end,
})

--- Construct a SIMPLE_AV_CONTROL_SET object at the module instance serialization version.
---
--- @param module st.zwave.CommandClass.SimpleAvControl command class module instance
--- @param args st.zwave.CommandClass.SimpleAvControl.SetV1Args command-specific arguments
--- @return st.zwave.CommandClass.SimpleAvControl.Set
function _Set:construct(module, args, ...)
  return zw.Command._construct(module, SimpleAvControl.SET, module._serialization_version, args, ...)
end

--- @class st.zwave.CommandClass.SimpleAvControl.Get
--- @alias _Get st.zwave.CommandClass.SimpleAvControl.Get
---
--- Dynamically versioned SIMPLE_AV_CONTROL_GET
---
--- Supported versions: 1,2,3,4; unique base versions: 1
---
--- @field public cmd_class number 0x94
--- @field public cmd_id number 0x02
--- @field public version number 1
--- @field public args st.zwave.CommandClass.SimpleAvControl.GetV1Args
local _Get = {}
setmetatable(_Get, {
  __call = function(cls, self, ...)
    return cls:construct(self, ...)
  end,
})

--- Construct a SIMPLE_AV_CONTROL_GET object at the module instance serialization version.
---
--- @param module st.zwave.CommandClass.SimpleAvControl command class module instance
--- @param args st.zwave.CommandClass.SimpleAvControl.GetV1Args command-specific arguments
--- @return st.zwave.CommandClass.SimpleAvControl.Get
function _Get:construct(module, args, ...)
  return zw.Command._construct(module, SimpleAvControl.GET, module._serialization_version, args, ...)
end

--- @class st.zwave.CommandClass.SimpleAvControl.Report
--- @alias _Report st.zwave.CommandClass.SimpleAvControl.Report
---
--- Dynamically versioned SIMPLE_AV_CONTROL_REPORT
---
--- Supported versions: 1,2,3,4; unique base versions: 1
---
--- @field public cmd_class number 0x94
--- @field public cmd_id number 0x03
--- @field public version number 1
--- @field public args st.zwave.CommandClass.SimpleAvControl.ReportV1Args
local _Report = {}
setmetatable(_Report, {
  __call = function(cls, self, ...)
    return cls:construct(self, ...)
  end,
})

--- Construct a SIMPLE_AV_CONTROL_REPORT object at the module instance serialization version.
---
--- @param module st.zwave.CommandClass.SimpleAvControl command class module instance
--- @param args st.zwave.CommandClass.SimpleAvControl.ReportV1Args command-specific arguments
--- @return st.zwave.CommandClass.SimpleAvControl.Report
function _Report:construct(module, args, ...)
  return zw.Command._construct(module, SimpleAvControl.REPORT, module._serialization_version, args, ...)
end

--- @class st.zwave.CommandClass.SimpleAvControl.SupportedGet
--- @alias _SupportedGet st.zwave.CommandClass.SimpleAvControl.SupportedGet
---
--- Dynamically versioned SIMPLE_AV_CONTROL_SUPPORTED_GET
---
--- Supported versions: 1,2,3,4; unique base versions: 1
---
--- @field public cmd_class number 0x94
--- @field public cmd_id number 0x04
--- @field public version number 1
--- @field public args st.zwave.CommandClass.SimpleAvControl.SupportedGetV1Args
local _SupportedGet = {}
setmetatable(_SupportedGet, {
  __call = function(cls, self, ...)
    return cls:construct(self, ...)
  end,
})

--- Construct a SIMPLE_AV_CONTROL_SUPPORTED_GET object at the module instance serialization version.
---
--- @param module st.zwave.CommandClass.SimpleAvControl command class module instance
--- @param args st.zwave.CommandClass.SimpleAvControl.SupportedGetV1Args command-specific arguments
--- @return st.zwave.CommandClass.SimpleAvControl.SupportedGet
function _SupportedGet:construct(module, args, ...)
  return zw.Command._construct(module, SimpleAvControl.SUPPORTED_GET, module._serialization_version, args, ...)
end

--- @class st.zwave.CommandClass.SimpleAvControl.SupportedReport
--- @alias _SupportedReport st.zwave.CommandClass.SimpleAvControl.SupportedReport
---
--- Dynamically versioned SIMPLE_AV_CONTROL_SUPPORTED_REPORT
---
--- Supported versions: 1,2,3,4; unique base versions: 1
---
--- @field public cmd_class number 0x94
--- @field public cmd_id number 0x05
--- @field public version number 1
--- @field public args st.zwave.CommandClass.SimpleAvControl.SupportedReportV1Args
local _SupportedReport = {}
setmetatable(_SupportedReport, {
  __call = function(cls, self, ...)
    return cls:construct(self, ...)
  end,
})

--- Construct a SIMPLE_AV_CONTROL_SUPPORTED_REPORT object at the module instance serialization version.
---
--- @param module st.zwave.CommandClass.SimpleAvControl command class module instance
--- @param args st.zwave.CommandClass.SimpleAvControl.SupportedReportV1Args command-specific arguments
--- @return st.zwave.CommandClass.SimpleAvControl.SupportedReport
function _SupportedReport:construct(module, args, ...)
  return zw.Command._construct(module, SimpleAvControl.SUPPORTED_REPORT, module._serialization_version, args, ...)
end

SimpleAvControl.SetV1 = SetV1
SimpleAvControl.GetV1 = GetV1
SimpleAvControl.ReportV1 = ReportV1
SimpleAvControl.SupportedGetV1 = SupportedGetV1
SimpleAvControl.SupportedReportV1 = SupportedReportV1
SimpleAvControl.Set = _Set
SimpleAvControl.Get = _Get
SimpleAvControl.Report = _Report
SimpleAvControl.SupportedGet = _SupportedGet
SimpleAvControl.SupportedReport = _SupportedReport

SimpleAvControl._lut = {
  [0] = { -- dynamically versioned constructors
    [SimpleAvControl.SET] = SimpleAvControl.Set,
    [SimpleAvControl.GET] = SimpleAvControl.Get,
    [SimpleAvControl.REPORT] = SimpleAvControl.Report,
    [SimpleAvControl.SUPPORTED_GET] = SimpleAvControl.SupportedGet,
    [SimpleAvControl.SUPPORTED_REPORT] = SimpleAvControl.SupportedReport
  },
  [1] = { -- version 1
    [SimpleAvControl.SET] = SimpleAvControl.SetV1,
    [SimpleAvControl.GET] = SimpleAvControl.GetV1,
    [SimpleAvControl.REPORT] = SimpleAvControl.ReportV1,
    [SimpleAvControl.SUPPORTED_GET] = SimpleAvControl.SupportedGetV1,
    [SimpleAvControl.SUPPORTED_REPORT] = SimpleAvControl.SupportedReportV1
  },
  [2] = { -- version 2
    [SimpleAvControl.SET] = SimpleAvControl.SetV1,
    [SimpleAvControl.GET] = SimpleAvControl.GetV1,
    [SimpleAvControl.REPORT] = SimpleAvControl.ReportV1,
    [SimpleAvControl.SUPPORTED_GET] = SimpleAvControl.SupportedGetV1,
    [SimpleAvControl.SUPPORTED_REPORT] = SimpleAvControl.SupportedReportV1
  },
  [3] = { -- version 3
    [SimpleAvControl.SET] = SimpleAvControl.SetV1,
    [SimpleAvControl.GET] = SimpleAvControl.GetV1,
    [SimpleAvControl.REPORT] = SimpleAvControl.ReportV1,
    [SimpleAvControl.SUPPORTED_GET] = SimpleAvControl.SupportedGetV1,
    [SimpleAvControl.SUPPORTED_REPORT] = SimpleAvControl.SupportedReportV1
  },
  [4] = { -- version 4
    [SimpleAvControl.SET] = SimpleAvControl.SetV1,
    [SimpleAvControl.GET] = SimpleAvControl.GetV1,
    [SimpleAvControl.REPORT] = SimpleAvControl.ReportV1,
    [SimpleAvControl.SUPPORTED_GET] = SimpleAvControl.SupportedGetV1,
    [SimpleAvControl.SUPPORTED_REPORT] = SimpleAvControl.SupportedReportV1
  }
}

return SimpleAvControl
