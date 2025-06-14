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

--- @class st.matter.clusters.DishwasherAlarm.types.Feature
--- @alias Feature
---
--- @field public RESET number 1

local Feature = {}
local new_mt = UintABC.new_mt({NAME = "Feature", ID = data_types.name_to_id_map["Uint32"]}, 4)

Feature.BASE_MASK = 0xFFFF
Feature.RESET = 0x0001

Feature.mask_fields = {
  BASE_MASK = 0xFFFF,
  RESET = 0x0001,
}

--- @function Feature:is_reset_set
--- @return boolean True if the value of RESET is non-zero
Feature.is_reset_set = function(self)
  return (self.value & self.RESET) ~= 0
end

--- @function Feature:set_reset
--- Set the value of the bit in the RESET field to 1
Feature.set_reset = function(self)
  if self.value ~= nil then
    self.value = self.value | self.RESET
  else
    self.value = self.RESET
  end
end

--- @function Feature:unset_reset
--- Set the value of the bits in the RESET field to 0
Feature.unset_reset = function(self)
  self.value = self.value & (~self.RESET & self.BASE_MASK)
end

function Feature.bits_are_valid(feature)
  local max =
    Feature.RESET
  if (feature <= max) and (feature >= 1) then
    return true
  else
    return false
  end
end

Feature.mask_methods = {
  is_reset_set = Feature.is_reset_set,
  set_reset = Feature.set_reset,
  unset_reset = Feature.unset_reset,
}

Feature.augment_type = function(cls, val)
  setmetatable(val, new_mt)
end

setmetatable(Feature, new_mt)

local has_aliases, aliases = pcall(require, "st.matter.clusters.aliases.DishwasherAlarm.types.Feature")
if has_aliases then
  aliases:add_to_class(Feature)
end

return Feature

