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

--- @class st.matter.clusters.BasicInformation.types.ColorEnum: st.matter.data_types.Uint8
--- @alias ColorEnum
---
--- @field public byte_length number 1
--- @field public BLACK number 0
--- @field public NAVY number 1
--- @field public GREEN number 2
--- @field public TEAL number 3
--- @field public MAROON number 4
--- @field public PURPLE number 5
--- @field public OLIVE number 6
--- @field public GRAY number 7
--- @field public BLUE number 8
--- @field public LIME number 9
--- @field public AQUA number 10
--- @field public RED number 11
--- @field public FUCHSIA number 12
--- @field public YELLOW number 13
--- @field public WHITE number 14
--- @field public NICKEL number 15
--- @field public CHROME number 16
--- @field public BRASS number 17
--- @field public COPPER number 18
--- @field public SILVER number 19
--- @field public GOLD number 20

local ColorEnum = {}
local new_mt = UintABC.new_mt({NAME = "ColorEnum", ID = data_types.name_to_id_map["Uint8"]}, 1)
new_mt.__index.pretty_print = function(self)
  local name_lookup = {
    [self.BLACK] = "BLACK",
    [self.NAVY] = "NAVY",
    [self.GREEN] = "GREEN",
    [self.TEAL] = "TEAL",
    [self.MAROON] = "MAROON",
    [self.PURPLE] = "PURPLE",
    [self.OLIVE] = "OLIVE",
    [self.GRAY] = "GRAY",
    [self.BLUE] = "BLUE",
    [self.LIME] = "LIME",
    [self.AQUA] = "AQUA",
    [self.RED] = "RED",
    [self.FUCHSIA] = "FUCHSIA",
    [self.YELLOW] = "YELLOW",
    [self.WHITE] = "WHITE",
    [self.NICKEL] = "NICKEL",
    [self.CHROME] = "CHROME",
    [self.BRASS] = "BRASS",
    [self.COPPER] = "COPPER",
    [self.SILVER] = "SILVER",
    [self.GOLD] = "GOLD",
  }
  return string.format("%s: %s", self.field_name or self.NAME, name_lookup[self.value] or string.format("%d", self.value))
end
new_mt.__tostring = new_mt.__index.pretty_print

new_mt.__index.BLACK  = 0x00
new_mt.__index.NAVY  = 0x01
new_mt.__index.GREEN  = 0x02
new_mt.__index.TEAL  = 0x03
new_mt.__index.MAROON  = 0x04
new_mt.__index.PURPLE  = 0x05
new_mt.__index.OLIVE  = 0x06
new_mt.__index.GRAY  = 0x07
new_mt.__index.BLUE  = 0x08
new_mt.__index.LIME  = 0x09
new_mt.__index.AQUA  = 0x0A
new_mt.__index.RED  = 0x0B
new_mt.__index.FUCHSIA  = 0x0C
new_mt.__index.YELLOW  = 0x0D
new_mt.__index.WHITE  = 0x0E
new_mt.__index.NICKEL  = 0x0F
new_mt.__index.CHROME  = 0x10
new_mt.__index.BRASS  = 0x11
new_mt.__index.COPPER  = 0x12
new_mt.__index.SILVER  = 0x13
new_mt.__index.GOLD  = 0x14

ColorEnum.BLACK  = 0x00
ColorEnum.NAVY  = 0x01
ColorEnum.GREEN  = 0x02
ColorEnum.TEAL  = 0x03
ColorEnum.MAROON  = 0x04
ColorEnum.PURPLE  = 0x05
ColorEnum.OLIVE  = 0x06
ColorEnum.GRAY  = 0x07
ColorEnum.BLUE  = 0x08
ColorEnum.LIME  = 0x09
ColorEnum.AQUA  = 0x0A
ColorEnum.RED  = 0x0B
ColorEnum.FUCHSIA  = 0x0C
ColorEnum.YELLOW  = 0x0D
ColorEnum.WHITE  = 0x0E
ColorEnum.NICKEL  = 0x0F
ColorEnum.CHROME  = 0x10
ColorEnum.BRASS  = 0x11
ColorEnum.COPPER  = 0x12
ColorEnum.SILVER  = 0x13
ColorEnum.GOLD  = 0x14

ColorEnum.augment_type = function(cls, val)
  setmetatable(val, new_mt)
end

setmetatable(ColorEnum, new_mt)

local has_aliases, aliases = pcall(require, "st.matter.clusters.aliases.BasicInformation.types.ColorEnum")
if has_aliases then
  aliases:add_to_class(ColorEnum)
end

return ColorEnum

