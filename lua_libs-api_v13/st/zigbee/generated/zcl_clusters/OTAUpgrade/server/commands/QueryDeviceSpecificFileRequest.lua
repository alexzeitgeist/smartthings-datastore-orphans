local data_types = require "st.zigbee.data_types"
local utils = require "st.zigbee.utils"
local log = require "log"
local cluster_base = require "st.zigbee.cluster_base"
local ImageTypeIdDeviceSpecific = require "st.zigbee.generated.types.ImageTypeIdDeviceSpecific"

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

-----------------------------------------------------------
-- OTAUpgrade command QueryDeviceSpecificFileRequest
-----------------------------------------------------------

--- @class st.zigbee.zcl.clusters.OTAUpgrade.QueryDeviceSpecificFileRequest
--- @alias QueryDeviceSpecificFileRequest
---
--- @field public ID number 0x08 the ID of this command
--- @field public NAME string "QueryDeviceSpecificFileRequest" the name of this command
--- @field public request_node_address st.zigbee.data_types.IeeeAddress
--- @field public manufacturer_code st.zigbee.data_types.Uint16
--- @field public image_type st.zigbee.zcl.clusters.OTAUpgrade.types.ImageTypeIdDeviceSpecific
--- @field public file_version st.zigbee.data_types.Uint32
--- @field public current_zigbee_stack_version st.zigbee.data_types.Uint16
local QueryDeviceSpecificFileRequest = {}
QueryDeviceSpecificFileRequest.NAME = "QueryDeviceSpecificFileRequest"
QueryDeviceSpecificFileRequest.ID = 0x08
QueryDeviceSpecificFileRequest.args_def = {
  {
    name = "request_node_address",
    optional = false,
    data_type = data_types.IeeeAddress,
    is_complex = false,
    is_array = false,
  },
  {
    name = "manufacturer_code",
    optional = false,
    data_type = data_types.Uint16,
    is_complex = false,
    is_array = false,
    default = 0x0000,
  },
  {
    name = "image_type",
    optional = false,
    data_type = ImageTypeIdDeviceSpecific,
    is_complex = false,
    is_array = false,
  },
  {
    name = "file_version",
    optional = false,
    data_type = data_types.Uint32,
    is_complex = false,
    is_array = false,
    default = 0x00000000,
  },
  {
    name = "current_zigbee_stack_version",
    optional = false,
    data_type = data_types.Uint16,
    is_complex = false,
    is_array = false,
    default = 0x0000,
  },
}

function QueryDeviceSpecificFileRequest:get_fields()
  return cluster_base.command_get_fields(self)
end

QueryDeviceSpecificFileRequest.get_length = utils.length_from_fields
QueryDeviceSpecificFileRequest._serialize = utils.serialize_from_fields
QueryDeviceSpecificFileRequest.pretty_print = utils.print_from_fields

--- Deserialize this command
---
--- @param buf buf the bytes of the command body
--- @return QueryDeviceSpecificFileRequest
function QueryDeviceSpecificFileRequest.deserialize(buf)
  return cluster_base.command_deserialize(QueryDeviceSpecificFileRequest, buf)
end

function QueryDeviceSpecificFileRequest:set_field_names()
  cluster_base.command_set_fields(self)
end

--- Build a version of this message as if it came from the device
---
--- @param device st.zigbee.Device the device to build the message from
--- @param request_node_address st.zigbee.data_types.IeeeAddress
--- @param manufacturer_code st.zigbee.data_types.Uint16
--- @param image_type st.zigbee.zcl.clusters.OTAUpgrade.types.ImageTypeIdDeviceSpecific
--- @param file_version st.zigbee.data_types.Uint32
--- @param current_zigbee_stack_version st.zigbee.data_types.Uint16
--- @return st.zigbee.ZigbeeMessageRx The full Zigbee message containing this command body
function QueryDeviceSpecificFileRequest.build_test_rx(device, request_node_address, manufacturer_code, image_type, file_version, current_zigbee_stack_version)
  local args = {request_node_address, manufacturer_code, image_type, file_version, current_zigbee_stack_version}

  return cluster_base.command_build_test_rx(QueryDeviceSpecificFileRequest, device, args, "server")
end

--- Initialize the QueryDeviceSpecificFileRequest command
---
--- @param self QueryDeviceSpecificFileRequest the template class for this command
--- @param device st.zigbee.Device the device to build this message to
--- @param request_node_address st.zigbee.data_types.IeeeAddress
--- @param manufacturer_code st.zigbee.data_types.Uint16
--- @param image_type st.zigbee.zcl.clusters.OTAUpgrade.types.ImageTypeIdDeviceSpecific
--- @param file_version st.zigbee.data_types.Uint32
--- @param current_zigbee_stack_version st.zigbee.data_types.Uint16
--- @return st.zigbee.ZigbeeMessageTx the full command addressed to the device
function QueryDeviceSpecificFileRequest:init(device, request_node_address, manufacturer_code, image_type, file_version, current_zigbee_stack_version)
  local args = {request_node_address, manufacturer_code, image_type, file_version, current_zigbee_stack_version}

  return cluster_base.command_init(self, device, args, "server")
end

function QueryDeviceSpecificFileRequest:set_parent_cluster(cluster)
  self._cluster = cluster
  return self
end

setmetatable(QueryDeviceSpecificFileRequest, {__call = QueryDeviceSpecificFileRequest.init})

return QueryDeviceSpecificFileRequest
