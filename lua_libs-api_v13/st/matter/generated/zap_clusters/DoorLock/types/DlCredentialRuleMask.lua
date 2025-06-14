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

--- @class st.matter.clusters.DoorLock.types.DlCredentialRuleMask
--- @alias DlCredentialRuleMask
---
--- @field public SINGLE number 1
--- @field public DUAL number 2
--- @field public TRI number 4

local DlCredentialRuleMask = {}
local new_mt = UintABC.new_mt({NAME = "DlCredentialRuleMask", ID = data_types.name_to_id_map["Uint8"]}, 1)

DlCredentialRuleMask.BASE_MASK = 0xFFFF
DlCredentialRuleMask.SINGLE = 0x0001
DlCredentialRuleMask.DUAL = 0x0002
DlCredentialRuleMask.TRI = 0x0004

DlCredentialRuleMask.mask_fields = {
  BASE_MASK = 0xFFFF,
  SINGLE = 0x0001,
  DUAL = 0x0002,
  TRI = 0x0004,
}

--- @function DlCredentialRuleMask:is_single_set
--- @return boolean True if the value of SINGLE is non-zero
DlCredentialRuleMask.is_single_set = function(self)
  return (self.value & self.SINGLE) ~= 0
end

--- @function DlCredentialRuleMask:set_single
--- Set the value of the bit in the SINGLE field to 1
DlCredentialRuleMask.set_single = function(self)
  if self.value ~= nil then
    self.value = self.value | self.SINGLE
  else
    self.value = self.SINGLE
  end
end

--- @function DlCredentialRuleMask:unset_single
--- Set the value of the bits in the SINGLE field to 0
DlCredentialRuleMask.unset_single = function(self)
  self.value = self.value & (~self.SINGLE & self.BASE_MASK)
end
--- @function DlCredentialRuleMask:is_dual_set
--- @return boolean True if the value of DUAL is non-zero
DlCredentialRuleMask.is_dual_set = function(self)
  return (self.value & self.DUAL) ~= 0
end

--- @function DlCredentialRuleMask:set_dual
--- Set the value of the bit in the DUAL field to 1
DlCredentialRuleMask.set_dual = function(self)
  if self.value ~= nil then
    self.value = self.value | self.DUAL
  else
    self.value = self.DUAL
  end
end

--- @function DlCredentialRuleMask:unset_dual
--- Set the value of the bits in the DUAL field to 0
DlCredentialRuleMask.unset_dual = function(self)
  self.value = self.value & (~self.DUAL & self.BASE_MASK)
end
--- @function DlCredentialRuleMask:is_tri_set
--- @return boolean True if the value of TRI is non-zero
DlCredentialRuleMask.is_tri_set = function(self)
  return (self.value & self.TRI) ~= 0
end

--- @function DlCredentialRuleMask:set_tri
--- Set the value of the bit in the TRI field to 1
DlCredentialRuleMask.set_tri = function(self)
  if self.value ~= nil then
    self.value = self.value | self.TRI
  else
    self.value = self.TRI
  end
end

--- @function DlCredentialRuleMask:unset_tri
--- Set the value of the bits in the TRI field to 0
DlCredentialRuleMask.unset_tri = function(self)
  self.value = self.value & (~self.TRI & self.BASE_MASK)
end


DlCredentialRuleMask.mask_methods = {
  is_single_set = DlCredentialRuleMask.is_single_set,
  set_single = DlCredentialRuleMask.set_single,
  unset_single = DlCredentialRuleMask.unset_single,
  is_dual_set = DlCredentialRuleMask.is_dual_set,
  set_dual = DlCredentialRuleMask.set_dual,
  unset_dual = DlCredentialRuleMask.unset_dual,
  is_tri_set = DlCredentialRuleMask.is_tri_set,
  set_tri = DlCredentialRuleMask.set_tri,
  unset_tri = DlCredentialRuleMask.unset_tri,
}

DlCredentialRuleMask.augment_type = function(cls, val)
  setmetatable(val, new_mt)
end

setmetatable(DlCredentialRuleMask, new_mt)

local has_aliases, aliases = pcall(require, "st.matter.clusters.aliases.DoorLock.types.DlCredentialRuleMask")
if has_aliases then
  aliases:add_to_class(DlCredentialRuleMask)
end

return DlCredentialRuleMask

