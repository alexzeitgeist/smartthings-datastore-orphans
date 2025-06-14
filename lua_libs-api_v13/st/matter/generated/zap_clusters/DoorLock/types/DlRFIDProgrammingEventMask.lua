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

--- @class st.matter.clusters.DoorLock.types.DlRFIDProgrammingEventMask
--- @alias DlRFIDProgrammingEventMask
---
--- @field public UNKNOWN number 1
--- @field public RFID_CODE_ADDED number 32
--- @field public RFID_CODE_CLEARED number 64

local DlRFIDProgrammingEventMask = {}
local new_mt = UintABC.new_mt({NAME = "DlRFIDProgrammingEventMask", ID = data_types.name_to_id_map["Uint16"]}, 2)

DlRFIDProgrammingEventMask.BASE_MASK = 0xFFFF
DlRFIDProgrammingEventMask.UNKNOWN = 0x0001
DlRFIDProgrammingEventMask.RFID_CODE_ADDED = 0x0020
DlRFIDProgrammingEventMask.RFID_CODE_CLEARED = 0x0040

DlRFIDProgrammingEventMask.mask_fields = {
  BASE_MASK = 0xFFFF,
  UNKNOWN = 0x0001,
  RFID_CODE_ADDED = 0x0020,
  RFID_CODE_CLEARED = 0x0040,
}

--- @function DlRFIDProgrammingEventMask:is_unknown_set
--- @return boolean True if the value of UNKNOWN is non-zero
DlRFIDProgrammingEventMask.is_unknown_set = function(self)
  return (self.value & self.UNKNOWN) ~= 0
end

--- @function DlRFIDProgrammingEventMask:set_unknown
--- Set the value of the bit in the UNKNOWN field to 1
DlRFIDProgrammingEventMask.set_unknown = function(self)
  if self.value ~= nil then
    self.value = self.value | self.UNKNOWN
  else
    self.value = self.UNKNOWN
  end
end

--- @function DlRFIDProgrammingEventMask:unset_unknown
--- Set the value of the bits in the UNKNOWN field to 0
DlRFIDProgrammingEventMask.unset_unknown = function(self)
  self.value = self.value & (~self.UNKNOWN & self.BASE_MASK)
end
--- @function DlRFIDProgrammingEventMask:is_rfid_code_added_set
--- @return boolean True if the value of RFID_CODE_ADDED is non-zero
DlRFIDProgrammingEventMask.is_rfid_code_added_set = function(self)
  return (self.value & self.RFID_CODE_ADDED) ~= 0
end

--- @function DlRFIDProgrammingEventMask:set_rfid_code_added
--- Set the value of the bit in the RFID_CODE_ADDED field to 1
DlRFIDProgrammingEventMask.set_rfid_code_added = function(self)
  if self.value ~= nil then
    self.value = self.value | self.RFID_CODE_ADDED
  else
    self.value = self.RFID_CODE_ADDED
  end
end

--- @function DlRFIDProgrammingEventMask:unset_rfid_code_added
--- Set the value of the bits in the RFID_CODE_ADDED field to 0
DlRFIDProgrammingEventMask.unset_rfid_code_added = function(self)
  self.value = self.value & (~self.RFID_CODE_ADDED & self.BASE_MASK)
end
--- @function DlRFIDProgrammingEventMask:is_rfid_code_cleared_set
--- @return boolean True if the value of RFID_CODE_CLEARED is non-zero
DlRFIDProgrammingEventMask.is_rfid_code_cleared_set = function(self)
  return (self.value & self.RFID_CODE_CLEARED) ~= 0
end

--- @function DlRFIDProgrammingEventMask:set_rfid_code_cleared
--- Set the value of the bit in the RFID_CODE_CLEARED field to 1
DlRFIDProgrammingEventMask.set_rfid_code_cleared = function(self)
  if self.value ~= nil then
    self.value = self.value | self.RFID_CODE_CLEARED
  else
    self.value = self.RFID_CODE_CLEARED
  end
end

--- @function DlRFIDProgrammingEventMask:unset_rfid_code_cleared
--- Set the value of the bits in the RFID_CODE_CLEARED field to 0
DlRFIDProgrammingEventMask.unset_rfid_code_cleared = function(self)
  self.value = self.value & (~self.RFID_CODE_CLEARED & self.BASE_MASK)
end


DlRFIDProgrammingEventMask.mask_methods = {
  is_unknown_set = DlRFIDProgrammingEventMask.is_unknown_set,
  set_unknown = DlRFIDProgrammingEventMask.set_unknown,
  unset_unknown = DlRFIDProgrammingEventMask.unset_unknown,
  is_rfid_code_added_set = DlRFIDProgrammingEventMask.is_rfid_code_added_set,
  set_rfid_code_added = DlRFIDProgrammingEventMask.set_rfid_code_added,
  unset_rfid_code_added = DlRFIDProgrammingEventMask.unset_rfid_code_added,
  is_rfid_code_cleared_set = DlRFIDProgrammingEventMask.is_rfid_code_cleared_set,
  set_rfid_code_cleared = DlRFIDProgrammingEventMask.set_rfid_code_cleared,
  unset_rfid_code_cleared = DlRFIDProgrammingEventMask.unset_rfid_code_cleared,
}

DlRFIDProgrammingEventMask.augment_type = function(cls, val)
  setmetatable(val, new_mt)
end

setmetatable(DlRFIDProgrammingEventMask, new_mt)

local has_aliases, aliases = pcall(require, "st.matter.clusters.aliases.DoorLock.types.DlRFIDProgrammingEventMask")
if has_aliases then
  aliases:add_to_class(DlRFIDProgrammingEventMask)
end

return DlRFIDProgrammingEventMask

