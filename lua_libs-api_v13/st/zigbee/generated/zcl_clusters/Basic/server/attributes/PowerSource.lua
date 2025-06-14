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

--- @class st.zigbee.zcl.clusters.Basic.PowerSource
--- @alias PowerSource
---
--- @field public ID number 0x0007 the ID of this attribute
--- @field public NAME string "PowerSource" the name of this attribute
--- @field public data_type st.zigbee.data_types.Enum8 the data type of this attribute
--- @field public UNKNOWN number 0
--- @field public SINGLE_PHASE_MAINS number 1
--- @field public THREE_PHASE_MAINS number 2
--- @field public BATTERY number 3
--- @field public DC_SOURCE number 4
--- @field public EMERGENCY_MAINS_CONSTANTLY_POWERED number 5
--- @field public EMERGENCY_MAINS_AND_TRANSFER_SWITCH number 6
--- @field public UNKNOWN_WITH_BATTERY_BACKUP number 128
--- @field public SINGLE_PHASE_MAINS_WITH_BATTERY_BACKUP number 129
--- @field public THREE_PHASE_MAINS_WITH_BATTERY_BACKUP number 130
--- @field public BATTERY_WITH_BATTERY_BACKUP number 131
--- @field public DC_SOURCE_WITH_BATTERY_BACKUP number 132
--- @field public EMERGENCY_MAINS_CONSTANTLY_POWERED_WITH_BATTERY_BACKUP number 133
--- @field public EMERGENCY_MAINS_AND_TRANSFER_SWITCH_WITH_BATTERY_BACKUP number 134
local PowerSource = {
  ID = 0x0007,
  NAME = "PowerSource",
  base_type = data_types.Enum8,
}

PowerSource.UNKNOWN                                                 = 0x00
PowerSource.SINGLE_PHASE_MAINS                                      = 0x01
PowerSource.THREE_PHASE_MAINS                                       = 0x02
PowerSource.BATTERY                                                 = 0x03
PowerSource.DC_SOURCE                                               = 0x04
PowerSource.EMERGENCY_MAINS_CONSTANTLY_POWERED                      = 0x05
PowerSource.EMERGENCY_MAINS_AND_TRANSFER_SWITCH                     = 0x06
PowerSource.UNKNOWN_WITH_BATTERY_BACKUP                             = 0x80
PowerSource.SINGLE_PHASE_MAINS_WITH_BATTERY_BACKUP                  = 0x81
PowerSource.THREE_PHASE_MAINS_WITH_BATTERY_BACKUP                   = 0x82
PowerSource.BATTERY_WITH_BATTERY_BACKUP                             = 0x83
PowerSource.DC_SOURCE_WITH_BATTERY_BACKUP                           = 0x84
PowerSource.EMERGENCY_MAINS_CONSTANTLY_POWERED_WITH_BATTERY_BACKUP  = 0x85
PowerSource.EMERGENCY_MAINS_AND_TRANSFER_SWITCH_WITH_BATTERY_BACKUP = 0x86


PowerSource.enum_fields = {
    [PowerSource.UNKNOWN]                                                 = "UNKNOWN",
    [PowerSource.SINGLE_PHASE_MAINS]                                      = "SINGLE_PHASE_MAINS",
    [PowerSource.THREE_PHASE_MAINS]                                       = "THREE_PHASE_MAINS",
    [PowerSource.BATTERY]                                                 = "BATTERY",
    [PowerSource.DC_SOURCE]                                               = "DC_SOURCE",
    [PowerSource.EMERGENCY_MAINS_CONSTANTLY_POWERED]                      = "EMERGENCY_MAINS_CONSTANTLY_POWERED",
    [PowerSource.EMERGENCY_MAINS_AND_TRANSFER_SWITCH]                     = "EMERGENCY_MAINS_AND_TRANSFER_SWITCH",
    [PowerSource.UNKNOWN_WITH_BATTERY_BACKUP]                             = "UNKNOWN_WITH_BATTERY_BACKUP",
    [PowerSource.SINGLE_PHASE_MAINS_WITH_BATTERY_BACKUP]                  = "SINGLE_PHASE_MAINS_WITH_BATTERY_BACKUP",
    [PowerSource.THREE_PHASE_MAINS_WITH_BATTERY_BACKUP]                   = "THREE_PHASE_MAINS_WITH_BATTERY_BACKUP",
    [PowerSource.BATTERY_WITH_BATTERY_BACKUP]                             = "BATTERY_WITH_BATTERY_BACKUP",
    [PowerSource.DC_SOURCE_WITH_BATTERY_BACKUP]                           = "DC_SOURCE_WITH_BATTERY_BACKUP",
    [PowerSource.EMERGENCY_MAINS_CONSTANTLY_POWERED_WITH_BATTERY_BACKUP]  = "EMERGENCY_MAINS_CONSTANTLY_POWERED_WITH_BATTERY_BACKUP",
    [PowerSource.EMERGENCY_MAINS_AND_TRANSFER_SWITCH_WITH_BATTERY_BACKUP] = "EMERGENCY_MAINS_AND_TRANSFER_SWITCH_WITH_BATTERY_BACKUP",
}

--- Add additional functionality to the base type object
---
--- @param base_type_obj st.zigbee.data_types.Enum8 the base data type object to add functionality to
function PowerSource:augment_type(base_type_obj)
  cluster_base.attribute_augment_type_enum(self, base_type_obj)
end

function PowerSource.pretty_print(value_obj)
  return string.format("%s: %s[%s]", value_obj.field_name or value_obj.NAME, PowerSource.NAME, PowerSource.enum_fields[value_obj.value])
end

--- @function PowerSource:build_test_attr_report
---
--- Build a Rx Zigbee message as if a device reported this attribute
--- @param device st.zigbee.Device
--- @param data st.zigbee.data_types.Enum8 the attribute value
--- @return st.zigbee.ZigbeeMessageRx containing an AttributeReport body
PowerSource.build_test_attr_report = cluster_base.build_test_attr_report

--- @function PowerSource:build_test_read_attr_response
---
--- Build a Rx Zigbee message as if a device sent a read response for this attribute
--- @param device st.zigbee.Device
--- @param data st.zigbee.data_types.Enum8 the attribute value
--- @return st.zigbee.ZigbeeMessageRx containing an ReadAttributeResponse body
PowerSource.build_test_read_attr_response = cluster_base.build_test_read_attr_response

--- Create a Enum8 object of this attribute with any additional features provided for the attribute
---
--- This is also usable with the PowerSource(...) syntax
---
--- @vararg vararg the values needed to construct a Enum8
--- @return st.zigbee.data_types.Enum8
function PowerSource:new_value(...)
    local o = self.base_type(table.unpack({...}))
    self:augment_type(o)
    return o
end

--- Construct a st.zigbee.ZigbeeMessageTx to read this attribute from a device
---
--- @param device st.zigbee.Device
--- @return st.zigbee.ZigbeeMessageTx containing a ReadAttribute body
function PowerSource:read(device)
    return cluster_base.read_attribute(device, data_types.ClusterId(self._cluster.ID), data_types.AttributeId(self.ID))
end

--- Construct a st.zigbee.ZigbeeMessageTx to configure this attribute for reporting on a device
---
--- @param device st.zigbee.Device
--- @param min_rep_int number|st.zigbee.data_types.Uint16 the minimum interval allowed between reports of this attribute
--- @param max_rep_int number|st.zigbee.data_types.Uint16 the maximum interval allowed between reports of this attribute
--- @return st.zigbee.ZigbeeMessageTx containing a ConfigureReporting body
function PowerSource:configure_reporting(device, min_rep_int, max_rep_int)
  local min = data_types.validate_or_build_type(min_rep_int, data_types.Uint16, "minimum_reporting_interval")
  local max = data_types.validate_or_build_type(max_rep_int, data_types.Uint16, "maximum_reporting_interval")
  local rep_change = nil
  return cluster_base.configure_reporting(device, data_types.ClusterId(self._cluster.ID), data_types.AttributeId(self.ID), data_types.ZigbeeDataType(self.base_type.ID), min, max, rep_change)
end

function PowerSource:set_parent_cluster(cluster)
  self._cluster = cluster
  return self
end

setmetatable(PowerSource, {__call = PowerSource.new_value})
return PowerSource
