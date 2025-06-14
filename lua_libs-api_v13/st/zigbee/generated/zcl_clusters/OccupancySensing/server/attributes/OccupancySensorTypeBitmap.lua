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

--- @class st.zigbee.zcl.clusters.OccupancySensing.OccupancySensorTypeBitmap
--- @alias OccupancySensorTypeBitmap
---
--- @field public ID number 0x0002 the ID of this attribute
--- @field public NAME string "OccupancySensorTypeBitmap" the name of this attribute
--- @field public data_type st.zigbee.data_types.Bitmap8 the data type of this attribute
--- @field public PIR number 1
--- @field public ULTRASONIC number 2
--- @field public PHYSICAL_CONTACT number 4
local OccupancySensorTypeBitmap = {
  ID = 0x0002,
  NAME = "OccupancySensorTypeBitmap",
  base_type = data_types.Bitmap8,
}

OccupancySensorTypeBitmap.BASE_MASK        = 0xFF
OccupancySensorTypeBitmap.PIR              = 0x01
OccupancySensorTypeBitmap.ULTRASONIC       = 0x02
OccupancySensorTypeBitmap.PHYSICAL_CONTACT = 0x04


OccupancySensorTypeBitmap.mask_fields = {
  BASE_MASK = 0xFF,
  PIR = 0x01,
  ULTRASONIC = 0x02,
  PHYSICAL_CONTACT = 0x04,
}


--- @function OccupancySensorTypeBitmap:is_pir_set
--- @return boolean True if the value of PIR is non-zero
OccupancySensorTypeBitmap.is_pir_set = function(self)
  return (self.value & self.PIR) ~= 0
end
 
--- @function OccupancySensorTypeBitmap:set_pir
--- Set the value of the bit in the PIR field to 1
OccupancySensorTypeBitmap.set_pir = function(self)
  self.value = self.value | self.PIR
end

--- @function OccupancySensorTypeBitmap:unset_pir
--- Set the value of the bits in the PIR field to 0
OccupancySensorTypeBitmap.unset_pir = function(self)
  self.value = self.value & (~self.PIR & self.BASE_MASK)
end

--- @function OccupancySensorTypeBitmap:is_ultrasonic_set
--- @return boolean True if the value of ULTRASONIC is non-zero
OccupancySensorTypeBitmap.is_ultrasonic_set = function(self)
  return (self.value & self.ULTRASONIC) ~= 0
end
 
--- @function OccupancySensorTypeBitmap:set_ultrasonic
--- Set the value of the bit in the ULTRASONIC field to 1
OccupancySensorTypeBitmap.set_ultrasonic = function(self)
  self.value = self.value | self.ULTRASONIC
end

--- @function OccupancySensorTypeBitmap:unset_ultrasonic
--- Set the value of the bits in the ULTRASONIC field to 0
OccupancySensorTypeBitmap.unset_ultrasonic = function(self)
  self.value = self.value & (~self.ULTRASONIC & self.BASE_MASK)
end

--- @function OccupancySensorTypeBitmap:is_physical_contact_set
--- @return boolean True if the value of PHYSICAL_CONTACT is non-zero
OccupancySensorTypeBitmap.is_physical_contact_set = function(self)
  return (self.value & self.PHYSICAL_CONTACT) ~= 0
end
 
--- @function OccupancySensorTypeBitmap:set_physical_contact
--- Set the value of the bit in the PHYSICAL_CONTACT field to 1
OccupancySensorTypeBitmap.set_physical_contact = function(self)
  self.value = self.value | self.PHYSICAL_CONTACT
end

--- @function OccupancySensorTypeBitmap:unset_physical_contact
--- Set the value of the bits in the PHYSICAL_CONTACT field to 0
OccupancySensorTypeBitmap.unset_physical_contact = function(self)
  self.value = self.value & (~self.PHYSICAL_CONTACT & self.BASE_MASK)
end


OccupancySensorTypeBitmap.mask_methods = {
  is_pir_set = OccupancySensorTypeBitmap.is_pir_set,
  set_pir = OccupancySensorTypeBitmap.set_pir,
  unset_pir = OccupancySensorTypeBitmap.unset_pir,
  is_ultrasonic_set = OccupancySensorTypeBitmap.is_ultrasonic_set,
  set_ultrasonic = OccupancySensorTypeBitmap.set_ultrasonic,
  unset_ultrasonic = OccupancySensorTypeBitmap.unset_ultrasonic,
  is_physical_contact_set = OccupancySensorTypeBitmap.is_physical_contact_set,
  set_physical_contact = OccupancySensorTypeBitmap.set_physical_contact,
  unset_physical_contact = OccupancySensorTypeBitmap.unset_physical_contact,
}

--- Add additional functionality to the base type object
---
--- @param base_type_obj st.zigbee.data_types.Bitmap8 the base data type object to add functionality to
function OccupancySensorTypeBitmap:augment_type(base_type_obj)
  cluster_base.attribute_augment_type_bitmap(self, base_type_obj)
end

function OccupancySensorTypeBitmap.pretty_print(value_obj)
  local zb_utils = require "st.zigbee.utils"
  local pattern = ">I" .. value_obj.byte_length
  return string.format("%s: %s[0x%s]", value_obj.field_name or value_obj.NAME, OccupancySensorTypeBitmap.NAME, zb_utils.pretty_print_hex_str(string.pack(pattern, value_obj.value)))
end

--- @function OccupancySensorTypeBitmap:build_test_attr_report
---
--- Build a Rx Zigbee message as if a device reported this attribute
--- @param device st.zigbee.Device
--- @param data st.zigbee.data_types.Bitmap8 the attribute value
--- @return st.zigbee.ZigbeeMessageRx containing an AttributeReport body
OccupancySensorTypeBitmap.build_test_attr_report = cluster_base.build_test_attr_report

--- @function OccupancySensorTypeBitmap:build_test_read_attr_response
---
--- Build a Rx Zigbee message as if a device sent a read response for this attribute
--- @param device st.zigbee.Device
--- @param data st.zigbee.data_types.Bitmap8 the attribute value
--- @return st.zigbee.ZigbeeMessageRx containing an ReadAttributeResponse body
OccupancySensorTypeBitmap.build_test_read_attr_response = cluster_base.build_test_read_attr_response

--- Create a Bitmap8 object of this attribute with any additional features provided for the attribute
---
--- This is also usable with the OccupancySensorTypeBitmap(...) syntax
---
--- @vararg vararg the values needed to construct a Bitmap8
--- @return st.zigbee.data_types.Bitmap8
function OccupancySensorTypeBitmap:new_value(...)
    local o = self.base_type(table.unpack({...}))
    self:augment_type(o)
    return o
end

--- Construct a st.zigbee.ZigbeeMessageTx to read this attribute from a device
---
--- @param device st.zigbee.Device
--- @return st.zigbee.ZigbeeMessageTx containing a ReadAttribute body
function OccupancySensorTypeBitmap:read(device)
    return cluster_base.read_attribute(device, data_types.ClusterId(self._cluster.ID), data_types.AttributeId(self.ID))
end

--- Construct a st.zigbee.ZigbeeMessageTx to configure this attribute for reporting on a device
---
--- @param device st.zigbee.Device
--- @param min_rep_int number|st.zigbee.data_types.Uint16 the minimum interval allowed between reports of this attribute
--- @param max_rep_int number|st.zigbee.data_types.Uint16 the maximum interval allowed between reports of this attribute
--- @return st.zigbee.ZigbeeMessageTx containing a ConfigureReporting body
function OccupancySensorTypeBitmap:configure_reporting(device, min_rep_int, max_rep_int)
  local min = data_types.validate_or_build_type(min_rep_int, data_types.Uint16, "minimum_reporting_interval")
  local max = data_types.validate_or_build_type(max_rep_int, data_types.Uint16, "maximum_reporting_interval")
  local rep_change = nil
  return cluster_base.configure_reporting(device, data_types.ClusterId(self._cluster.ID), data_types.AttributeId(self.ID), data_types.ZigbeeDataType(self.base_type.ID), min, max, rep_change)
end

function OccupancySensorTypeBitmap:set_parent_cluster(cluster)
  self._cluster = cluster
  return self
end

setmetatable(OccupancySensorTypeBitmap, {__call = OccupancySensorTypeBitmap.new_value})
return OccupancySensorTypeBitmap
