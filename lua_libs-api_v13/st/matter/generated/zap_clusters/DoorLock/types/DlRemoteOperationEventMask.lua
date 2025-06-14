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

--- @class st.matter.clusters.DoorLock.types.DlRemoteOperationEventMask
--- @alias DlRemoteOperationEventMask
---
--- @field public UNKNOWN number 1
--- @field public LOCK number 2
--- @field public UNLOCK number 4
--- @field public LOCK_INVALID_CODE number 8
--- @field public LOCK_INVALID_SCHEDULE number 16
--- @field public UNLOCK_INVALID_CODE number 32
--- @field public UNLOCK_INVALID_SCHEDULE number 64

local DlRemoteOperationEventMask = {}
local new_mt = UintABC.new_mt({NAME = "DlRemoteOperationEventMask", ID = data_types.name_to_id_map["Uint16"]}, 2)

DlRemoteOperationEventMask.BASE_MASK = 0xFFFF
DlRemoteOperationEventMask.UNKNOWN = 0x0001
DlRemoteOperationEventMask.LOCK = 0x0002
DlRemoteOperationEventMask.UNLOCK = 0x0004
DlRemoteOperationEventMask.LOCK_INVALID_CODE = 0x0008
DlRemoteOperationEventMask.LOCK_INVALID_SCHEDULE = 0x0010
DlRemoteOperationEventMask.UNLOCK_INVALID_CODE = 0x0020
DlRemoteOperationEventMask.UNLOCK_INVALID_SCHEDULE = 0x0040

DlRemoteOperationEventMask.mask_fields = {
  BASE_MASK = 0xFFFF,
  UNKNOWN = 0x0001,
  LOCK = 0x0002,
  UNLOCK = 0x0004,
  LOCK_INVALID_CODE = 0x0008,
  LOCK_INVALID_SCHEDULE = 0x0010,
  UNLOCK_INVALID_CODE = 0x0020,
  UNLOCK_INVALID_SCHEDULE = 0x0040,
}

--- @function DlRemoteOperationEventMask:is_unknown_set
--- @return boolean True if the value of UNKNOWN is non-zero
DlRemoteOperationEventMask.is_unknown_set = function(self)
  return (self.value & self.UNKNOWN) ~= 0
end

--- @function DlRemoteOperationEventMask:set_unknown
--- Set the value of the bit in the UNKNOWN field to 1
DlRemoteOperationEventMask.set_unknown = function(self)
  if self.value ~= nil then
    self.value = self.value | self.UNKNOWN
  else
    self.value = self.UNKNOWN
  end
end

--- @function DlRemoteOperationEventMask:unset_unknown
--- Set the value of the bits in the UNKNOWN field to 0
DlRemoteOperationEventMask.unset_unknown = function(self)
  self.value = self.value & (~self.UNKNOWN & self.BASE_MASK)
end
--- @function DlRemoteOperationEventMask:is_lock_set
--- @return boolean True if the value of LOCK is non-zero
DlRemoteOperationEventMask.is_lock_set = function(self)
  return (self.value & self.LOCK) ~= 0
end

--- @function DlRemoteOperationEventMask:set_lock
--- Set the value of the bit in the LOCK field to 1
DlRemoteOperationEventMask.set_lock = function(self)
  if self.value ~= nil then
    self.value = self.value | self.LOCK
  else
    self.value = self.LOCK
  end
end

--- @function DlRemoteOperationEventMask:unset_lock
--- Set the value of the bits in the LOCK field to 0
DlRemoteOperationEventMask.unset_lock = function(self)
  self.value = self.value & (~self.LOCK & self.BASE_MASK)
end
--- @function DlRemoteOperationEventMask:is_unlock_set
--- @return boolean True if the value of UNLOCK is non-zero
DlRemoteOperationEventMask.is_unlock_set = function(self)
  return (self.value & self.UNLOCK) ~= 0
end

--- @function DlRemoteOperationEventMask:set_unlock
--- Set the value of the bit in the UNLOCK field to 1
DlRemoteOperationEventMask.set_unlock = function(self)
  if self.value ~= nil then
    self.value = self.value | self.UNLOCK
  else
    self.value = self.UNLOCK
  end
end

--- @function DlRemoteOperationEventMask:unset_unlock
--- Set the value of the bits in the UNLOCK field to 0
DlRemoteOperationEventMask.unset_unlock = function(self)
  self.value = self.value & (~self.UNLOCK & self.BASE_MASK)
end
--- @function DlRemoteOperationEventMask:is_lock_invalid_code_set
--- @return boolean True if the value of LOCK_INVALID_CODE is non-zero
DlRemoteOperationEventMask.is_lock_invalid_code_set = function(self)
  return (self.value & self.LOCK_INVALID_CODE) ~= 0
end

--- @function DlRemoteOperationEventMask:set_lock_invalid_code
--- Set the value of the bit in the LOCK_INVALID_CODE field to 1
DlRemoteOperationEventMask.set_lock_invalid_code = function(self)
  if self.value ~= nil then
    self.value = self.value | self.LOCK_INVALID_CODE
  else
    self.value = self.LOCK_INVALID_CODE
  end
end

--- @function DlRemoteOperationEventMask:unset_lock_invalid_code
--- Set the value of the bits in the LOCK_INVALID_CODE field to 0
DlRemoteOperationEventMask.unset_lock_invalid_code = function(self)
  self.value = self.value & (~self.LOCK_INVALID_CODE & self.BASE_MASK)
end
--- @function DlRemoteOperationEventMask:is_lock_invalid_schedule_set
--- @return boolean True if the value of LOCK_INVALID_SCHEDULE is non-zero
DlRemoteOperationEventMask.is_lock_invalid_schedule_set = function(self)
  return (self.value & self.LOCK_INVALID_SCHEDULE) ~= 0
end

--- @function DlRemoteOperationEventMask:set_lock_invalid_schedule
--- Set the value of the bit in the LOCK_INVALID_SCHEDULE field to 1
DlRemoteOperationEventMask.set_lock_invalid_schedule = function(self)
  if self.value ~= nil then
    self.value = self.value | self.LOCK_INVALID_SCHEDULE
  else
    self.value = self.LOCK_INVALID_SCHEDULE
  end
end

--- @function DlRemoteOperationEventMask:unset_lock_invalid_schedule
--- Set the value of the bits in the LOCK_INVALID_SCHEDULE field to 0
DlRemoteOperationEventMask.unset_lock_invalid_schedule = function(self)
  self.value = self.value & (~self.LOCK_INVALID_SCHEDULE & self.BASE_MASK)
end
--- @function DlRemoteOperationEventMask:is_unlock_invalid_code_set
--- @return boolean True if the value of UNLOCK_INVALID_CODE is non-zero
DlRemoteOperationEventMask.is_unlock_invalid_code_set = function(self)
  return (self.value & self.UNLOCK_INVALID_CODE) ~= 0
end

--- @function DlRemoteOperationEventMask:set_unlock_invalid_code
--- Set the value of the bit in the UNLOCK_INVALID_CODE field to 1
DlRemoteOperationEventMask.set_unlock_invalid_code = function(self)
  if self.value ~= nil then
    self.value = self.value | self.UNLOCK_INVALID_CODE
  else
    self.value = self.UNLOCK_INVALID_CODE
  end
end

--- @function DlRemoteOperationEventMask:unset_unlock_invalid_code
--- Set the value of the bits in the UNLOCK_INVALID_CODE field to 0
DlRemoteOperationEventMask.unset_unlock_invalid_code = function(self)
  self.value = self.value & (~self.UNLOCK_INVALID_CODE & self.BASE_MASK)
end
--- @function DlRemoteOperationEventMask:is_unlock_invalid_schedule_set
--- @return boolean True if the value of UNLOCK_INVALID_SCHEDULE is non-zero
DlRemoteOperationEventMask.is_unlock_invalid_schedule_set = function(self)
  return (self.value & self.UNLOCK_INVALID_SCHEDULE) ~= 0
end

--- @function DlRemoteOperationEventMask:set_unlock_invalid_schedule
--- Set the value of the bit in the UNLOCK_INVALID_SCHEDULE field to 1
DlRemoteOperationEventMask.set_unlock_invalid_schedule = function(self)
  if self.value ~= nil then
    self.value = self.value | self.UNLOCK_INVALID_SCHEDULE
  else
    self.value = self.UNLOCK_INVALID_SCHEDULE
  end
end

--- @function DlRemoteOperationEventMask:unset_unlock_invalid_schedule
--- Set the value of the bits in the UNLOCK_INVALID_SCHEDULE field to 0
DlRemoteOperationEventMask.unset_unlock_invalid_schedule = function(self)
  self.value = self.value & (~self.UNLOCK_INVALID_SCHEDULE & self.BASE_MASK)
end


DlRemoteOperationEventMask.mask_methods = {
  is_unknown_set = DlRemoteOperationEventMask.is_unknown_set,
  set_unknown = DlRemoteOperationEventMask.set_unknown,
  unset_unknown = DlRemoteOperationEventMask.unset_unknown,
  is_lock_set = DlRemoteOperationEventMask.is_lock_set,
  set_lock = DlRemoteOperationEventMask.set_lock,
  unset_lock = DlRemoteOperationEventMask.unset_lock,
  is_unlock_set = DlRemoteOperationEventMask.is_unlock_set,
  set_unlock = DlRemoteOperationEventMask.set_unlock,
  unset_unlock = DlRemoteOperationEventMask.unset_unlock,
  is_lock_invalid_code_set = DlRemoteOperationEventMask.is_lock_invalid_code_set,
  set_lock_invalid_code = DlRemoteOperationEventMask.set_lock_invalid_code,
  unset_lock_invalid_code = DlRemoteOperationEventMask.unset_lock_invalid_code,
  is_lock_invalid_schedule_set = DlRemoteOperationEventMask.is_lock_invalid_schedule_set,
  set_lock_invalid_schedule = DlRemoteOperationEventMask.set_lock_invalid_schedule,
  unset_lock_invalid_schedule = DlRemoteOperationEventMask.unset_lock_invalid_schedule,
  is_unlock_invalid_code_set = DlRemoteOperationEventMask.is_unlock_invalid_code_set,
  set_unlock_invalid_code = DlRemoteOperationEventMask.set_unlock_invalid_code,
  unset_unlock_invalid_code = DlRemoteOperationEventMask.unset_unlock_invalid_code,
  is_unlock_invalid_schedule_set = DlRemoteOperationEventMask.is_unlock_invalid_schedule_set,
  set_unlock_invalid_schedule = DlRemoteOperationEventMask.set_unlock_invalid_schedule,
  unset_unlock_invalid_schedule = DlRemoteOperationEventMask.unset_unlock_invalid_schedule,
}

DlRemoteOperationEventMask.augment_type = function(cls, val)
  setmetatable(val, new_mt)
end

setmetatable(DlRemoteOperationEventMask, new_mt)

local has_aliases, aliases = pcall(require, "st.matter.clusters.aliases.DoorLock.types.DlRemoteOperationEventMask")
if has_aliases then
  aliases:add_to_class(DlRemoteOperationEventMask)
end

return DlRemoteOperationEventMask

