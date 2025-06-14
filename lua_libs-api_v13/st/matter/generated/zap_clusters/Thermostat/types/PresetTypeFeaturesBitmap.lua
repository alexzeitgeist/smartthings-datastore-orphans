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

--- @class st.matter.clusters.Thermostat.types.PresetTypeFeaturesBitmap
--- @alias PresetTypeFeaturesBitmap
---
--- @field public AUTOMATIC number 1
--- @field public SUPPORTS_NAMES number 2

local PresetTypeFeaturesBitmap = {}
local new_mt = UintABC.new_mt({NAME = "PresetTypeFeaturesBitmap", ID = data_types.name_to_id_map["Uint16"]}, 2)

PresetTypeFeaturesBitmap.BASE_MASK = 0xFFFF
PresetTypeFeaturesBitmap.AUTOMATIC = 0x0001
PresetTypeFeaturesBitmap.SUPPORTS_NAMES = 0x0002

PresetTypeFeaturesBitmap.mask_fields = {
  BASE_MASK = 0xFFFF,
  AUTOMATIC = 0x0001,
  SUPPORTS_NAMES = 0x0002,
}

--- @function PresetTypeFeaturesBitmap:is_automatic_set
--- @return boolean True if the value of AUTOMATIC is non-zero
PresetTypeFeaturesBitmap.is_automatic_set = function(self)
  return (self.value & self.AUTOMATIC) ~= 0
end

--- @function PresetTypeFeaturesBitmap:set_automatic
--- Set the value of the bit in the AUTOMATIC field to 1
PresetTypeFeaturesBitmap.set_automatic = function(self)
  if self.value ~= nil then
    self.value = self.value | self.AUTOMATIC
  else
    self.value = self.AUTOMATIC
  end
end

--- @function PresetTypeFeaturesBitmap:unset_automatic
--- Set the value of the bits in the AUTOMATIC field to 0
PresetTypeFeaturesBitmap.unset_automatic = function(self)
  self.value = self.value & (~self.AUTOMATIC & self.BASE_MASK)
end
--- @function PresetTypeFeaturesBitmap:is_supports_names_set
--- @return boolean True if the value of SUPPORTS_NAMES is non-zero
PresetTypeFeaturesBitmap.is_supports_names_set = function(self)
  return (self.value & self.SUPPORTS_NAMES) ~= 0
end

--- @function PresetTypeFeaturesBitmap:set_supports_names
--- Set the value of the bit in the SUPPORTS_NAMES field to 1
PresetTypeFeaturesBitmap.set_supports_names = function(self)
  if self.value ~= nil then
    self.value = self.value | self.SUPPORTS_NAMES
  else
    self.value = self.SUPPORTS_NAMES
  end
end

--- @function PresetTypeFeaturesBitmap:unset_supports_names
--- Set the value of the bits in the SUPPORTS_NAMES field to 0
PresetTypeFeaturesBitmap.unset_supports_names = function(self)
  self.value = self.value & (~self.SUPPORTS_NAMES & self.BASE_MASK)
end


PresetTypeFeaturesBitmap.mask_methods = {
  is_automatic_set = PresetTypeFeaturesBitmap.is_automatic_set,
  set_automatic = PresetTypeFeaturesBitmap.set_automatic,
  unset_automatic = PresetTypeFeaturesBitmap.unset_automatic,
  is_supports_names_set = PresetTypeFeaturesBitmap.is_supports_names_set,
  set_supports_names = PresetTypeFeaturesBitmap.set_supports_names,
  unset_supports_names = PresetTypeFeaturesBitmap.unset_supports_names,
}

PresetTypeFeaturesBitmap.augment_type = function(cls, val)
  setmetatable(val, new_mt)
end

setmetatable(PresetTypeFeaturesBitmap, new_mt)

local has_aliases, aliases = pcall(require, "st.matter.clusters.aliases.Thermostat.types.PresetTypeFeaturesBitmap")
if has_aliases then
  aliases:add_to_class(PresetTypeFeaturesBitmap)
end

return PresetTypeFeaturesBitmap

