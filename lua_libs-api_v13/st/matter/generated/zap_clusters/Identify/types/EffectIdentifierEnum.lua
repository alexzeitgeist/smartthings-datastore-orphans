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

--- @class st.matter.clusters.Identify.types.EffectIdentifierEnum: st.matter.data_types.Uint8
--- @alias EffectIdentifierEnum
---
--- @field public byte_length number 1
--- @field public BLINK number 0
--- @field public BREATHE number 1
--- @field public OKAY number 2
--- @field public CHANNEL_CHANGE number 11
--- @field public FINISH_EFFECT number 254
--- @field public STOP_EFFECT number 255

local EffectIdentifierEnum = {}
local new_mt = UintABC.new_mt({NAME = "EffectIdentifierEnum", ID = data_types.name_to_id_map["Uint8"]}, 1)
new_mt.__index.pretty_print = function(self)
  local name_lookup = {
    [self.BLINK] = "BLINK",
    [self.BREATHE] = "BREATHE",
    [self.OKAY] = "OKAY",
    [self.CHANNEL_CHANGE] = "CHANNEL_CHANGE",
    [self.FINISH_EFFECT] = "FINISH_EFFECT",
    [self.STOP_EFFECT] = "STOP_EFFECT",
  }
  return string.format("%s: %s", self.field_name or self.NAME, name_lookup[self.value] or string.format("%d", self.value))
end
new_mt.__tostring = new_mt.__index.pretty_print

new_mt.__index.BLINK  = 0x00
new_mt.__index.BREATHE  = 0x01
new_mt.__index.OKAY  = 0x02
new_mt.__index.CHANNEL_CHANGE  = 0x0B
new_mt.__index.FINISH_EFFECT  = 0xFE
new_mt.__index.STOP_EFFECT  = 0xFF

EffectIdentifierEnum.BLINK  = 0x00
EffectIdentifierEnum.BREATHE  = 0x01
EffectIdentifierEnum.OKAY  = 0x02
EffectIdentifierEnum.CHANNEL_CHANGE  = 0x0B
EffectIdentifierEnum.FINISH_EFFECT  = 0xFE
EffectIdentifierEnum.STOP_EFFECT  = 0xFF

EffectIdentifierEnum.augment_type = function(cls, val)
  setmetatable(val, new_mt)
end

setmetatable(EffectIdentifierEnum, new_mt)

local has_aliases, aliases = pcall(require, "st.matter.clusters.aliases.Identify.types.EffectIdentifierEnum")
if has_aliases then
  aliases:add_to_class(EffectIdentifierEnum)
end

return EffectIdentifierEnum

