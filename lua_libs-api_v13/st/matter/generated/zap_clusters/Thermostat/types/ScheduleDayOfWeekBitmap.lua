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

--- @class st.matter.clusters.Thermostat.types.ScheduleDayOfWeekBitmap
--- @alias ScheduleDayOfWeekBitmap
---
--- @field public SUNDAY number 1
--- @field public MONDAY number 2
--- @field public TUESDAY number 4
--- @field public WEDNESDAY number 8
--- @field public THURSDAY number 16
--- @field public FRIDAY number 32
--- @field public SATURDAY number 64
--- @field public AWAY number 128

local ScheduleDayOfWeekBitmap = {}
local new_mt = UintABC.new_mt({NAME = "ScheduleDayOfWeekBitmap", ID = data_types.name_to_id_map["Uint8"]}, 1)

ScheduleDayOfWeekBitmap.BASE_MASK = 0xFFFF
ScheduleDayOfWeekBitmap.SUNDAY = 0x0001
ScheduleDayOfWeekBitmap.MONDAY = 0x0002
ScheduleDayOfWeekBitmap.TUESDAY = 0x0004
ScheduleDayOfWeekBitmap.WEDNESDAY = 0x0008
ScheduleDayOfWeekBitmap.THURSDAY = 0x0010
ScheduleDayOfWeekBitmap.FRIDAY = 0x0020
ScheduleDayOfWeekBitmap.SATURDAY = 0x0040
ScheduleDayOfWeekBitmap.AWAY = 0x0080

ScheduleDayOfWeekBitmap.mask_fields = {
  BASE_MASK = 0xFFFF,
  SUNDAY = 0x0001,
  MONDAY = 0x0002,
  TUESDAY = 0x0004,
  WEDNESDAY = 0x0008,
  THURSDAY = 0x0010,
  FRIDAY = 0x0020,
  SATURDAY = 0x0040,
  AWAY = 0x0080,
}

--- @function ScheduleDayOfWeekBitmap:is_sunday_set
--- @return boolean True if the value of SUNDAY is non-zero
ScheduleDayOfWeekBitmap.is_sunday_set = function(self)
  return (self.value & self.SUNDAY) ~= 0
end

--- @function ScheduleDayOfWeekBitmap:set_sunday
--- Set the value of the bit in the SUNDAY field to 1
ScheduleDayOfWeekBitmap.set_sunday = function(self)
  if self.value ~= nil then
    self.value = self.value | self.SUNDAY
  else
    self.value = self.SUNDAY
  end
end

--- @function ScheduleDayOfWeekBitmap:unset_sunday
--- Set the value of the bits in the SUNDAY field to 0
ScheduleDayOfWeekBitmap.unset_sunday = function(self)
  self.value = self.value & (~self.SUNDAY & self.BASE_MASK)
end
--- @function ScheduleDayOfWeekBitmap:is_monday_set
--- @return boolean True if the value of MONDAY is non-zero
ScheduleDayOfWeekBitmap.is_monday_set = function(self)
  return (self.value & self.MONDAY) ~= 0
end

--- @function ScheduleDayOfWeekBitmap:set_monday
--- Set the value of the bit in the MONDAY field to 1
ScheduleDayOfWeekBitmap.set_monday = function(self)
  if self.value ~= nil then
    self.value = self.value | self.MONDAY
  else
    self.value = self.MONDAY
  end
end

--- @function ScheduleDayOfWeekBitmap:unset_monday
--- Set the value of the bits in the MONDAY field to 0
ScheduleDayOfWeekBitmap.unset_monday = function(self)
  self.value = self.value & (~self.MONDAY & self.BASE_MASK)
end
--- @function ScheduleDayOfWeekBitmap:is_tuesday_set
--- @return boolean True if the value of TUESDAY is non-zero
ScheduleDayOfWeekBitmap.is_tuesday_set = function(self)
  return (self.value & self.TUESDAY) ~= 0
end

--- @function ScheduleDayOfWeekBitmap:set_tuesday
--- Set the value of the bit in the TUESDAY field to 1
ScheduleDayOfWeekBitmap.set_tuesday = function(self)
  if self.value ~= nil then
    self.value = self.value | self.TUESDAY
  else
    self.value = self.TUESDAY
  end
end

--- @function ScheduleDayOfWeekBitmap:unset_tuesday
--- Set the value of the bits in the TUESDAY field to 0
ScheduleDayOfWeekBitmap.unset_tuesday = function(self)
  self.value = self.value & (~self.TUESDAY & self.BASE_MASK)
end
--- @function ScheduleDayOfWeekBitmap:is_wednesday_set
--- @return boolean True if the value of WEDNESDAY is non-zero
ScheduleDayOfWeekBitmap.is_wednesday_set = function(self)
  return (self.value & self.WEDNESDAY) ~= 0
end

--- @function ScheduleDayOfWeekBitmap:set_wednesday
--- Set the value of the bit in the WEDNESDAY field to 1
ScheduleDayOfWeekBitmap.set_wednesday = function(self)
  if self.value ~= nil then
    self.value = self.value | self.WEDNESDAY
  else
    self.value = self.WEDNESDAY
  end
end

--- @function ScheduleDayOfWeekBitmap:unset_wednesday
--- Set the value of the bits in the WEDNESDAY field to 0
ScheduleDayOfWeekBitmap.unset_wednesday = function(self)
  self.value = self.value & (~self.WEDNESDAY & self.BASE_MASK)
end
--- @function ScheduleDayOfWeekBitmap:is_thursday_set
--- @return boolean True if the value of THURSDAY is non-zero
ScheduleDayOfWeekBitmap.is_thursday_set = function(self)
  return (self.value & self.THURSDAY) ~= 0
end

--- @function ScheduleDayOfWeekBitmap:set_thursday
--- Set the value of the bit in the THURSDAY field to 1
ScheduleDayOfWeekBitmap.set_thursday = function(self)
  if self.value ~= nil then
    self.value = self.value | self.THURSDAY
  else
    self.value = self.THURSDAY
  end
end

--- @function ScheduleDayOfWeekBitmap:unset_thursday
--- Set the value of the bits in the THURSDAY field to 0
ScheduleDayOfWeekBitmap.unset_thursday = function(self)
  self.value = self.value & (~self.THURSDAY & self.BASE_MASK)
end
--- @function ScheduleDayOfWeekBitmap:is_friday_set
--- @return boolean True if the value of FRIDAY is non-zero
ScheduleDayOfWeekBitmap.is_friday_set = function(self)
  return (self.value & self.FRIDAY) ~= 0
end

--- @function ScheduleDayOfWeekBitmap:set_friday
--- Set the value of the bit in the FRIDAY field to 1
ScheduleDayOfWeekBitmap.set_friday = function(self)
  if self.value ~= nil then
    self.value = self.value | self.FRIDAY
  else
    self.value = self.FRIDAY
  end
end

--- @function ScheduleDayOfWeekBitmap:unset_friday
--- Set the value of the bits in the FRIDAY field to 0
ScheduleDayOfWeekBitmap.unset_friday = function(self)
  self.value = self.value & (~self.FRIDAY & self.BASE_MASK)
end
--- @function ScheduleDayOfWeekBitmap:is_saturday_set
--- @return boolean True if the value of SATURDAY is non-zero
ScheduleDayOfWeekBitmap.is_saturday_set = function(self)
  return (self.value & self.SATURDAY) ~= 0
end

--- @function ScheduleDayOfWeekBitmap:set_saturday
--- Set the value of the bit in the SATURDAY field to 1
ScheduleDayOfWeekBitmap.set_saturday = function(self)
  if self.value ~= nil then
    self.value = self.value | self.SATURDAY
  else
    self.value = self.SATURDAY
  end
end

--- @function ScheduleDayOfWeekBitmap:unset_saturday
--- Set the value of the bits in the SATURDAY field to 0
ScheduleDayOfWeekBitmap.unset_saturday = function(self)
  self.value = self.value & (~self.SATURDAY & self.BASE_MASK)
end
--- @function ScheduleDayOfWeekBitmap:is_away_set
--- @return boolean True if the value of AWAY is non-zero
ScheduleDayOfWeekBitmap.is_away_set = function(self)
  return (self.value & self.AWAY) ~= 0
end

--- @function ScheduleDayOfWeekBitmap:set_away
--- Set the value of the bit in the AWAY field to 1
ScheduleDayOfWeekBitmap.set_away = function(self)
  if self.value ~= nil then
    self.value = self.value | self.AWAY
  else
    self.value = self.AWAY
  end
end

--- @function ScheduleDayOfWeekBitmap:unset_away
--- Set the value of the bits in the AWAY field to 0
ScheduleDayOfWeekBitmap.unset_away = function(self)
  self.value = self.value & (~self.AWAY & self.BASE_MASK)
end


ScheduleDayOfWeekBitmap.mask_methods = {
  is_sunday_set = ScheduleDayOfWeekBitmap.is_sunday_set,
  set_sunday = ScheduleDayOfWeekBitmap.set_sunday,
  unset_sunday = ScheduleDayOfWeekBitmap.unset_sunday,
  is_monday_set = ScheduleDayOfWeekBitmap.is_monday_set,
  set_monday = ScheduleDayOfWeekBitmap.set_monday,
  unset_monday = ScheduleDayOfWeekBitmap.unset_monday,
  is_tuesday_set = ScheduleDayOfWeekBitmap.is_tuesday_set,
  set_tuesday = ScheduleDayOfWeekBitmap.set_tuesday,
  unset_tuesday = ScheduleDayOfWeekBitmap.unset_tuesday,
  is_wednesday_set = ScheduleDayOfWeekBitmap.is_wednesday_set,
  set_wednesday = ScheduleDayOfWeekBitmap.set_wednesday,
  unset_wednesday = ScheduleDayOfWeekBitmap.unset_wednesday,
  is_thursday_set = ScheduleDayOfWeekBitmap.is_thursday_set,
  set_thursday = ScheduleDayOfWeekBitmap.set_thursday,
  unset_thursday = ScheduleDayOfWeekBitmap.unset_thursday,
  is_friday_set = ScheduleDayOfWeekBitmap.is_friday_set,
  set_friday = ScheduleDayOfWeekBitmap.set_friday,
  unset_friday = ScheduleDayOfWeekBitmap.unset_friday,
  is_saturday_set = ScheduleDayOfWeekBitmap.is_saturday_set,
  set_saturday = ScheduleDayOfWeekBitmap.set_saturday,
  unset_saturday = ScheduleDayOfWeekBitmap.unset_saturday,
  is_away_set = ScheduleDayOfWeekBitmap.is_away_set,
  set_away = ScheduleDayOfWeekBitmap.set_away,
  unset_away = ScheduleDayOfWeekBitmap.unset_away,
}

ScheduleDayOfWeekBitmap.augment_type = function(cls, val)
  setmetatable(val, new_mt)
end

setmetatable(ScheduleDayOfWeekBitmap, new_mt)

local has_aliases, aliases = pcall(require, "st.matter.clusters.aliases.Thermostat.types.ScheduleDayOfWeekBitmap")
if has_aliases then
  aliases:add_to_class(ScheduleDayOfWeekBitmap)
end

return ScheduleDayOfWeekBitmap

