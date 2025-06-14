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

--- @class st.matter.clusters.PressureMeasurement.types.Feature
--- @alias Feature
---
--- @field public EXTENDED number 1

local Feature = {}
local new_mt = UintABC.new_mt({NAME = "Feature", ID = data_types.name_to_id_map["Uint32"]}, 4)

Feature.BASE_MASK = 0xFFFF
Feature.EXTENDED = 0x0001

Feature.mask_fields = {
  BASE_MASK = 0xFFFF,
  EXTENDED = 0x0001,
}

--- @function Feature:is_extended_set
--- @return boolean True if the value of EXTENDED is non-zero
Feature.is_extended_set = function(self)
  return (self.value & self.EXTENDED) ~= 0
end

--- @function Feature:set_extended
--- Set the value of the bit in the EXTENDED field to 1
Feature.set_extended = function(self)
  if self.value ~= nil then
    self.value = self.value | self.EXTENDED
  else
    self.value = self.EXTENDED
  end
end

--- @function Feature:unset_extended
--- Set the value of the bits in the EXTENDED field to 0
Feature.unset_extended = function(self)
  self.value = self.value & (~self.EXTENDED & self.BASE_MASK)
end

function Feature.bits_are_valid(feature)
  local max =
    Feature.EXTENDED
  if (feature <= max) and (feature >= 1) then
    return true
  else
    return false
  end
end

Feature.mask_methods = {
  is_extended_set = Feature.is_extended_set,
  set_extended = Feature.set_extended,
  unset_extended = Feature.unset_extended,
}

Feature.augment_type = function(cls, val)
  setmetatable(val, new_mt)
end

setmetatable(Feature, new_mt)

local has_aliases, aliases = pcall(require, "st.matter.clusters.aliases.PressureMeasurement.types.Feature")
if has_aliases then
  aliases:add_to_class(Feature)
end

return Feature

