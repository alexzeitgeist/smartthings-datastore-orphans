local data_types = require "st.zigbee.data_types"
local EnumABC = require "st.zigbee.data_types.base_defs.EnumABC"

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

-- DO NOT EDIT: this code is automatically generated by tools/zigbee_lib_generator/generate_clusters_from_xml.py
-- ZCL XML version: 7.2

--- @class st.zigbee.zcl.clusters.IASWD.types.IaswdLevel: st.zigbee.data_types.Enum8
--- @alias IaswdLevel
---
--- @field public byte_length number 1
--- @field public LOW_LEVEL number 0
--- @field public MEDIUM_LEVEL number 1
--- @field public HIGH_LEVEL number 2
--- @field public VERY_HIGH_LEVEL number 3
local IaswdLevel = {}
local new_mt = EnumABC.new_mt({NAME = "IaswdLevel", ID = data_types.name_to_id_map["Enum8"]}, 1)
new_mt.__index.pretty_print = function(self)
  local name_lookup = {
    [self.LOW_LEVEL]       = "LOW_LEVEL",
    [self.MEDIUM_LEVEL]    = "MEDIUM_LEVEL",
    [self.HIGH_LEVEL]      = "HIGH_LEVEL",
    [self.VERY_HIGH_LEVEL] = "VERY_HIGH_LEVEL",
  }
  return string.format("%s: %s", self.NAME or self.field_name, name_lookup[self.value] or string.format("%d", self.value))
end
new_mt.__tostring = new_mt.__index.pretty_print
new_mt.__index.LOW_LEVEL       = 0x00
new_mt.__index.MEDIUM_LEVEL    = 0x01
new_mt.__index.HIGH_LEVEL      = 0x02
new_mt.__index.VERY_HIGH_LEVEL = 0x03

setmetatable(IaswdLevel, new_mt)

return IaswdLevel
