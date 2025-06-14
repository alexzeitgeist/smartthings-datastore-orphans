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

--- @class st.zigbee.zcl.clusters.TouchlinkCommissioning.types.TlKeyIndex: st.zigbee.data_types.Uint8
--- @alias TlKeyIndex
---
--- @field public byte_length number 1
--- @field public DEVELOPMENT_KEY number 0
--- @field public MASTER_KEY number 4
--- @field public CERTIFICATION_KEY number 15
local TlKeyIndex = {}
local new_mt = UintABC.new_mt({NAME = "TlKeyIndex", ID = data_types.name_to_id_map["Uint8"]}, 1)
new_mt.__index.pretty_print = function(self)
  local name_lookup = {
    [self.DEVELOPMENT_KEY]   = "DEVELOPMENT_KEY",
    [self.MASTER_KEY]        = "MASTER_KEY",
    [self.CERTIFICATION_KEY] = "CERTIFICATION_KEY",
  }
  return string.format("%s: %s", self.NAME or self.field_name, name_lookup[self.value] or string.format("%d", self.value))
end
new_mt.__tostring = new_mt.__index.pretty_print
new_mt.__index.DEVELOPMENT_KEY   = 0x00
new_mt.__index.MASTER_KEY        = 0x04
new_mt.__index.CERTIFICATION_KEY = 0x0F

setmetatable(TlKeyIndex, new_mt)

return TlKeyIndex
