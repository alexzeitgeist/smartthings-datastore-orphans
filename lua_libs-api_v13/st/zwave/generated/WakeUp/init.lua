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

--- @class st.zwave.CommandClass.WakeUp
--- @alias WakeUp st.zwave.CommandClass.WakeUp
---
--- Supported versions: 1,2,3
---
--- @field public INTERVAL_SET number 0x04 - WAKE_UP_INTERVAL_SET command id
--- @field public INTERVAL_GET number 0x05 - WAKE_UP_INTERVAL_GET command id
--- @field public INTERVAL_REPORT number 0x06 - WAKE_UP_INTERVAL_REPORT command id
--- @field public NOTIFICATION number 0x07 - WAKE_UP_NOTIFICATION command id
--- @field public INTERVAL_CAPABILITIES_GET number 0x09 - WAKE_UP_INTERVAL_CAPABILITIES_GET command id
--- @field public INTERVAL_CAPABILITIES_REPORT number 0x0A - WAKE_UP_INTERVAL_CAPABILITIES_REPORT command id
local WakeUp = {}
WakeUp.INTERVAL_SET = 0x04
WakeUp.INTERVAL_GET = 0x05
WakeUp.INTERVAL_REPORT = 0x06
WakeUp.NOTIFICATION = 0x07
WakeUp.INTERVAL_CAPABILITIES_GET = 0x09
WakeUp.INTERVAL_CAPABILITIES_REPORT = 0x0A

WakeUp._commands = {
  [WakeUp.INTERVAL_SET] = "INTERVAL_SET",
  [WakeUp.INTERVAL_GET] = "INTERVAL_GET",
  [WakeUp.INTERVAL_REPORT] = "INTERVAL_REPORT",
  [WakeUp.NOTIFICATION] = "NOTIFICATION",
  [WakeUp.INTERVAL_CAPABILITIES_GET] = "INTERVAL_CAPABILITIES_GET",
  [WakeUp.INTERVAL_CAPABILITIES_REPORT] = "INTERVAL_CAPABILITIES_REPORT"
}

--- Instantiate a versioned instance of the WakeUp Command Class module, optionally setting strict to require explicit passing of all parameters to constructors.
---
--- @param params st.zwave.CommandClass.Params command class instance parameters
--- @return st.zwave.CommandClass.WakeUp versioned command class instance
function WakeUp:init(params)
  local version = params and params.version or nil
  if (params or {}).strict ~= nil then
  local strict = params.strict
  else
  local strict = true -- default
  end
  local strict = params and params.strict or nil
  assert(version == nil or zw._versions[zw.WAKE_UP][version] ~= nil, "unsupported version")
  assert(strict == nil or type(strict) == "boolean", "strict must be a boolean")
  local mt = {
    __index = self
  }
  local instance = setmetatable({}, mt)
  instance._serialization_version = version
  instance._strict = strict
  return instance
end

setmetatable(WakeUp, {
  __call = WakeUp.init
})

WakeUp._serialization_version = nil
WakeUp._strict = false
zw._deserialization_versions = zw.deserialization_versions or {}
zw._versions = zw._versions or {}
setmetatable(zw._deserialization_versions, { __index = zw._versions })
zw._versions[zw.WAKE_UP] = {
  [1] = true,
  [2] = true,
  [3] = true
}

--- @class st.zwave.CommandClass.WakeUp.IntervalSetV1Args
--- @alias IntervalSetV1Args st.zwave.CommandClass.WakeUp.IntervalSetV1Args
--- @field public seconds integer [0,16777215]
--- @field public node_id integer [0,255]
local IntervalSetV1Args = {}

--- @class st.zwave.CommandClass.WakeUp.IntervalSetV1:st.zwave.Command
--- @alias IntervalSetV1 st.zwave.CommandClass.WakeUp.IntervalSetV1
---
--- v1 and forward-compatible v2,v3 WAKE_UP_INTERVAL_SET
---
--- @field public cmd_class number 0x84
--- @field public cmd_id number 0x04
--- @field public version number 1
--- @field public args st.zwave.CommandClass.WakeUp.IntervalSetV1Args command-specific arguments
local IntervalSetV1 = {}
setmetatable(IntervalSetV1, {
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

--- Initialize a v1 and forward-compatible v2,v3 WAKE_UP_INTERVAL_SET object.
---
--- @param module st.zwave.CommandClass.WakeUp command class module instance
--- @param args st.zwave.CommandClass.WakeUp.IntervalSetV1Args command-specific arguments
function IntervalSetV1:init(module, args, ...)
  zw.Command._parse(self, module, zw.WAKE_UP, WakeUp.INTERVAL_SET, 1, args, ...)
end

--- Serialize v1 or forward-compatible v2,v3 WAKE_UP_INTERVAL_SET arguments.
---
--- @return string serialized payload
function IntervalSetV1:serialize()
  local writer = buf.Writer()
  local args = self.args
  writer:write_be_u24(args.seconds)
  writer:write_u8(args.node_id)
  return writer.buf
end

--- Deserialize a v1 or forward-compatible v2,v3 WAKE_UP_INTERVAL_SET payload.
---
--- @return st.zwave.CommandClass.WakeUp.IntervalSetV1Args deserialized arguments
function IntervalSetV1:deserialize()
  local reader = buf.Reader(self.payload)
  reader:read_be_u24("seconds")
  reader:read_u8("node_id")
  return reader.parsed
end

--- Return a deep copy of self.args, merging defaults for unset, but required parameters.
---
--- @param self st.zwave.CommandClass.WakeUp.IntervalSetV1
--- @return st.zwave.CommandClass.WakeUp.IntervalSetV1Args
function IntervalSetV1._defaults(self)
  local args = {}
  args.seconds = self.args.seconds or 0
  args.node_id = self.args.node_id or 0
  return args
end

--- Return a deep copy of self.args, merging defaults for all unset parameters.
---
--- @param self st.zwave.CommandClass.WakeUp.IntervalSetV1
--- @return st.zwave.CommandClass.WakeUp.IntervalSetV1Args
function IntervalSetV1._template(self)
  local args = self:_defaults()
  return args
end

--- Set defaults for any required, but unset arguments.
---
--- @param self st.zwave.CommandClass.WakeUp.IntervalSetV1
function IntervalSetV1._set_defaults(self)
  local defaults = self:_defaults()
  utils.merge(self.args, defaults)
end

--- Set const reflectors to allow enum stringification.
---
--- @param self st.zwave.CommandClass.WakeUp.IntervalSetV1
function IntervalSetV1._set_reflectors(self)
end

--- @class st.zwave.CommandClass.WakeUp.IntervalGetV1Args
--- @alias IntervalGetV1Args st.zwave.CommandClass.WakeUp.IntervalGetV1Args
local IntervalGetV1Args = {}

--- @class st.zwave.CommandClass.WakeUp.IntervalGetV1:st.zwave.Command
--- @alias IntervalGetV1 st.zwave.CommandClass.WakeUp.IntervalGetV1
---
--- v1 and forward-compatible v2,v3 WAKE_UP_INTERVAL_GET
---
--- @field public cmd_class number 0x84
--- @field public cmd_id number 0x05
--- @field public version number 1
--- @field public args st.zwave.CommandClass.WakeUp.IntervalGetV1Args command-specific arguments
local IntervalGetV1 = {}
setmetatable(IntervalGetV1, {
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

--- Initialize a v1 and forward-compatible v2,v3 WAKE_UP_INTERVAL_GET object.
---
--- @param module st.zwave.CommandClass.WakeUp command class module instance
--- @param args st.zwave.CommandClass.WakeUp.IntervalGetV1Args command-specific arguments
function IntervalGetV1:init(module, args, ...)
  zw.Command._parse(self, module, zw.WAKE_UP, WakeUp.INTERVAL_GET, 1, args, ...)
end

--- Serialize v1 or forward-compatible v2,v3 WAKE_UP_INTERVAL_GET arguments.
---
--- @return string serialized payload
function IntervalGetV1:serialize()
  local writer = buf.Writer()
  return writer.buf
end

--- Deserialize a v1 or forward-compatible v2,v3 WAKE_UP_INTERVAL_GET payload.
---
--- @return st.zwave.CommandClass.WakeUp.IntervalGetV1Args deserialized arguments
function IntervalGetV1:deserialize()
  local reader = buf.Reader(self.payload)
  return reader.parsed
end

--- Return a deep copy of self.args, merging defaults for unset, but required parameters.
---
--- @param self st.zwave.CommandClass.WakeUp.IntervalGetV1
--- @return st.zwave.CommandClass.WakeUp.IntervalGetV1Args
function IntervalGetV1._defaults(self)
  return {}
end

--- Return a deep copy of self.args, merging defaults for all unset parameters.
---
--- @param self st.zwave.CommandClass.WakeUp.IntervalGetV1
--- @return st.zwave.CommandClass.WakeUp.IntervalGetV1Args
function IntervalGetV1._template(self)
  return {}
end

--- Set defaults for any required, but unset arguments.
---
--- @param self st.zwave.CommandClass.WakeUp.IntervalGetV1
function IntervalGetV1._set_defaults(self)
  local defaults = self:_defaults()
  utils.merge(self.args, defaults)
end

--- Set const reflectors to allow enum stringification.
---
--- @param self st.zwave.CommandClass.WakeUp.IntervalGetV1
function IntervalGetV1._set_reflectors(self)
end

--- @class st.zwave.CommandClass.WakeUp.IntervalReportV1Args
--- @alias IntervalReportV1Args st.zwave.CommandClass.WakeUp.IntervalReportV1Args
--- @field public seconds integer [0,16777215]
--- @field public node_id integer [0,255]
local IntervalReportV1Args = {}

--- @class st.zwave.CommandClass.WakeUp.IntervalReportV1:st.zwave.Command
--- @alias IntervalReportV1 st.zwave.CommandClass.WakeUp.IntervalReportV1
---
--- v1 and forward-compatible v2,v3 WAKE_UP_INTERVAL_REPORT
---
--- @field public cmd_class number 0x84
--- @field public cmd_id number 0x06
--- @field public version number 1
--- @field public args st.zwave.CommandClass.WakeUp.IntervalReportV1Args command-specific arguments
local IntervalReportV1 = {}
setmetatable(IntervalReportV1, {
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

--- Initialize a v1 and forward-compatible v2,v3 WAKE_UP_INTERVAL_REPORT object.
---
--- @param module st.zwave.CommandClass.WakeUp command class module instance
--- @param args st.zwave.CommandClass.WakeUp.IntervalReportV1Args command-specific arguments
function IntervalReportV1:init(module, args, ...)
  zw.Command._parse(self, module, zw.WAKE_UP, WakeUp.INTERVAL_REPORT, 1, args, ...)
end

--- Serialize v1 or forward-compatible v2,v3 WAKE_UP_INTERVAL_REPORT arguments.
---
--- @return string serialized payload
function IntervalReportV1:serialize()
  local writer = buf.Writer()
  local args = self.args
  writer:write_be_u24(args.seconds)
  writer:write_u8(args.node_id)
  return writer.buf
end

--- Deserialize a v1 or forward-compatible v2,v3 WAKE_UP_INTERVAL_REPORT payload.
---
--- @return st.zwave.CommandClass.WakeUp.IntervalReportV1Args deserialized arguments
function IntervalReportV1:deserialize()
  local reader = buf.Reader(self.payload)
  reader:read_be_u24("seconds")
  reader:read_u8("node_id")
  return reader.parsed
end

--- Return a deep copy of self.args, merging defaults for unset, but required parameters.
---
--- @param self st.zwave.CommandClass.WakeUp.IntervalReportV1
--- @return st.zwave.CommandClass.WakeUp.IntervalReportV1Args
function IntervalReportV1._defaults(self)
  local args = {}
  args.seconds = self.args.seconds or 0
  args.node_id = self.args.node_id or 0
  return args
end

--- Return a deep copy of self.args, merging defaults for all unset parameters.
---
--- @param self st.zwave.CommandClass.WakeUp.IntervalReportV1
--- @return st.zwave.CommandClass.WakeUp.IntervalReportV1Args
function IntervalReportV1._template(self)
  local args = self:_defaults()
  return args
end

--- Set defaults for any required, but unset arguments.
---
--- @param self st.zwave.CommandClass.WakeUp.IntervalReportV1
function IntervalReportV1._set_defaults(self)
  local defaults = self:_defaults()
  utils.merge(self.args, defaults)
end

--- Set const reflectors to allow enum stringification.
---
--- @param self st.zwave.CommandClass.WakeUp.IntervalReportV1
function IntervalReportV1._set_reflectors(self)
end

--- @class st.zwave.CommandClass.WakeUp.NotificationV1Args
--- @alias NotificationV1Args st.zwave.CommandClass.WakeUp.NotificationV1Args
local NotificationV1Args = {}

--- @class st.zwave.CommandClass.WakeUp.NotificationV1:st.zwave.Command
--- @alias NotificationV1 st.zwave.CommandClass.WakeUp.NotificationV1
---
--- v1 and forward-compatible v2,v3 WAKE_UP_NOTIFICATION
---
--- @field public cmd_class number 0x84
--- @field public cmd_id number 0x07
--- @field public version number 1
--- @field public args st.zwave.CommandClass.WakeUp.NotificationV1Args command-specific arguments
local NotificationV1 = {}
setmetatable(NotificationV1, {
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

--- Initialize a v1 and forward-compatible v2,v3 WAKE_UP_NOTIFICATION object.
---
--- @param module st.zwave.CommandClass.WakeUp command class module instance
--- @param args st.zwave.CommandClass.WakeUp.NotificationV1Args command-specific arguments
function NotificationV1:init(module, args, ...)
  zw.Command._parse(self, module, zw.WAKE_UP, WakeUp.NOTIFICATION, 1, args, ...)
end

--- Serialize v1 or forward-compatible v2,v3 WAKE_UP_NOTIFICATION arguments.
---
--- @return string serialized payload
function NotificationV1:serialize()
  local writer = buf.Writer()
  return writer.buf
end

--- Deserialize a v1 or forward-compatible v2,v3 WAKE_UP_NOTIFICATION payload.
---
--- @return st.zwave.CommandClass.WakeUp.NotificationV1Args deserialized arguments
function NotificationV1:deserialize()
  local reader = buf.Reader(self.payload)
  return reader.parsed
end

--- Return a deep copy of self.args, merging defaults for unset, but required parameters.
---
--- @param self st.zwave.CommandClass.WakeUp.NotificationV1
--- @return st.zwave.CommandClass.WakeUp.NotificationV1Args
function NotificationV1._defaults(self)
  return {}
end

--- Return a deep copy of self.args, merging defaults for all unset parameters.
---
--- @param self st.zwave.CommandClass.WakeUp.NotificationV1
--- @return st.zwave.CommandClass.WakeUp.NotificationV1Args
function NotificationV1._template(self)
  return {}
end

--- Set defaults for any required, but unset arguments.
---
--- @param self st.zwave.CommandClass.WakeUp.NotificationV1
function NotificationV1._set_defaults(self)
  local defaults = self:_defaults()
  utils.merge(self.args, defaults)
end

--- Set const reflectors to allow enum stringification.
---
--- @param self st.zwave.CommandClass.WakeUp.NotificationV1
function NotificationV1._set_reflectors(self)
end

--- @class st.zwave.CommandClass.WakeUp.IntervalCapabilitiesGetV2Args
--- @alias IntervalCapabilitiesGetV2Args st.zwave.CommandClass.WakeUp.IntervalCapabilitiesGetV2Args
local IntervalCapabilitiesGetV2Args = {}

--- @class st.zwave.CommandClass.WakeUp.IntervalCapabilitiesGetV2:st.zwave.Command
--- @alias IntervalCapabilitiesGetV2 st.zwave.CommandClass.WakeUp.IntervalCapabilitiesGetV2
---
--- v2 and forward-compatible v3 WAKE_UP_INTERVAL_CAPABILITIES_GET
---
--- @field public cmd_class number 0x84
--- @field public cmd_id number 0x09
--- @field public version number 2
--- @field public args st.zwave.CommandClass.WakeUp.IntervalCapabilitiesGetV2Args command-specific arguments
local IntervalCapabilitiesGetV2 = {}
setmetatable(IntervalCapabilitiesGetV2, {
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

--- Initialize a v2 and forward-compatible v3 WAKE_UP_INTERVAL_CAPABILITIES_GET object.
---
--- @param module st.zwave.CommandClass.WakeUp command class module instance
--- @param args st.zwave.CommandClass.WakeUp.IntervalCapabilitiesGetV2Args command-specific arguments
function IntervalCapabilitiesGetV2:init(module, args, ...)
  zw.Command._parse(self, module, zw.WAKE_UP, WakeUp.INTERVAL_CAPABILITIES_GET, 2, args, ...)
end

--- Serialize v2 or forward-compatible v3 WAKE_UP_INTERVAL_CAPABILITIES_GET arguments.
---
--- @return string serialized payload
function IntervalCapabilitiesGetV2:serialize()
  local writer = buf.Writer()
  return writer.buf
end

--- Deserialize a v2 or forward-compatible v3 WAKE_UP_INTERVAL_CAPABILITIES_GET payload.
---
--- @return st.zwave.CommandClass.WakeUp.IntervalCapabilitiesGetV2Args deserialized arguments
function IntervalCapabilitiesGetV2:deserialize()
  local reader = buf.Reader(self.payload)
  return reader.parsed
end

--- Return a deep copy of self.args, merging defaults for unset, but required parameters.
---
--- @param self st.zwave.CommandClass.WakeUp.IntervalCapabilitiesGetV2
--- @return st.zwave.CommandClass.WakeUp.IntervalCapabilitiesGetV2Args
function IntervalCapabilitiesGetV2._defaults(self)
  return {}
end

--- Return a deep copy of self.args, merging defaults for all unset parameters.
---
--- @param self st.zwave.CommandClass.WakeUp.IntervalCapabilitiesGetV2
--- @return st.zwave.CommandClass.WakeUp.IntervalCapabilitiesGetV2Args
function IntervalCapabilitiesGetV2._template(self)
  return {}
end

--- Set defaults for any required, but unset arguments.
---
--- @param self st.zwave.CommandClass.WakeUp.IntervalCapabilitiesGetV2
function IntervalCapabilitiesGetV2._set_defaults(self)
  local defaults = self:_defaults()
  utils.merge(self.args, defaults)
end

--- Set const reflectors to allow enum stringification.
---
--- @param self st.zwave.CommandClass.WakeUp.IntervalCapabilitiesGetV2
function IntervalCapabilitiesGetV2._set_reflectors(self)
end

--- @class st.zwave.CommandClass.WakeUp.IntervalCapabilitiesReportV2Args
--- @alias IntervalCapabilitiesReportV2Args st.zwave.CommandClass.WakeUp.IntervalCapabilitiesReportV2Args
--- @field public minimum_wake_up_interval_seconds integer [0,16777215]
--- @field public maximum_wake_up_interval_seconds integer [0,16777215]
--- @field public default_wake_up_interval_seconds integer [0,16777215]
--- @field public wake_up_interval_step_seconds integer [0,16777215]
local IntervalCapabilitiesReportV2Args = {}

--- @class st.zwave.CommandClass.WakeUp.IntervalCapabilitiesReportV2:st.zwave.Command
--- @alias IntervalCapabilitiesReportV2 st.zwave.CommandClass.WakeUp.IntervalCapabilitiesReportV2
---
--- v2 WAKE_UP_INTERVAL_CAPABILITIES_REPORT
---
--- @field public cmd_class number 0x84
--- @field public cmd_id number 0x0A
--- @field public version number 2
--- @field public args st.zwave.CommandClass.WakeUp.IntervalCapabilitiesReportV2Args command-specific arguments
local IntervalCapabilitiesReportV2 = {}
setmetatable(IntervalCapabilitiesReportV2, {
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

--- Initialize a v2 WAKE_UP_INTERVAL_CAPABILITIES_REPORT object.
---
--- @param module st.zwave.CommandClass.WakeUp command class module instance
--- @param args st.zwave.CommandClass.WakeUp.IntervalCapabilitiesReportV2Args command-specific arguments
function IntervalCapabilitiesReportV2:init(module, args, ...)
  zw.Command._parse(self, module, zw.WAKE_UP, WakeUp.INTERVAL_CAPABILITIES_REPORT, 2, args, ...)
end

--- Serialize v2 WAKE_UP_INTERVAL_CAPABILITIES_REPORT arguments.
---
--- @return string serialized payload
function IntervalCapabilitiesReportV2:serialize()
  local writer = buf.Writer()
  local args = self.args
  writer:write_be_u24(args.minimum_wake_up_interval_seconds)
  writer:write_be_u24(args.maximum_wake_up_interval_seconds)
  writer:write_be_u24(args.default_wake_up_interval_seconds)
  writer:write_be_u24(args.wake_up_interval_step_seconds)
  return writer.buf
end

--- Deserialize a v2 WAKE_UP_INTERVAL_CAPABILITIES_REPORT payload.
---
--- @return st.zwave.CommandClass.WakeUp.IntervalCapabilitiesReportV2Args deserialized arguments
function IntervalCapabilitiesReportV2:deserialize()
  local reader = buf.Reader(self.payload)
  reader:read_be_u24("minimum_wake_up_interval_seconds")
  reader:read_be_u24("maximum_wake_up_interval_seconds")
  reader:read_be_u24("default_wake_up_interval_seconds")
  reader:read_be_u24("wake_up_interval_step_seconds")
  return reader.parsed
end

--- Return a deep copy of self.args, merging defaults for unset, but required parameters.
---
--- @param self st.zwave.CommandClass.WakeUp.IntervalCapabilitiesReportV2
--- @return st.zwave.CommandClass.WakeUp.IntervalCapabilitiesReportV2Args
function IntervalCapabilitiesReportV2._defaults(self)
  local args = {}
  args.minimum_wake_up_interval_seconds = self.args.minimum_wake_up_interval_seconds or 0
  args.maximum_wake_up_interval_seconds = self.args.maximum_wake_up_interval_seconds or 0
  args.default_wake_up_interval_seconds = self.args.default_wake_up_interval_seconds or 0
  args.wake_up_interval_step_seconds = self.args.wake_up_interval_step_seconds or 0
  return args
end

--- Return a deep copy of self.args, merging defaults for all unset parameters.
---
--- @param self st.zwave.CommandClass.WakeUp.IntervalCapabilitiesReportV2
--- @return st.zwave.CommandClass.WakeUp.IntervalCapabilitiesReportV2Args
function IntervalCapabilitiesReportV2._template(self)
  local args = self:_defaults()
  return args
end

--- Set defaults for any required, but unset arguments.
---
--- @param self st.zwave.CommandClass.WakeUp.IntervalCapabilitiesReportV2
function IntervalCapabilitiesReportV2._set_defaults(self)
  local defaults = self:_defaults()
  utils.merge(self.args, defaults)
end

--- Set const reflectors to allow enum stringification.
---
--- @param self st.zwave.CommandClass.WakeUp.IntervalCapabilitiesReportV2
function IntervalCapabilitiesReportV2._set_reflectors(self)
end

--- @class st.zwave.CommandClass.WakeUp.IntervalCapabilitiesReportV3Args
--- @alias IntervalCapabilitiesReportV3Args st.zwave.CommandClass.WakeUp.IntervalCapabilitiesReportV3Args
--- @field public minimum_wake_up_interval_seconds integer [0,16777215]
--- @field public maximum_wake_up_interval_seconds integer [0,16777215]
--- @field public default_wake_up_interval_seconds integer [0,16777215]
--- @field public wake_up_interval_step_seconds integer [0,16777215]
--- @field public wake_up_on_demand boolean
local IntervalCapabilitiesReportV3Args = {}

--- @class st.zwave.CommandClass.WakeUp.IntervalCapabilitiesReportV3:st.zwave.Command
--- @alias IntervalCapabilitiesReportV3 st.zwave.CommandClass.WakeUp.IntervalCapabilitiesReportV3
---
--- v3 WAKE_UP_INTERVAL_CAPABILITIES_REPORT
---
--- @field public cmd_class number 0x84
--- @field public cmd_id number 0x0A
--- @field public version number 3
--- @field public args st.zwave.CommandClass.WakeUp.IntervalCapabilitiesReportV3Args command-specific arguments
local IntervalCapabilitiesReportV3 = {}
setmetatable(IntervalCapabilitiesReportV3, {
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

--- Initialize a v3 WAKE_UP_INTERVAL_CAPABILITIES_REPORT object.
---
--- @param module st.zwave.CommandClass.WakeUp command class module instance
--- @param args st.zwave.CommandClass.WakeUp.IntervalCapabilitiesReportV3Args command-specific arguments
function IntervalCapabilitiesReportV3:init(module, args, ...)
  zw.Command._parse(self, module, zw.WAKE_UP, WakeUp.INTERVAL_CAPABILITIES_REPORT, 3, args, ...)
end

--- Serialize v3 WAKE_UP_INTERVAL_CAPABILITIES_REPORT arguments.
---
--- @return string serialized payload
function IntervalCapabilitiesReportV3:serialize()
  local writer = buf.Writer()
  local args = self.args
  writer:write_be_u24(args.minimum_wake_up_interval_seconds)
  writer:write_be_u24(args.maximum_wake_up_interval_seconds)
  writer:write_be_u24(args.default_wake_up_interval_seconds)
  writer:write_be_u24(args.wake_up_interval_step_seconds)
  writer:write_bool(args.wake_up_on_demand)
  writer:write_bits(7, 0) -- reserved
  return writer.buf
end

--- Deserialize a v3 WAKE_UP_INTERVAL_CAPABILITIES_REPORT payload.
---
--- @return st.zwave.CommandClass.WakeUp.IntervalCapabilitiesReportV3Args deserialized arguments
function IntervalCapabilitiesReportV3:deserialize()
  local reader = buf.Reader(self.payload)
  reader:read_be_u24("minimum_wake_up_interval_seconds")
  reader:read_be_u24("maximum_wake_up_interval_seconds")
  reader:read_be_u24("default_wake_up_interval_seconds")
  reader:read_be_u24("wake_up_interval_step_seconds")
  reader:read_bool("wake_up_on_demand")
  reader:read_bits(7) -- reserved
  return reader.parsed
end

--- Return a deep copy of self.args, merging defaults for unset, but required parameters.
---
--- @param self st.zwave.CommandClass.WakeUp.IntervalCapabilitiesReportV3
--- @return st.zwave.CommandClass.WakeUp.IntervalCapabilitiesReportV3Args
function IntervalCapabilitiesReportV3._defaults(self)
  local args = {}
  args.minimum_wake_up_interval_seconds = self.args.minimum_wake_up_interval_seconds or 0
  args.maximum_wake_up_interval_seconds = self.args.maximum_wake_up_interval_seconds or 0
  args.default_wake_up_interval_seconds = self.args.default_wake_up_interval_seconds or 0
  args.wake_up_interval_step_seconds = self.args.wake_up_interval_step_seconds or 0
  args.wake_up_on_demand = self.args.wake_up_on_demand or false
  return args
end

--- Return a deep copy of self.args, merging defaults for all unset parameters.
---
--- @param self st.zwave.CommandClass.WakeUp.IntervalCapabilitiesReportV3
--- @return st.zwave.CommandClass.WakeUp.IntervalCapabilitiesReportV3Args
function IntervalCapabilitiesReportV3._template(self)
  local args = self:_defaults()
  return args
end

--- Set defaults for any required, but unset arguments.
---
--- @param self st.zwave.CommandClass.WakeUp.IntervalCapabilitiesReportV3
function IntervalCapabilitiesReportV3._set_defaults(self)
  local defaults = self:_defaults()
  utils.merge(self.args, defaults)
end

--- Set const reflectors to allow enum stringification.
---
--- @param self st.zwave.CommandClass.WakeUp.IntervalCapabilitiesReportV3
function IntervalCapabilitiesReportV3._set_reflectors(self)
end

--- @class st.zwave.CommandClass.WakeUp.IntervalSet
--- @alias _IntervalSet st.zwave.CommandClass.WakeUp.IntervalSet
---
--- Dynamically versioned WAKE_UP_INTERVAL_SET
---
--- Supported versions: 1,2,3; unique base versions: 1
---
--- @field public cmd_class number 0x84
--- @field public cmd_id number 0x04
--- @field public version number 1
--- @field public args st.zwave.CommandClass.WakeUp.IntervalSetV1Args
local _IntervalSet = {}
setmetatable(_IntervalSet, {
  __call = function(cls, self, ...)
    return cls:construct(self, ...)
  end,
})

--- Construct a WAKE_UP_INTERVAL_SET object at the module instance serialization version.
---
--- @param module st.zwave.CommandClass.WakeUp command class module instance
--- @param args st.zwave.CommandClass.WakeUp.IntervalSetV1Args command-specific arguments
--- @return st.zwave.CommandClass.WakeUp.IntervalSet
function _IntervalSet:construct(module, args, ...)
  return zw.Command._construct(module, WakeUp.INTERVAL_SET, module._serialization_version, args, ...)
end

--- @class st.zwave.CommandClass.WakeUp.IntervalGet
--- @alias _IntervalGet st.zwave.CommandClass.WakeUp.IntervalGet
---
--- Dynamically versioned WAKE_UP_INTERVAL_GET
---
--- Supported versions: 1,2,3; unique base versions: 1
---
--- @field public cmd_class number 0x84
--- @field public cmd_id number 0x05
--- @field public version number 1
--- @field public args st.zwave.CommandClass.WakeUp.IntervalGetV1Args
local _IntervalGet = {}
setmetatable(_IntervalGet, {
  __call = function(cls, self, ...)
    return cls:construct(self, ...)
  end,
})

--- Construct a WAKE_UP_INTERVAL_GET object at the module instance serialization version.
---
--- @param module st.zwave.CommandClass.WakeUp command class module instance
--- @param args st.zwave.CommandClass.WakeUp.IntervalGetV1Args command-specific arguments
--- @return st.zwave.CommandClass.WakeUp.IntervalGet
function _IntervalGet:construct(module, args, ...)
  return zw.Command._construct(module, WakeUp.INTERVAL_GET, module._serialization_version, args, ...)
end

--- @class st.zwave.CommandClass.WakeUp.IntervalReport
--- @alias _IntervalReport st.zwave.CommandClass.WakeUp.IntervalReport
---
--- Dynamically versioned WAKE_UP_INTERVAL_REPORT
---
--- Supported versions: 1,2,3; unique base versions: 1
---
--- @field public cmd_class number 0x84
--- @field public cmd_id number 0x06
--- @field public version number 1
--- @field public args st.zwave.CommandClass.WakeUp.IntervalReportV1Args
local _IntervalReport = {}
setmetatable(_IntervalReport, {
  __call = function(cls, self, ...)
    return cls:construct(self, ...)
  end,
})

--- Construct a WAKE_UP_INTERVAL_REPORT object at the module instance serialization version.
---
--- @param module st.zwave.CommandClass.WakeUp command class module instance
--- @param args st.zwave.CommandClass.WakeUp.IntervalReportV1Args command-specific arguments
--- @return st.zwave.CommandClass.WakeUp.IntervalReport
function _IntervalReport:construct(module, args, ...)
  return zw.Command._construct(module, WakeUp.INTERVAL_REPORT, module._serialization_version, args, ...)
end

--- @class st.zwave.CommandClass.WakeUp.Notification
--- @alias _Notification st.zwave.CommandClass.WakeUp.Notification
---
--- Dynamically versioned WAKE_UP_NOTIFICATION
---
--- Supported versions: 1,2,3; unique base versions: 1
---
--- @field public cmd_class number 0x84
--- @field public cmd_id number 0x07
--- @field public version number 1
--- @field public args st.zwave.CommandClass.WakeUp.NotificationV1Args
local _Notification = {}
setmetatable(_Notification, {
  __call = function(cls, self, ...)
    return cls:construct(self, ...)
  end,
})

--- Construct a WAKE_UP_NOTIFICATION object at the module instance serialization version.
---
--- @param module st.zwave.CommandClass.WakeUp command class module instance
--- @param args st.zwave.CommandClass.WakeUp.NotificationV1Args command-specific arguments
--- @return st.zwave.CommandClass.WakeUp.Notification
function _Notification:construct(module, args, ...)
  return zw.Command._construct(module, WakeUp.NOTIFICATION, module._serialization_version, args, ...)
end

--- @class st.zwave.CommandClass.WakeUp.IntervalCapabilitiesGet
--- @alias _IntervalCapabilitiesGet st.zwave.CommandClass.WakeUp.IntervalCapabilitiesGet
---
--- Dynamically versioned WAKE_UP_INTERVAL_CAPABILITIES_GET
---
--- Supported versions: 2,3; unique base versions: 2
---
--- @field public cmd_class number 0x84
--- @field public cmd_id number 0x09
--- @field public version number 2
--- @field public args st.zwave.CommandClass.WakeUp.IntervalCapabilitiesGetV2Args
local _IntervalCapabilitiesGet = {}
setmetatable(_IntervalCapabilitiesGet, {
  __call = function(cls, self, ...)
    return cls:construct(self, ...)
  end,
})

--- Construct a WAKE_UP_INTERVAL_CAPABILITIES_GET object at the module instance serialization version.
---
--- @param module st.zwave.CommandClass.WakeUp command class module instance
--- @param args st.zwave.CommandClass.WakeUp.IntervalCapabilitiesGetV2Args command-specific arguments
--- @return st.zwave.CommandClass.WakeUp.IntervalCapabilitiesGet
function _IntervalCapabilitiesGet:construct(module, args, ...)
  return zw.Command._construct(module, WakeUp.INTERVAL_CAPABILITIES_GET, module._serialization_version, args, ...)
end

--- @class st.zwave.CommandClass.WakeUp.IntervalCapabilitiesReport
--- @alias _IntervalCapabilitiesReport st.zwave.CommandClass.WakeUp.IntervalCapabilitiesReport
---
--- Dynamically versioned WAKE_UP_INTERVAL_CAPABILITIES_REPORT
---
--- Supported versions: 2,3; unique base versions: 2,3
---
--- @field public cmd_class number 0x84
--- @field public cmd_id number 0x0A
--- @field public version number 2,3
--- @field public args st.zwave.CommandClass.WakeUp.IntervalCapabilitiesReportV2Args|st.zwave.CommandClass.WakeUp.IntervalCapabilitiesReportV3Args
local _IntervalCapabilitiesReport = {}
setmetatable(_IntervalCapabilitiesReport, {
  __call = function(cls, self, ...)
    return cls:construct(self, ...)
  end,
})

--- Construct a WAKE_UP_INTERVAL_CAPABILITIES_REPORT object at the module instance serialization version.
---
--- @param module st.zwave.CommandClass.WakeUp command class module instance
--- @param args st.zwave.CommandClass.WakeUp.IntervalCapabilitiesReportV2Args|st.zwave.CommandClass.WakeUp.IntervalCapabilitiesReportV3Args command-specific arguments
--- @return st.zwave.CommandClass.WakeUp.IntervalCapabilitiesReport
function _IntervalCapabilitiesReport:construct(module, args, ...)
  return zw.Command._construct(module, WakeUp.INTERVAL_CAPABILITIES_REPORT, module._serialization_version, args, ...)
end

WakeUp.IntervalSetV1 = IntervalSetV1
WakeUp.IntervalGetV1 = IntervalGetV1
WakeUp.IntervalReportV1 = IntervalReportV1
WakeUp.NotificationV1 = NotificationV1
WakeUp.IntervalCapabilitiesGetV2 = IntervalCapabilitiesGetV2
WakeUp.IntervalCapabilitiesReportV2 = IntervalCapabilitiesReportV2
WakeUp.IntervalCapabilitiesReportV3 = IntervalCapabilitiesReportV3
WakeUp.IntervalSet = _IntervalSet
WakeUp.IntervalGet = _IntervalGet
WakeUp.IntervalReport = _IntervalReport
WakeUp.Notification = _Notification
WakeUp.IntervalCapabilitiesGet = _IntervalCapabilitiesGet
WakeUp.IntervalCapabilitiesReport = _IntervalCapabilitiesReport

WakeUp._lut = {
  [0] = { -- dynamically versioned constructors
    [WakeUp.INTERVAL_SET] = WakeUp.IntervalSet,
    [WakeUp.INTERVAL_GET] = WakeUp.IntervalGet,
    [WakeUp.INTERVAL_REPORT] = WakeUp.IntervalReport,
    [WakeUp.NOTIFICATION] = WakeUp.Notification,
    [WakeUp.INTERVAL_CAPABILITIES_GET] = WakeUp.IntervalCapabilitiesGet,
    [WakeUp.INTERVAL_CAPABILITIES_REPORT] = WakeUp.IntervalCapabilitiesReport
  },
  [1] = { -- version 1
    [WakeUp.INTERVAL_SET] = WakeUp.IntervalSetV1,
    [WakeUp.INTERVAL_GET] = WakeUp.IntervalGetV1,
    [WakeUp.INTERVAL_REPORT] = WakeUp.IntervalReportV1,
    [WakeUp.NOTIFICATION] = WakeUp.NotificationV1
  },
  [2] = { -- version 2
    [WakeUp.INTERVAL_SET] = WakeUp.IntervalSetV1,
    [WakeUp.INTERVAL_GET] = WakeUp.IntervalGetV1,
    [WakeUp.INTERVAL_REPORT] = WakeUp.IntervalReportV1,
    [WakeUp.NOTIFICATION] = WakeUp.NotificationV1,
    [WakeUp.INTERVAL_CAPABILITIES_GET] = WakeUp.IntervalCapabilitiesGetV2,
    [WakeUp.INTERVAL_CAPABILITIES_REPORT] = WakeUp.IntervalCapabilitiesReportV2
  },
  [3] = { -- version 3
    [WakeUp.INTERVAL_SET] = WakeUp.IntervalSetV1,
    [WakeUp.INTERVAL_GET] = WakeUp.IntervalGetV1,
    [WakeUp.INTERVAL_REPORT] = WakeUp.IntervalReportV1,
    [WakeUp.NOTIFICATION] = WakeUp.NotificationV1,
    [WakeUp.INTERVAL_CAPABILITIES_GET] = WakeUp.IntervalCapabilitiesGetV2,
    [WakeUp.INTERVAL_CAPABILITIES_REPORT] = WakeUp.IntervalCapabilitiesReportV3
  }
}

return WakeUp
