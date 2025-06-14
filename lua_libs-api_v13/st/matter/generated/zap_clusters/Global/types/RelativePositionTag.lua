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

--- @class st.matter.clusters.Global.types.RelativePositionTag: st.matter.data_types.Uint8
--- @alias RelativePositionTag
---
--- @field public byte_length number 1
--- @field public UNDER number 0
--- @field public NEXT_TO number 1
--- @field public AROUND number 2
--- @field public ON number 3
--- @field public ABOVE number 4
--- @field public FRONT_OF number 5
--- @field public BEHIND number 6

local RelativePositionTag = {}
local new_mt = UintABC.new_mt({NAME = "RelativePositionTag", ID = data_types.name_to_id_map["Uint8"]}, 1)
new_mt.__index.pretty_print = function(self)
  local name_lookup = {
    [self.UNDER] = "UNDER",
    [self.NEXT_TO] = "NEXT_TO",
    [self.AROUND] = "AROUND",
    [self.ON] = "ON",
    [self.ABOVE] = "ABOVE",
    [self.FRONT_OF] = "FRONT_OF",
    [self.BEHIND] = "BEHIND",
  }
  return string.format("%s: %s", self.field_name or self.NAME, name_lookup[self.value] or string.format("%d", self.value))
end
new_mt.__tostring = new_mt.__index.pretty_print

new_mt.__index.UNDER  = 0x00
new_mt.__index.NEXT_TO  = 0x01
new_mt.__index.AROUND  = 0x02
new_mt.__index.ON  = 0x03
new_mt.__index.ABOVE  = 0x04
new_mt.__index.FRONT_OF  = 0x05
new_mt.__index.BEHIND  = 0x06

RelativePositionTag.UNDER  = 0x00
RelativePositionTag.NEXT_TO  = 0x01
RelativePositionTag.AROUND  = 0x02
RelativePositionTag.ON  = 0x03
RelativePositionTag.ABOVE  = 0x04
RelativePositionTag.FRONT_OF  = 0x05
RelativePositionTag.BEHIND  = 0x06

RelativePositionTag.augment_type = function(cls, val)
  setmetatable(val, new_mt)
end

setmetatable(RelativePositionTag, new_mt)

local has_aliases, aliases = pcall(require, "st.matter.clusters.aliases.Global.types.RelativePositionTag")
if has_aliases then
  aliases:add_to_class(RelativePositionTag)
end

return RelativePositionTag

