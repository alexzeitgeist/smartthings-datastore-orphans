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

--- @class st.matter.clusters.WindowCovering.types.SafetyStatus
--- @alias SafetyStatus
---
--- @field public REMOTE_LOCKOUT number 1
--- @field public TAMPER_DETECTION number 2
--- @field public FAILED_COMMUNICATION number 4
--- @field public POSITION_FAILURE number 8
--- @field public THERMAL_PROTECTION number 16
--- @field public OBSTACLE_DETECTED number 32
--- @field public POWER number 64
--- @field public STOP_INPUT number 128
--- @field public MOTOR_JAMMED number 256
--- @field public HARDWARE_FAILURE number 512
--- @field public MANUAL_OPERATION number 1024
--- @field public PROTECTION number 2048

local SafetyStatus = {}
local new_mt = UintABC.new_mt({NAME = "SafetyStatus", ID = data_types.name_to_id_map["Uint16"]}, 2)

SafetyStatus.BASE_MASK = 0xFFFF
SafetyStatus.REMOTE_LOCKOUT = 0x0001
SafetyStatus.TAMPER_DETECTION = 0x0002
SafetyStatus.FAILED_COMMUNICATION = 0x0004
SafetyStatus.POSITION_FAILURE = 0x0008
SafetyStatus.THERMAL_PROTECTION = 0x0010
SafetyStatus.OBSTACLE_DETECTED = 0x0020
SafetyStatus.POWER = 0x0040
SafetyStatus.STOP_INPUT = 0x0080
SafetyStatus.MOTOR_JAMMED = 0x0100
SafetyStatus.HARDWARE_FAILURE = 0x0200
SafetyStatus.MANUAL_OPERATION = 0x0400
SafetyStatus.PROTECTION = 0x0800

SafetyStatus.mask_fields = {
  BASE_MASK = 0xFFFF,
  REMOTE_LOCKOUT = 0x0001,
  TAMPER_DETECTION = 0x0002,
  FAILED_COMMUNICATION = 0x0004,
  POSITION_FAILURE = 0x0008,
  THERMAL_PROTECTION = 0x0010,
  OBSTACLE_DETECTED = 0x0020,
  POWER = 0x0040,
  STOP_INPUT = 0x0080,
  MOTOR_JAMMED = 0x0100,
  HARDWARE_FAILURE = 0x0200,
  MANUAL_OPERATION = 0x0400,
  PROTECTION = 0x0800,
}

--- @function SafetyStatus:is_remote_lockout_set
--- @return boolean True if the value of REMOTE_LOCKOUT is non-zero
SafetyStatus.is_remote_lockout_set = function(self)
  return (self.value & self.REMOTE_LOCKOUT) ~= 0
end

--- @function SafetyStatus:set_remote_lockout
--- Set the value of the bit in the REMOTE_LOCKOUT field to 1
SafetyStatus.set_remote_lockout = function(self)
  if self.value ~= nil then
    self.value = self.value | self.REMOTE_LOCKOUT
  else
    self.value = self.REMOTE_LOCKOUT
  end
end

--- @function SafetyStatus:unset_remote_lockout
--- Set the value of the bits in the REMOTE_LOCKOUT field to 0
SafetyStatus.unset_remote_lockout = function(self)
  self.value = self.value & (~self.REMOTE_LOCKOUT & self.BASE_MASK)
end
--- @function SafetyStatus:is_tamper_detection_set
--- @return boolean True if the value of TAMPER_DETECTION is non-zero
SafetyStatus.is_tamper_detection_set = function(self)
  return (self.value & self.TAMPER_DETECTION) ~= 0
end

--- @function SafetyStatus:set_tamper_detection
--- Set the value of the bit in the TAMPER_DETECTION field to 1
SafetyStatus.set_tamper_detection = function(self)
  if self.value ~= nil then
    self.value = self.value | self.TAMPER_DETECTION
  else
    self.value = self.TAMPER_DETECTION
  end
end

--- @function SafetyStatus:unset_tamper_detection
--- Set the value of the bits in the TAMPER_DETECTION field to 0
SafetyStatus.unset_tamper_detection = function(self)
  self.value = self.value & (~self.TAMPER_DETECTION & self.BASE_MASK)
end
--- @function SafetyStatus:is_failed_communication_set
--- @return boolean True if the value of FAILED_COMMUNICATION is non-zero
SafetyStatus.is_failed_communication_set = function(self)
  return (self.value & self.FAILED_COMMUNICATION) ~= 0
end

--- @function SafetyStatus:set_failed_communication
--- Set the value of the bit in the FAILED_COMMUNICATION field to 1
SafetyStatus.set_failed_communication = function(self)
  if self.value ~= nil then
    self.value = self.value | self.FAILED_COMMUNICATION
  else
    self.value = self.FAILED_COMMUNICATION
  end
end

--- @function SafetyStatus:unset_failed_communication
--- Set the value of the bits in the FAILED_COMMUNICATION field to 0
SafetyStatus.unset_failed_communication = function(self)
  self.value = self.value & (~self.FAILED_COMMUNICATION & self.BASE_MASK)
end
--- @function SafetyStatus:is_position_failure_set
--- @return boolean True if the value of POSITION_FAILURE is non-zero
SafetyStatus.is_position_failure_set = function(self)
  return (self.value & self.POSITION_FAILURE) ~= 0
end

--- @function SafetyStatus:set_position_failure
--- Set the value of the bit in the POSITION_FAILURE field to 1
SafetyStatus.set_position_failure = function(self)
  if self.value ~= nil then
    self.value = self.value | self.POSITION_FAILURE
  else
    self.value = self.POSITION_FAILURE
  end
end

--- @function SafetyStatus:unset_position_failure
--- Set the value of the bits in the POSITION_FAILURE field to 0
SafetyStatus.unset_position_failure = function(self)
  self.value = self.value & (~self.POSITION_FAILURE & self.BASE_MASK)
end
--- @function SafetyStatus:is_thermal_protection_set
--- @return boolean True if the value of THERMAL_PROTECTION is non-zero
SafetyStatus.is_thermal_protection_set = function(self)
  return (self.value & self.THERMAL_PROTECTION) ~= 0
end

--- @function SafetyStatus:set_thermal_protection
--- Set the value of the bit in the THERMAL_PROTECTION field to 1
SafetyStatus.set_thermal_protection = function(self)
  if self.value ~= nil then
    self.value = self.value | self.THERMAL_PROTECTION
  else
    self.value = self.THERMAL_PROTECTION
  end
end

--- @function SafetyStatus:unset_thermal_protection
--- Set the value of the bits in the THERMAL_PROTECTION field to 0
SafetyStatus.unset_thermal_protection = function(self)
  self.value = self.value & (~self.THERMAL_PROTECTION & self.BASE_MASK)
end
--- @function SafetyStatus:is_obstacle_detected_set
--- @return boolean True if the value of OBSTACLE_DETECTED is non-zero
SafetyStatus.is_obstacle_detected_set = function(self)
  return (self.value & self.OBSTACLE_DETECTED) ~= 0
end

--- @function SafetyStatus:set_obstacle_detected
--- Set the value of the bit in the OBSTACLE_DETECTED field to 1
SafetyStatus.set_obstacle_detected = function(self)
  if self.value ~= nil then
    self.value = self.value | self.OBSTACLE_DETECTED
  else
    self.value = self.OBSTACLE_DETECTED
  end
end

--- @function SafetyStatus:unset_obstacle_detected
--- Set the value of the bits in the OBSTACLE_DETECTED field to 0
SafetyStatus.unset_obstacle_detected = function(self)
  self.value = self.value & (~self.OBSTACLE_DETECTED & self.BASE_MASK)
end
--- @function SafetyStatus:is_power_set
--- @return boolean True if the value of POWER is non-zero
SafetyStatus.is_power_set = function(self)
  return (self.value & self.POWER) ~= 0
end

--- @function SafetyStatus:set_power
--- Set the value of the bit in the POWER field to 1
SafetyStatus.set_power = function(self)
  if self.value ~= nil then
    self.value = self.value | self.POWER
  else
    self.value = self.POWER
  end
end

--- @function SafetyStatus:unset_power
--- Set the value of the bits in the POWER field to 0
SafetyStatus.unset_power = function(self)
  self.value = self.value & (~self.POWER & self.BASE_MASK)
end
--- @function SafetyStatus:is_stop_input_set
--- @return boolean True if the value of STOP_INPUT is non-zero
SafetyStatus.is_stop_input_set = function(self)
  return (self.value & self.STOP_INPUT) ~= 0
end

--- @function SafetyStatus:set_stop_input
--- Set the value of the bit in the STOP_INPUT field to 1
SafetyStatus.set_stop_input = function(self)
  if self.value ~= nil then
    self.value = self.value | self.STOP_INPUT
  else
    self.value = self.STOP_INPUT
  end
end

--- @function SafetyStatus:unset_stop_input
--- Set the value of the bits in the STOP_INPUT field to 0
SafetyStatus.unset_stop_input = function(self)
  self.value = self.value & (~self.STOP_INPUT & self.BASE_MASK)
end
--- @function SafetyStatus:is_motor_jammed_set
--- @return boolean True if the value of MOTOR_JAMMED is non-zero
SafetyStatus.is_motor_jammed_set = function(self)
  return (self.value & self.MOTOR_JAMMED) ~= 0
end

--- @function SafetyStatus:set_motor_jammed
--- Set the value of the bit in the MOTOR_JAMMED field to 1
SafetyStatus.set_motor_jammed = function(self)
  if self.value ~= nil then
    self.value = self.value | self.MOTOR_JAMMED
  else
    self.value = self.MOTOR_JAMMED
  end
end

--- @function SafetyStatus:unset_motor_jammed
--- Set the value of the bits in the MOTOR_JAMMED field to 0
SafetyStatus.unset_motor_jammed = function(self)
  self.value = self.value & (~self.MOTOR_JAMMED & self.BASE_MASK)
end
--- @function SafetyStatus:is_hardware_failure_set
--- @return boolean True if the value of HARDWARE_FAILURE is non-zero
SafetyStatus.is_hardware_failure_set = function(self)
  return (self.value & self.HARDWARE_FAILURE) ~= 0
end

--- @function SafetyStatus:set_hardware_failure
--- Set the value of the bit in the HARDWARE_FAILURE field to 1
SafetyStatus.set_hardware_failure = function(self)
  if self.value ~= nil then
    self.value = self.value | self.HARDWARE_FAILURE
  else
    self.value = self.HARDWARE_FAILURE
  end
end

--- @function SafetyStatus:unset_hardware_failure
--- Set the value of the bits in the HARDWARE_FAILURE field to 0
SafetyStatus.unset_hardware_failure = function(self)
  self.value = self.value & (~self.HARDWARE_FAILURE & self.BASE_MASK)
end
--- @function SafetyStatus:is_manual_operation_set
--- @return boolean True if the value of MANUAL_OPERATION is non-zero
SafetyStatus.is_manual_operation_set = function(self)
  return (self.value & self.MANUAL_OPERATION) ~= 0
end

--- @function SafetyStatus:set_manual_operation
--- Set the value of the bit in the MANUAL_OPERATION field to 1
SafetyStatus.set_manual_operation = function(self)
  if self.value ~= nil then
    self.value = self.value | self.MANUAL_OPERATION
  else
    self.value = self.MANUAL_OPERATION
  end
end

--- @function SafetyStatus:unset_manual_operation
--- Set the value of the bits in the MANUAL_OPERATION field to 0
SafetyStatus.unset_manual_operation = function(self)
  self.value = self.value & (~self.MANUAL_OPERATION & self.BASE_MASK)
end
--- @function SafetyStatus:is_protection_set
--- @return boolean True if the value of PROTECTION is non-zero
SafetyStatus.is_protection_set = function(self)
  return (self.value & self.PROTECTION) ~= 0
end

--- @function SafetyStatus:set_protection
--- Set the value of the bit in the PROTECTION field to 1
SafetyStatus.set_protection = function(self)
  if self.value ~= nil then
    self.value = self.value | self.PROTECTION
  else
    self.value = self.PROTECTION
  end
end

--- @function SafetyStatus:unset_protection
--- Set the value of the bits in the PROTECTION field to 0
SafetyStatus.unset_protection = function(self)
  self.value = self.value & (~self.PROTECTION & self.BASE_MASK)
end


SafetyStatus.mask_methods = {
  is_remote_lockout_set = SafetyStatus.is_remote_lockout_set,
  set_remote_lockout = SafetyStatus.set_remote_lockout,
  unset_remote_lockout = SafetyStatus.unset_remote_lockout,
  is_tamper_detection_set = SafetyStatus.is_tamper_detection_set,
  set_tamper_detection = SafetyStatus.set_tamper_detection,
  unset_tamper_detection = SafetyStatus.unset_tamper_detection,
  is_failed_communication_set = SafetyStatus.is_failed_communication_set,
  set_failed_communication = SafetyStatus.set_failed_communication,
  unset_failed_communication = SafetyStatus.unset_failed_communication,
  is_position_failure_set = SafetyStatus.is_position_failure_set,
  set_position_failure = SafetyStatus.set_position_failure,
  unset_position_failure = SafetyStatus.unset_position_failure,
  is_thermal_protection_set = SafetyStatus.is_thermal_protection_set,
  set_thermal_protection = SafetyStatus.set_thermal_protection,
  unset_thermal_protection = SafetyStatus.unset_thermal_protection,
  is_obstacle_detected_set = SafetyStatus.is_obstacle_detected_set,
  set_obstacle_detected = SafetyStatus.set_obstacle_detected,
  unset_obstacle_detected = SafetyStatus.unset_obstacle_detected,
  is_power_set = SafetyStatus.is_power_set,
  set_power = SafetyStatus.set_power,
  unset_power = SafetyStatus.unset_power,
  is_stop_input_set = SafetyStatus.is_stop_input_set,
  set_stop_input = SafetyStatus.set_stop_input,
  unset_stop_input = SafetyStatus.unset_stop_input,
  is_motor_jammed_set = SafetyStatus.is_motor_jammed_set,
  set_motor_jammed = SafetyStatus.set_motor_jammed,
  unset_motor_jammed = SafetyStatus.unset_motor_jammed,
  is_hardware_failure_set = SafetyStatus.is_hardware_failure_set,
  set_hardware_failure = SafetyStatus.set_hardware_failure,
  unset_hardware_failure = SafetyStatus.unset_hardware_failure,
  is_manual_operation_set = SafetyStatus.is_manual_operation_set,
  set_manual_operation = SafetyStatus.set_manual_operation,
  unset_manual_operation = SafetyStatus.unset_manual_operation,
  is_protection_set = SafetyStatus.is_protection_set,
  set_protection = SafetyStatus.set_protection,
  unset_protection = SafetyStatus.unset_protection,
}

SafetyStatus.augment_type = function(cls, val)
  setmetatable(val, new_mt)
end

setmetatable(SafetyStatus, new_mt)

local has_aliases, aliases = pcall(require, "st.matter.clusters.aliases.WindowCovering.types.SafetyStatus")
if has_aliases then
  aliases:add_to_class(SafetyStatus)
end

return SafetyStatus

