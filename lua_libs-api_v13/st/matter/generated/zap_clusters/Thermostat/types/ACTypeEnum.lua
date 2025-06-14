-- Copyright 2022 SmartThings
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
-- http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.

-- DO NOT EDIT: this code is automatically generated by ZCL Advanced Platform generator.

local data_types = require "st.matter.data_types"
local UintABC = require "st.matter.data_types.base_defs.UintABC"

--- @class st.matter.clusters.Thermostat.types.ACTypeEnum: st.matter.data_types.Uint8
--- @alias ACTypeEnum
---
--- @field public byte_length number 1
--- @field public UNKNOWN number 0
--- @field public COOLING_FIXED number 1
--- @field public HEAT_PUMP_FIXED number 2
--- @field public COOLING_INVERTER number 3
--- @field public HEAT_PUMP_INVERTER number 4

local ACTypeEnum = {}
local new_mt = UintABC.new_mt({NAME = "ACTypeEnum", ID = data_types.name_to_id_map["Uint8"]}, 1)
new_mt.__index.pretty_print = function(self)
  local name_lookup = {
    [self.UNKNOWN] = "UNKNOWN",
    [self.COOLING_FIXED] = "COOLING_FIXED",
    [self.HEAT_PUMP_FIXED] = "HEAT_PUMP_FIXED",
    [self.COOLING_INVERTER] = "COOLING_INVERTER",
    [self.HEAT_PUMP_INVERTER] = "HEAT_PUMP_INVERTER",
  }
  return string.format("%s: %s", self.field_name or self.NAME, name_lookup[self.value] or string.format("%d", self.value))
end
new_mt.__tostring = new_mt.__index.pretty_print

new_mt.__index.UNKNOWN  = 0x00
new_mt.__index.COOLING_FIXED  = 0x01
new_mt.__index.HEAT_PUMP_FIXED  = 0x02
new_mt.__index.COOLING_INVERTER  = 0x03
new_mt.__index.HEAT_PUMP_INVERTER  = 0x04

ACTypeEnum.UNKNOWN  = 0x00
ACTypeEnum.COOLING_FIXED  = 0x01
ACTypeEnum.HEAT_PUMP_FIXED  = 0x02
ACTypeEnum.COOLING_INVERTER  = 0x03
ACTypeEnum.HEAT_PUMP_INVERTER  = 0x04

ACTypeEnum.augment_type = function(cls, val)
  setmetatable(val, new_mt)
end

setmetatable(ACTypeEnum, new_mt)

local has_aliases, aliases = pcall(require, "st.matter.clusters.aliases.Thermostat.types.ACTypeEnum")
if has_aliases then
  aliases:add_to_class(ACTypeEnum)
end

return ACTypeEnum

