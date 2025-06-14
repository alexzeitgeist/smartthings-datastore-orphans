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

--- @class st.matter.clusters.Thermostat.types.ACLouverPositionEnum: st.matter.data_types.Uint8
--- @alias ACLouverPositionEnum
---
--- @field public byte_length number 1
--- @field public CLOSED number 1
--- @field public OPEN number 2
--- @field public QUARTER number 3
--- @field public HALF number 4
--- @field public THREE_QUARTERS number 5

local ACLouverPositionEnum = {}
local new_mt = UintABC.new_mt({NAME = "ACLouverPositionEnum", ID = data_types.name_to_id_map["Uint8"]}, 1)
new_mt.__index.pretty_print = function(self)
  local name_lookup = {
    [self.CLOSED] = "CLOSED",
    [self.OPEN] = "OPEN",
    [self.QUARTER] = "QUARTER",
    [self.HALF] = "HALF",
    [self.THREE_QUARTERS] = "THREE_QUARTERS",
  }
  return string.format("%s: %s", self.field_name or self.NAME, name_lookup[self.value] or string.format("%d", self.value))
end
new_mt.__tostring = new_mt.__index.pretty_print

new_mt.__index.CLOSED  = 0x01
new_mt.__index.OPEN  = 0x02
new_mt.__index.QUARTER  = 0x03
new_mt.__index.HALF  = 0x04
new_mt.__index.THREE_QUARTERS  = 0x05

ACLouverPositionEnum.CLOSED  = 0x01
ACLouverPositionEnum.OPEN  = 0x02
ACLouverPositionEnum.QUARTER  = 0x03
ACLouverPositionEnum.HALF  = 0x04
ACLouverPositionEnum.THREE_QUARTERS  = 0x05

ACLouverPositionEnum.augment_type = function(cls, val)
  setmetatable(val, new_mt)
end

setmetatable(ACLouverPositionEnum, new_mt)

local has_aliases, aliases = pcall(require, "st.matter.clusters.aliases.Thermostat.types.ACLouverPositionEnum")
if has_aliases then
  aliases:add_to_class(ACLouverPositionEnum)
end

return ACLouverPositionEnum

