local data_types = require "st.zigbee.data_types"
local UintABC = require "st.zigbee.data_types.base_defs.UintABC"

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

--- @class st.zigbee.zcl.clusters.DoorLock.types.DrlkPassFailStatus: st.zigbee.data_types.Uint8
--- @alias DrlkPassFailStatus
---
--- @field public byte_length number 1
--- @field public PASS number 0
--- @field public FAIL number 1
local DrlkPassFailStatus = {}
local new_mt = UintABC.new_mt({NAME = "DrlkPassFailStatus", ID = data_types.name_to_id_map["Uint8"]}, 1)
new_mt.__index.pretty_print = function(self)
  local name_lookup = {
    [self.PASS] = "PASS",
    [self.FAIL] = "FAIL",
  }
  return string.format("%s: %s", self.NAME or self.field_name, name_lookup[self.value] or string.format("%d", self.value))
end
new_mt.__tostring = new_mt.__index.pretty_print
new_mt.__index.PASS = 0x00
new_mt.__index.FAIL = 0x01

setmetatable(DrlkPassFailStatus, new_mt)

return DrlkPassFailStatus
