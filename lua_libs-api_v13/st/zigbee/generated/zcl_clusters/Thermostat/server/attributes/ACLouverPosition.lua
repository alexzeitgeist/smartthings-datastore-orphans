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

--- @class st.zigbee.zcl.clusters.Thermostat.ACLouverPosition
--- @alias ACLouverPosition
---
--- @field public ID number 0x0045 the ID of this attribute
--- @field public NAME string "ACLouverPosition" the name of this attribute
--- @field public data_type st.zigbee.data_types.Enum8 the data type of this attribute
--- @field public FULLY_CLOSED number 1
--- @field public FULLY_OPEN number 2
--- @field public QUARTER_OPEN number 3
--- @field public HALF_OPEN number 4
--- @field public THREE_QUARTERS_OPEN number 5
local ACLouverPosition = {
  ID = 0x0045,
  NAME = "ACLouverPosition",
  base_type = data_types.Enum8,
}

ACLouverPosition.FULLY_CLOSED        = 0x01
ACLouverPosition.FULLY_OPEN          = 0x02
ACLouverPosition.QUARTER_OPEN        = 0x03
ACLouverPosition.HALF_OPEN           = 0x04
ACLouverPosition.THREE_QUARTERS_OPEN = 0x05


ACLouverPosition.enum_fields = {
    [ACLouverPosition.FULLY_CLOSED]        = "FULLY_CLOSED",
    [ACLouverPosition.FULLY_OPEN]          = "FULLY_OPEN",
    [ACLouverPosition.QUARTER_OPEN]        = "QUARTER_OPEN",
    [ACLouverPosition.HALF_OPEN]           = "HALF_OPEN",
    [ACLouverPosition.THREE_QUARTERS_OPEN] = "THREE_QUARTERS_OPEN",
}

--- Add additional functionality to the base type object
---
--- @param base_type_obj st.zigbee.data_types.Enum8 the base data type object to add functionality to
function ACLouverPosition:augment_type(base_type_obj)
  cluster_base.attribute_augment_type_enum(self, base_type_obj)
end

function ACLouverPosition.pretty_print(value_obj)
  return string.format("%s: %s[%s]", value_obj.field_name or value_obj.NAME, ACLouverPosition.NAME, ACLouverPosition.enum_fields[value_obj.value])
end

--- @function ACLouverPosition:build_test_attr_report
---
--- Build a Rx Zigbee message as if a device reported this attribute
--- @param device st.zigbee.Device
--- @param data st.zigbee.data_types.Enum8 the attribute value
--- @return st.zigbee.ZigbeeMessageRx containing an AttributeReport body
ACLouverPosition.build_test_attr_report = cluster_base.build_test_attr_report

--- @function ACLouverPosition:build_test_read_attr_response
---
--- Build a Rx Zigbee message as if a device sent a read response for this attribute
--- @param device st.zigbee.Device
--- @param data st.zigbee.data_types.Enum8 the attribute value
--- @return st.zigbee.ZigbeeMessageRx containing an ReadAttributeResponse body
ACLouverPosition.build_test_read_attr_response = cluster_base.build_test_read_attr_response

--- Create a Enum8 object of this attribute with any additional features provided for the attribute
---
--- This is also usable with the ACLouverPosition(...) syntax
---
--- @vararg vararg the values needed to construct a Enum8
--- @return st.zigbee.data_types.Enum8
function ACLouverPosition:new_value(...)
    local o = self.base_type(table.unpack({...}))
    self:augment_type(o)
    return o
end

--- Construct a st.zigbee.ZigbeeMessageTx to read this attribute from a device
---
--- @param device st.zigbee.Device
--- @return st.zigbee.ZigbeeMessageTx containing a ReadAttribute body
function ACLouverPosition:read(device)
    return cluster_base.read_attribute(device, data_types.ClusterId(self._cluster.ID), data_types.AttributeId(self.ID))
end

--- Construct a st.zigbee.ZigbeeMessageTx to configure this attribute for reporting on a device
---
--- @param device st.zigbee.Device
--- @param min_rep_int number|st.zigbee.data_types.Uint16 the minimum interval allowed between reports of this attribute
--- @param max_rep_int number|st.zigbee.data_types.Uint16 the maximum interval allowed between reports of this attribute
--- @return st.zigbee.ZigbeeMessageTx containing a ConfigureReporting body
function ACLouverPosition:configure_reporting(device, min_rep_int, max_rep_int)
  local min = data_types.validate_or_build_type(min_rep_int, data_types.Uint16, "minimum_reporting_interval")
  local max = data_types.validate_or_build_type(max_rep_int, data_types.Uint16, "maximum_reporting_interval")
  local rep_change = nil
  return cluster_base.configure_reporting(device, data_types.ClusterId(self._cluster.ID), data_types.AttributeId(self.ID), data_types.ZigbeeDataType(self.base_type.ID), min, max, rep_change)
end

--- Write a value to this attribute on a device
---
--- @param device st.zigbee.Device
--- @param value st.zigbee.data_types.Enum8 the value to write
function ACLouverPosition:write(device, value)
  return cluster_base.attribute_write(self, device, value)
end

function ACLouverPosition:set_parent_cluster(cluster)
  self._cluster = cluster
  return self
end

setmetatable(ACLouverPosition, {__call = ACLouverPosition.new_value})
return ACLouverPosition
