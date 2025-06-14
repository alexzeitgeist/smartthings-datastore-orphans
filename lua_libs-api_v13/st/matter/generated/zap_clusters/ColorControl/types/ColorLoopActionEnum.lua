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

--- @class st.matter.clusters.ColorControl.types.ColorLoopActionEnum: st.matter.data_types.Uint8
--- @alias ColorLoopActionEnum
---
--- @field public byte_length number 1
--- @field public DEACTIVATE number 0
--- @field public ACTIVATE_FROM_COLOR_LOOP_START_ENHANCED_HUE number 1
--- @field public ACTIVATE_FROM_ENHANCED_CURRENT_HUE number 2

local ColorLoopActionEnum = {}
local new_mt = UintABC.new_mt({NAME = "ColorLoopActionEnum", ID = data_types.name_to_id_map["Uint8"]}, 1)
new_mt.__index.pretty_print = function(self)
  local name_lookup = {
    [self.DEACTIVATE] = "DEACTIVATE",
    [self.ACTIVATE_FROM_COLOR_LOOP_START_ENHANCED_HUE] = "ACTIVATE_FROM_COLOR_LOOP_START_ENHANCED_HUE",
    [self.ACTIVATE_FROM_ENHANCED_CURRENT_HUE] = "ACTIVATE_FROM_ENHANCED_CURRENT_HUE",
  }
  return string.format("%s: %s", self.field_name or self.NAME, name_lookup[self.value] or string.format("%d", self.value))
end
new_mt.__tostring = new_mt.__index.pretty_print

new_mt.__index.DEACTIVATE  = 0x00
new_mt.__index.ACTIVATE_FROM_COLOR_LOOP_START_ENHANCED_HUE  = 0x01
new_mt.__index.ACTIVATE_FROM_ENHANCED_CURRENT_HUE  = 0x02

ColorLoopActionEnum.DEACTIVATE  = 0x00
ColorLoopActionEnum.ACTIVATE_FROM_COLOR_LOOP_START_ENHANCED_HUE  = 0x01
ColorLoopActionEnum.ACTIVATE_FROM_ENHANCED_CURRENT_HUE  = 0x02

ColorLoopActionEnum.augment_type = function(cls, val)
  setmetatable(val, new_mt)
end

setmetatable(ColorLoopActionEnum, new_mt)

local has_aliases, aliases = pcall(require, "st.matter.clusters.aliases.ColorControl.types.ColorLoopActionEnum")
if has_aliases then
  aliases:add_to_class(ColorLoopActionEnum)
end

return ColorLoopActionEnum

