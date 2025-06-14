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

--- @class st.matter.clusters.EnergyEvse.types.StateEnum: st.matter.data_types.Uint8
--- @alias StateEnum
---
--- @field public byte_length number 1
--- @field public NOT_PLUGGED_IN number 0
--- @field public PLUGGED_IN_NO_DEMAND number 1
--- @field public PLUGGED_IN_DEMAND number 2
--- @field public PLUGGED_IN_CHARGING number 3
--- @field public PLUGGED_IN_DISCHARGING number 4
--- @field public SESSION_ENDING number 5
--- @field public FAULT number 6

local StateEnum = {}
local new_mt = UintABC.new_mt({NAME = "StateEnum", ID = data_types.name_to_id_map["Uint8"]}, 1)
new_mt.__index.pretty_print = function(self)
  local name_lookup = {
    [self.NOT_PLUGGED_IN] = "NOT_PLUGGED_IN",
    [self.PLUGGED_IN_NO_DEMAND] = "PLUGGED_IN_NO_DEMAND",
    [self.PLUGGED_IN_DEMAND] = "PLUGGED_IN_DEMAND",
    [self.PLUGGED_IN_CHARGING] = "PLUGGED_IN_CHARGING",
    [self.PLUGGED_IN_DISCHARGING] = "PLUGGED_IN_DISCHARGING",
    [self.SESSION_ENDING] = "SESSION_ENDING",
    [self.FAULT] = "FAULT",
  }
  return string.format("%s: %s", self.field_name or self.NAME, name_lookup[self.value] or string.format("%d", self.value))
end
new_mt.__tostring = new_mt.__index.pretty_print

new_mt.__index.NOT_PLUGGED_IN  = 0x00
new_mt.__index.PLUGGED_IN_NO_DEMAND  = 0x01
new_mt.__index.PLUGGED_IN_DEMAND  = 0x02
new_mt.__index.PLUGGED_IN_CHARGING  = 0x03
new_mt.__index.PLUGGED_IN_DISCHARGING  = 0x04
new_mt.__index.SESSION_ENDING  = 0x05
new_mt.__index.FAULT  = 0x06

StateEnum.NOT_PLUGGED_IN  = 0x00
StateEnum.PLUGGED_IN_NO_DEMAND  = 0x01
StateEnum.PLUGGED_IN_DEMAND  = 0x02
StateEnum.PLUGGED_IN_CHARGING  = 0x03
StateEnum.PLUGGED_IN_DISCHARGING  = 0x04
StateEnum.SESSION_ENDING  = 0x05
StateEnum.FAULT  = 0x06

StateEnum.augment_type = function(cls, val)
  setmetatable(val, new_mt)
end

setmetatable(StateEnum, new_mt)

local has_aliases, aliases = pcall(require, "st.matter.clusters.aliases.EnergyEvse.types.StateEnum")
if has_aliases then
  aliases:add_to_class(StateEnum)
end

return StateEnum

