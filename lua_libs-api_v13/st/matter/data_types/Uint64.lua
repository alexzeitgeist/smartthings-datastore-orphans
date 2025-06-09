-- Copyright 2022 SmartThings
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
local UintABC = require "st.matter.data_types.base_defs.UintABC"

--- @class st.matter.data_types.Uint64: st.matter.data_types.UintABC
--- Note that very large numbers may require definition through hex or negative integers. This is because Lua
--- interprets all integers as signed, so numbers above `(2 ^ 63) - 1` will be interpreted as negative. However, this
--- is a two's complement representation, and so we can still store those numbers losslessly.
--- @field public ID number 0x07
--- @field public NAME string "Uint64"
--- @field public byte_length number 8
--- @field public value number This is the actual value of the instance of the data type
local Uint64 = {}
setmetatable(
  Uint64, UintABC.new_mt({NAME = "Uint64", ID = 0x07, SUBTYPES = {"Uint8", "Uint16", "Uint32"}}, 8)
)

return Uint64
