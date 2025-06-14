local data_types = require "st.zigbee.data_types"
local BitmapABC = require "st.zigbee.data_types.base_defs.BitmapABC"

-- Copyright 2024 SmartThings
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

-- DO NOT EDIT: this code is automatically generated by tools/zigbee_lib_generator/generate_clusters_from_xml.py
-- ZCL XML version: 7.2

--- @class st.zigbee.zcl.clusters.PowerConfiguration.types.BatteryAlarmMask: st.zigbee.data_types.Bitmap8
--- @alias BatteryAlarmMask
---
--- @field public byte_length number 1
--- @field public BATTERY_VOLTAGE_TOO_LOW number 1
--- @field public BATTERY_ALARM1 number 2
--- @field public BATTERY_ALARM2 number 4
--- @field public BATTERY_ALARM3 number 8
local BatteryAlarmMask = {}
local new_mt = BitmapABC.new_mt({NAME = "BatteryAlarmMask", ID = data_types.name_to_id_map["Bitmap8"]}, 1)
new_mt.__index.BASE_MASK               = 0xFF
new_mt.__index.BATTERY_VOLTAGE_TOO_LOW = 0x01
new_mt.__index.BATTERY_ALARM1          = 0x02
new_mt.__index.BATTERY_ALARM2          = 0x04
new_mt.__index.BATTERY_ALARM3          = 0x08

--- @function BatteryAlarmMask:is_battery_voltage_too_low_set
--- @return boolean True if the value of BATTERY_VOLTAGE_TOO_LOW is non-zero
new_mt.__index.is_battery_voltage_too_low_set = function(self)
  return (self.value & self.BATTERY_VOLTAGE_TOO_LOW) ~= 0
end
 
--- @function BatteryAlarmMask:set_battery_voltage_too_low
--- Set the value of the bit in the BATTERY_VOLTAGE_TOO_LOW field to 1
new_mt.__index.set_battery_voltage_too_low = function(self)
  self.value = self.value | self.BATTERY_VOLTAGE_TOO_LOW
end

--- @function BatteryAlarmMask:unset_battery_voltage_too_low
--- Set the value of the bits in the BATTERY_VOLTAGE_TOO_LOW field to 0
new_mt.__index.unset_battery_voltage_too_low = function(self)
  self.value = self.value & (~self.BATTERY_VOLTAGE_TOO_LOW & self.BASE_MASK)
end

--- @function BatteryAlarmMask:is_battery_alarm1_set
--- @return boolean True if the value of BATTERY_ALARM1 is non-zero
new_mt.__index.is_battery_alarm1_set = function(self)
  return (self.value & self.BATTERY_ALARM1) ~= 0
end
 
--- @function BatteryAlarmMask:set_battery_alarm1
--- Set the value of the bit in the BATTERY_ALARM1 field to 1
new_mt.__index.set_battery_alarm1 = function(self)
  self.value = self.value | self.BATTERY_ALARM1
end

--- @function BatteryAlarmMask:unset_battery_alarm1
--- Set the value of the bits in the BATTERY_ALARM1 field to 0
new_mt.__index.unset_battery_alarm1 = function(self)
  self.value = self.value & (~self.BATTERY_ALARM1 & self.BASE_MASK)
end

--- @function BatteryAlarmMask:is_battery_alarm2_set
--- @return boolean True if the value of BATTERY_ALARM2 is non-zero
new_mt.__index.is_battery_alarm2_set = function(self)
  return (self.value & self.BATTERY_ALARM2) ~= 0
end
 
--- @function BatteryAlarmMask:set_battery_alarm2
--- Set the value of the bit in the BATTERY_ALARM2 field to 1
new_mt.__index.set_battery_alarm2 = function(self)
  self.value = self.value | self.BATTERY_ALARM2
end

--- @function BatteryAlarmMask:unset_battery_alarm2
--- Set the value of the bits in the BATTERY_ALARM2 field to 0
new_mt.__index.unset_battery_alarm2 = function(self)
  self.value = self.value & (~self.BATTERY_ALARM2 & self.BASE_MASK)
end

--- @function BatteryAlarmMask:is_battery_alarm3_set
--- @return boolean True if the value of BATTERY_ALARM3 is non-zero
new_mt.__index.is_battery_alarm3_set = function(self)
  return (self.value & self.BATTERY_ALARM3) ~= 0
end
 
--- @function BatteryAlarmMask:set_battery_alarm3
--- Set the value of the bit in the BATTERY_ALARM3 field to 1
new_mt.__index.set_battery_alarm3 = function(self)
  self.value = self.value | self.BATTERY_ALARM3
end

--- @function BatteryAlarmMask:unset_battery_alarm3
--- Set the value of the bits in the BATTERY_ALARM3 field to 0
new_mt.__index.unset_battery_alarm3 = function(self)
  self.value = self.value & (~self.BATTERY_ALARM3 & self.BASE_MASK)
end

setmetatable(BatteryAlarmMask, new_mt)
return BatteryAlarmMask
