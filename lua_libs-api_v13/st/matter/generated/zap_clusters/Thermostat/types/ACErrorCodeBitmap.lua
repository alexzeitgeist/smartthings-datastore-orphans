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

--- @class st.matter.clusters.Thermostat.types.ACErrorCodeBitmap
--- @alias ACErrorCodeBitmap
---
--- @field public COMPRESSOR_FAIL number 1
--- @field public ROOM_SENSOR_FAIL number 2
--- @field public OUTDOOR_SENSOR_FAIL number 4
--- @field public COIL_SENSOR_FAIL number 8
--- @field public FAN_FAIL number 16

local ACErrorCodeBitmap = {}
local new_mt = UintABC.new_mt({NAME = "ACErrorCodeBitmap", ID = data_types.name_to_id_map["Uint32"]}, 4)

ACErrorCodeBitmap.BASE_MASK = 0xFFFF
ACErrorCodeBitmap.COMPRESSOR_FAIL = 0x0001
ACErrorCodeBitmap.ROOM_SENSOR_FAIL = 0x0002
ACErrorCodeBitmap.OUTDOOR_SENSOR_FAIL = 0x0004
ACErrorCodeBitmap.COIL_SENSOR_FAIL = 0x0008
ACErrorCodeBitmap.FAN_FAIL = 0x0010

ACErrorCodeBitmap.mask_fields = {
  BASE_MASK = 0xFFFF,
  COMPRESSOR_FAIL = 0x0001,
  ROOM_SENSOR_FAIL = 0x0002,
  OUTDOOR_SENSOR_FAIL = 0x0004,
  COIL_SENSOR_FAIL = 0x0008,
  FAN_FAIL = 0x0010,
}

--- @function ACErrorCodeBitmap:is_compressor_fail_set
--- @return boolean True if the value of COMPRESSOR_FAIL is non-zero
ACErrorCodeBitmap.is_compressor_fail_set = function(self)
  return (self.value & self.COMPRESSOR_FAIL) ~= 0
end

--- @function ACErrorCodeBitmap:set_compressor_fail
--- Set the value of the bit in the COMPRESSOR_FAIL field to 1
ACErrorCodeBitmap.set_compressor_fail = function(self)
  if self.value ~= nil then
    self.value = self.value | self.COMPRESSOR_FAIL
  else
    self.value = self.COMPRESSOR_FAIL
  end
end

--- @function ACErrorCodeBitmap:unset_compressor_fail
--- Set the value of the bits in the COMPRESSOR_FAIL field to 0
ACErrorCodeBitmap.unset_compressor_fail = function(self)
  self.value = self.value & (~self.COMPRESSOR_FAIL & self.BASE_MASK)
end
--- @function ACErrorCodeBitmap:is_room_sensor_fail_set
--- @return boolean True if the value of ROOM_SENSOR_FAIL is non-zero
ACErrorCodeBitmap.is_room_sensor_fail_set = function(self)
  return (self.value & self.ROOM_SENSOR_FAIL) ~= 0
end

--- @function ACErrorCodeBitmap:set_room_sensor_fail
--- Set the value of the bit in the ROOM_SENSOR_FAIL field to 1
ACErrorCodeBitmap.set_room_sensor_fail = function(self)
  if self.value ~= nil then
    self.value = self.value | self.ROOM_SENSOR_FAIL
  else
    self.value = self.ROOM_SENSOR_FAIL
  end
end

--- @function ACErrorCodeBitmap:unset_room_sensor_fail
--- Set the value of the bits in the ROOM_SENSOR_FAIL field to 0
ACErrorCodeBitmap.unset_room_sensor_fail = function(self)
  self.value = self.value & (~self.ROOM_SENSOR_FAIL & self.BASE_MASK)
end
--- @function ACErrorCodeBitmap:is_outdoor_sensor_fail_set
--- @return boolean True if the value of OUTDOOR_SENSOR_FAIL is non-zero
ACErrorCodeBitmap.is_outdoor_sensor_fail_set = function(self)
  return (self.value & self.OUTDOOR_SENSOR_FAIL) ~= 0
end

--- @function ACErrorCodeBitmap:set_outdoor_sensor_fail
--- Set the value of the bit in the OUTDOOR_SENSOR_FAIL field to 1
ACErrorCodeBitmap.set_outdoor_sensor_fail = function(self)
  if self.value ~= nil then
    self.value = self.value | self.OUTDOOR_SENSOR_FAIL
  else
    self.value = self.OUTDOOR_SENSOR_FAIL
  end
end

--- @function ACErrorCodeBitmap:unset_outdoor_sensor_fail
--- Set the value of the bits in the OUTDOOR_SENSOR_FAIL field to 0
ACErrorCodeBitmap.unset_outdoor_sensor_fail = function(self)
  self.value = self.value & (~self.OUTDOOR_SENSOR_FAIL & self.BASE_MASK)
end
--- @function ACErrorCodeBitmap:is_coil_sensor_fail_set
--- @return boolean True if the value of COIL_SENSOR_FAIL is non-zero
ACErrorCodeBitmap.is_coil_sensor_fail_set = function(self)
  return (self.value & self.COIL_SENSOR_FAIL) ~= 0
end

--- @function ACErrorCodeBitmap:set_coil_sensor_fail
--- Set the value of the bit in the COIL_SENSOR_FAIL field to 1
ACErrorCodeBitmap.set_coil_sensor_fail = function(self)
  if self.value ~= nil then
    self.value = self.value | self.COIL_SENSOR_FAIL
  else
    self.value = self.COIL_SENSOR_FAIL
  end
end

--- @function ACErrorCodeBitmap:unset_coil_sensor_fail
--- Set the value of the bits in the COIL_SENSOR_FAIL field to 0
ACErrorCodeBitmap.unset_coil_sensor_fail = function(self)
  self.value = self.value & (~self.COIL_SENSOR_FAIL & self.BASE_MASK)
end
--- @function ACErrorCodeBitmap:is_fan_fail_set
--- @return boolean True if the value of FAN_FAIL is non-zero
ACErrorCodeBitmap.is_fan_fail_set = function(self)
  return (self.value & self.FAN_FAIL) ~= 0
end

--- @function ACErrorCodeBitmap:set_fan_fail
--- Set the value of the bit in the FAN_FAIL field to 1
ACErrorCodeBitmap.set_fan_fail = function(self)
  if self.value ~= nil then
    self.value = self.value | self.FAN_FAIL
  else
    self.value = self.FAN_FAIL
  end
end

--- @function ACErrorCodeBitmap:unset_fan_fail
--- Set the value of the bits in the FAN_FAIL field to 0
ACErrorCodeBitmap.unset_fan_fail = function(self)
  self.value = self.value & (~self.FAN_FAIL & self.BASE_MASK)
end


ACErrorCodeBitmap.mask_methods = {
  is_compressor_fail_set = ACErrorCodeBitmap.is_compressor_fail_set,
  set_compressor_fail = ACErrorCodeBitmap.set_compressor_fail,
  unset_compressor_fail = ACErrorCodeBitmap.unset_compressor_fail,
  is_room_sensor_fail_set = ACErrorCodeBitmap.is_room_sensor_fail_set,
  set_room_sensor_fail = ACErrorCodeBitmap.set_room_sensor_fail,
  unset_room_sensor_fail = ACErrorCodeBitmap.unset_room_sensor_fail,
  is_outdoor_sensor_fail_set = ACErrorCodeBitmap.is_outdoor_sensor_fail_set,
  set_outdoor_sensor_fail = ACErrorCodeBitmap.set_outdoor_sensor_fail,
  unset_outdoor_sensor_fail = ACErrorCodeBitmap.unset_outdoor_sensor_fail,
  is_coil_sensor_fail_set = ACErrorCodeBitmap.is_coil_sensor_fail_set,
  set_coil_sensor_fail = ACErrorCodeBitmap.set_coil_sensor_fail,
  unset_coil_sensor_fail = ACErrorCodeBitmap.unset_coil_sensor_fail,
  is_fan_fail_set = ACErrorCodeBitmap.is_fan_fail_set,
  set_fan_fail = ACErrorCodeBitmap.set_fan_fail,
  unset_fan_fail = ACErrorCodeBitmap.unset_fan_fail,
}

ACErrorCodeBitmap.augment_type = function(cls, val)
  setmetatable(val, new_mt)
end

setmetatable(ACErrorCodeBitmap, new_mt)

local has_aliases, aliases = pcall(require, "st.matter.clusters.aliases.Thermostat.types.ACErrorCodeBitmap")
if has_aliases then
  aliases:add_to_class(ACErrorCodeBitmap)
end

return ACErrorCodeBitmap

