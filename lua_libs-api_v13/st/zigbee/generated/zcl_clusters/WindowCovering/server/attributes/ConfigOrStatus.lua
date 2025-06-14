local cluster_base = require "st.zigbee.cluster_base"
local data_types = require "st.zigbee.data_types"

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

--- @class st.zigbee.zcl.clusters.WindowCovering.ConfigOrStatus
--- @alias ConfigOrStatus
---
--- @field public ID number 0x0007 the ID of this attribute
--- @field public NAME string "ConfigOrStatus" the name of this attribute
--- @field public data_type st.zigbee.data_types.Bitmap8 the data type of this attribute
--- @field public OPERATIONAL number 1
--- @field public ONLINE number 2
--- @field public OPEN_AND_UP_COMMANDS_REVERSED number 4
--- @field public LIFT_CLOSED_LOOP number 8
--- @field public TILT_CLOSED_LOOP number 16
--- @field public LIFT_ENCODER_CONTROLLED number 32
--- @field public TILT_ENCODER_CONTROLLED number 64
local ConfigOrStatus = {
  ID = 0x0007,
  NAME = "ConfigOrStatus",
  base_type = data_types.Bitmap8,
}

ConfigOrStatus.BASE_MASK                     = 0xFF
ConfigOrStatus.OPERATIONAL                   = 0x01
ConfigOrStatus.ONLINE                        = 0x02
ConfigOrStatus.OPEN_AND_UP_COMMANDS_REVERSED = 0x04
ConfigOrStatus.LIFT_CLOSED_LOOP              = 0x08
ConfigOrStatus.TILT_CLOSED_LOOP              = 0x10
ConfigOrStatus.LIFT_ENCODER_CONTROLLED       = 0x20
ConfigOrStatus.TILT_ENCODER_CONTROLLED       = 0x40


ConfigOrStatus.mask_fields = {
  BASE_MASK = 0xFF,
  OPERATIONAL = 0x01,
  ONLINE = 0x02,
  OPEN_AND_UP_COMMANDS_REVERSED = 0x04,
  LIFT_CLOSED_LOOP = 0x08,
  TILT_CLOSED_LOOP = 0x10,
  LIFT_ENCODER_CONTROLLED = 0x20,
  TILT_ENCODER_CONTROLLED = 0x40,
}


--- @function ConfigOrStatus:is_operational_set
--- @return boolean True if the value of OPERATIONAL is non-zero
ConfigOrStatus.is_operational_set = function(self)
  return (self.value & self.OPERATIONAL) ~= 0
end
 
--- @function ConfigOrStatus:set_operational
--- Set the value of the bit in the OPERATIONAL field to 1
ConfigOrStatus.set_operational = function(self)
  self.value = self.value | self.OPERATIONAL
end

--- @function ConfigOrStatus:unset_operational
--- Set the value of the bits in the OPERATIONAL field to 0
ConfigOrStatus.unset_operational = function(self)
  self.value = self.value & (~self.OPERATIONAL & self.BASE_MASK)
end

--- @function ConfigOrStatus:is_online_set
--- @return boolean True if the value of ONLINE is non-zero
ConfigOrStatus.is_online_set = function(self)
  return (self.value & self.ONLINE) ~= 0
end
 
--- @function ConfigOrStatus:set_online
--- Set the value of the bit in the ONLINE field to 1
ConfigOrStatus.set_online = function(self)
  self.value = self.value | self.ONLINE
end

--- @function ConfigOrStatus:unset_online
--- Set the value of the bits in the ONLINE field to 0
ConfigOrStatus.unset_online = function(self)
  self.value = self.value & (~self.ONLINE & self.BASE_MASK)
end

--- @function ConfigOrStatus:is_open_and_up_commands_reversed_set
--- @return boolean True if the value of OPEN_AND_UP_COMMANDS_REVERSED is non-zero
ConfigOrStatus.is_open_and_up_commands_reversed_set = function(self)
  return (self.value & self.OPEN_AND_UP_COMMANDS_REVERSED) ~= 0
end
 
--- @function ConfigOrStatus:set_open_and_up_commands_reversed
--- Set the value of the bit in the OPEN_AND_UP_COMMANDS_REVERSED field to 1
ConfigOrStatus.set_open_and_up_commands_reversed = function(self)
  self.value = self.value | self.OPEN_AND_UP_COMMANDS_REVERSED
end

--- @function ConfigOrStatus:unset_open_and_up_commands_reversed
--- Set the value of the bits in the OPEN_AND_UP_COMMANDS_REVERSED field to 0
ConfigOrStatus.unset_open_and_up_commands_reversed = function(self)
  self.value = self.value & (~self.OPEN_AND_UP_COMMANDS_REVERSED & self.BASE_MASK)
end

--- @function ConfigOrStatus:is_lift_closed_loop_set
--- @return boolean True if the value of LIFT_CLOSED_LOOP is non-zero
ConfigOrStatus.is_lift_closed_loop_set = function(self)
  return (self.value & self.LIFT_CLOSED_LOOP) ~= 0
end
 
--- @function ConfigOrStatus:set_lift_closed_loop
--- Set the value of the bit in the LIFT_CLOSED_LOOP field to 1
ConfigOrStatus.set_lift_closed_loop = function(self)
  self.value = self.value | self.LIFT_CLOSED_LOOP
end

--- @function ConfigOrStatus:unset_lift_closed_loop
--- Set the value of the bits in the LIFT_CLOSED_LOOP field to 0
ConfigOrStatus.unset_lift_closed_loop = function(self)
  self.value = self.value & (~self.LIFT_CLOSED_LOOP & self.BASE_MASK)
end

--- @function ConfigOrStatus:is_tilt_closed_loop_set
--- @return boolean True if the value of TILT_CLOSED_LOOP is non-zero
ConfigOrStatus.is_tilt_closed_loop_set = function(self)
  return (self.value & self.TILT_CLOSED_LOOP) ~= 0
end
 
--- @function ConfigOrStatus:set_tilt_closed_loop
--- Set the value of the bit in the TILT_CLOSED_LOOP field to 1
ConfigOrStatus.set_tilt_closed_loop = function(self)
  self.value = self.value | self.TILT_CLOSED_LOOP
end

--- @function ConfigOrStatus:unset_tilt_closed_loop
--- Set the value of the bits in the TILT_CLOSED_LOOP field to 0
ConfigOrStatus.unset_tilt_closed_loop = function(self)
  self.value = self.value & (~self.TILT_CLOSED_LOOP & self.BASE_MASK)
end

--- @function ConfigOrStatus:is_lift_encoder_controlled_set
--- @return boolean True if the value of LIFT_ENCODER_CONTROLLED is non-zero
ConfigOrStatus.is_lift_encoder_controlled_set = function(self)
  return (self.value & self.LIFT_ENCODER_CONTROLLED) ~= 0
end
 
--- @function ConfigOrStatus:set_lift_encoder_controlled
--- Set the value of the bit in the LIFT_ENCODER_CONTROLLED field to 1
ConfigOrStatus.set_lift_encoder_controlled = function(self)
  self.value = self.value | self.LIFT_ENCODER_CONTROLLED
end

--- @function ConfigOrStatus:unset_lift_encoder_controlled
--- Set the value of the bits in the LIFT_ENCODER_CONTROLLED field to 0
ConfigOrStatus.unset_lift_encoder_controlled = function(self)
  self.value = self.value & (~self.LIFT_ENCODER_CONTROLLED & self.BASE_MASK)
end

--- @function ConfigOrStatus:is_tilt_encoder_controlled_set
--- @return boolean True if the value of TILT_ENCODER_CONTROLLED is non-zero
ConfigOrStatus.is_tilt_encoder_controlled_set = function(self)
  return (self.value & self.TILT_ENCODER_CONTROLLED) ~= 0
end
 
--- @function ConfigOrStatus:set_tilt_encoder_controlled
--- Set the value of the bit in the TILT_ENCODER_CONTROLLED field to 1
ConfigOrStatus.set_tilt_encoder_controlled = function(self)
  self.value = self.value | self.TILT_ENCODER_CONTROLLED
end

--- @function ConfigOrStatus:unset_tilt_encoder_controlled
--- Set the value of the bits in the TILT_ENCODER_CONTROLLED field to 0
ConfigOrStatus.unset_tilt_encoder_controlled = function(self)
  self.value = self.value & (~self.TILT_ENCODER_CONTROLLED & self.BASE_MASK)
end


ConfigOrStatus.mask_methods = {
  is_operational_set = ConfigOrStatus.is_operational_set,
  set_operational = ConfigOrStatus.set_operational,
  unset_operational = ConfigOrStatus.unset_operational,
  is_online_set = ConfigOrStatus.is_online_set,
  set_online = ConfigOrStatus.set_online,
  unset_online = ConfigOrStatus.unset_online,
  is_open_and_up_commands_reversed_set = ConfigOrStatus.is_open_and_up_commands_reversed_set,
  set_open_and_up_commands_reversed = ConfigOrStatus.set_open_and_up_commands_reversed,
  unset_open_and_up_commands_reversed = ConfigOrStatus.unset_open_and_up_commands_reversed,
  is_lift_closed_loop_set = ConfigOrStatus.is_lift_closed_loop_set,
  set_lift_closed_loop = ConfigOrStatus.set_lift_closed_loop,
  unset_lift_closed_loop = ConfigOrStatus.unset_lift_closed_loop,
  is_tilt_closed_loop_set = ConfigOrStatus.is_tilt_closed_loop_set,
  set_tilt_closed_loop = ConfigOrStatus.set_tilt_closed_loop,
  unset_tilt_closed_loop = ConfigOrStatus.unset_tilt_closed_loop,
  is_lift_encoder_controlled_set = ConfigOrStatus.is_lift_encoder_controlled_set,
  set_lift_encoder_controlled = ConfigOrStatus.set_lift_encoder_controlled,
  unset_lift_encoder_controlled = ConfigOrStatus.unset_lift_encoder_controlled,
  is_tilt_encoder_controlled_set = ConfigOrStatus.is_tilt_encoder_controlled_set,
  set_tilt_encoder_controlled = ConfigOrStatus.set_tilt_encoder_controlled,
  unset_tilt_encoder_controlled = ConfigOrStatus.unset_tilt_encoder_controlled,
}

--- Add additional functionality to the base type object
---
--- @param base_type_obj st.zigbee.data_types.Bitmap8 the base data type object to add functionality to
function ConfigOrStatus:augment_type(base_type_obj)
  cluster_base.attribute_augment_type_bitmap(self, base_type_obj)
end

function ConfigOrStatus.pretty_print(value_obj)
  local zb_utils = require "st.zigbee.utils"
  local pattern = ">I" .. value_obj.byte_length
  return string.format("%s: %s[0x%s]", value_obj.field_name or value_obj.NAME, ConfigOrStatus.NAME, zb_utils.pretty_print_hex_str(string.pack(pattern, value_obj.value)))
end

--- @function ConfigOrStatus:build_test_attr_report
---
--- Build a Rx Zigbee message as if a device reported this attribute
--- @param device st.zigbee.Device
--- @param data st.zigbee.data_types.Bitmap8 the attribute value
--- @return st.zigbee.ZigbeeMessageRx containing an AttributeReport body
ConfigOrStatus.build_test_attr_report = cluster_base.build_test_attr_report

--- @function ConfigOrStatus:build_test_read_attr_response
---
--- Build a Rx Zigbee message as if a device sent a read response for this attribute
--- @param device st.zigbee.Device
--- @param data st.zigbee.data_types.Bitmap8 the attribute value
--- @return st.zigbee.ZigbeeMessageRx containing an ReadAttributeResponse body
ConfigOrStatus.build_test_read_attr_response = cluster_base.build_test_read_attr_response

--- Create a Bitmap8 object of this attribute with any additional features provided for the attribute
---
--- This is also usable with the ConfigOrStatus(...) syntax
---
--- @vararg vararg the values needed to construct a Bitmap8
--- @return st.zigbee.data_types.Bitmap8
function ConfigOrStatus:new_value(...)
    local o = self.base_type(table.unpack({...}))
    self:augment_type(o)
    return o
end

--- Construct a st.zigbee.ZigbeeMessageTx to read this attribute from a device
---
--- @param device st.zigbee.Device
--- @return st.zigbee.ZigbeeMessageTx containing a ReadAttribute body
function ConfigOrStatus:read(device)
    return cluster_base.read_attribute(device, data_types.ClusterId(self._cluster.ID), data_types.AttributeId(self.ID))
end

--- Construct a st.zigbee.ZigbeeMessageTx to configure this attribute for reporting on a device
---
--- @param device st.zigbee.Device
--- @param min_rep_int number|st.zigbee.data_types.Uint16 the minimum interval allowed between reports of this attribute
--- @param max_rep_int number|st.zigbee.data_types.Uint16 the maximum interval allowed between reports of this attribute
--- @return st.zigbee.ZigbeeMessageTx containing a ConfigureReporting body
function ConfigOrStatus:configure_reporting(device, min_rep_int, max_rep_int)
  local min = data_types.validate_or_build_type(min_rep_int, data_types.Uint16, "minimum_reporting_interval")
  local max = data_types.validate_or_build_type(max_rep_int, data_types.Uint16, "maximum_reporting_interval")
  local rep_change = nil
  return cluster_base.configure_reporting(device, data_types.ClusterId(self._cluster.ID), data_types.AttributeId(self.ID), data_types.ZigbeeDataType(self.base_type.ID), min, max, rep_change)
end

function ConfigOrStatus:set_parent_cluster(cluster)
  self._cluster = cluster
  return self
end

setmetatable(ConfigOrStatus, {__call = ConfigOrStatus.new_value})
return ConfigOrStatus
