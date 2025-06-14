local data_types = require "st.zigbee.data_types"
local utils = require "st.zigbee.utils"
local log = require "log"
local cluster_base = require "st.zigbee.cluster_base"
local TlTouchlinkInformationType = require "st.zigbee.generated.zcl_clusters.TouchlinkCommissioning.types.TlTouchlinkInformation"
local TlZigbeeInformationType = require "st.zigbee.generated.zcl_clusters.TouchlinkCommissioning.types.TlZigbeeInformation"

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
-- TouchlinkCommissioning command ScanRequest
-----------------------------------------------------------

--- @class st.zigbee.zcl.clusters.TouchlinkCommissioning.ScanRequest
--- @alias ScanRequest
---
--- @field public ID number 0x00 the ID of this command
--- @field public NAME string "ScanRequest" the name of this command
--- @field public inter_pan_transaction_identifier st.zigbee.data_types.Uint32
--- @field public zigbee_information st.zigbee.zcl.clusters.TouchlinkCommissioning.types.TlZigbeeInformation
--- @field public touchlink_information st.zigbee.zcl.clusters.TouchlinkCommissioning.types.TlTouchlinkInformation
local ScanRequest = {}
ScanRequest.NAME = "ScanRequest"
ScanRequest.ID = 0x00
ScanRequest.args_def = {
  {
    name = "inter_pan_transaction_identifier",
    optional = false,
    data_type = data_types.Uint32,
    is_complex = false,
    is_array = false,
    default = 0x00000000,
  },
  {
    name = "zigbee_information",
    optional = false,
    data_type = TlZigbeeInformationType,
    is_complex = false,
    is_array = false,
    default = 0x00,
  },
  {
    name = "touchlink_information",
    optional = false,
    data_type = TlTouchlinkInformationType,
    is_complex = false,
    is_array = false,
    default = 0x00,
  },
}

function ScanRequest:get_fields()
  return cluster_base.command_get_fields(self)
end

ScanRequest.get_length = utils.length_from_fields
ScanRequest._serialize = utils.serialize_from_fields
ScanRequest.pretty_print = utils.print_from_fields

--- Deserialize this command
---
--- @param buf buf the bytes of the command body
--- @return ScanRequest
function ScanRequest.deserialize(buf)
  return cluster_base.command_deserialize(ScanRequest, buf)
end

function ScanRequest:set_field_names()
  cluster_base.command_set_fields(self)
end

--- Build a version of this message as if it came from the device
---
--- @param device st.zigbee.Device the device to build the message from
--- @param inter_pan_transaction_identifier st.zigbee.data_types.Uint32
--- @param zigbee_information st.zigbee.zcl.clusters.TouchlinkCommissioning.types.TlZigbeeInformation
--- @param touchlink_information st.zigbee.zcl.clusters.TouchlinkCommissioning.types.TlTouchlinkInformation
--- @return st.zigbee.ZigbeeMessageRx The full Zigbee message containing this command body
function ScanRequest.build_test_rx(device, inter_pan_transaction_identifier, zigbee_information, touchlink_information)
  local args = {inter_pan_transaction_identifier, zigbee_information, touchlink_information}

  return cluster_base.command_build_test_rx(ScanRequest, device, args, "server")
end

--- Initialize the ScanRequest command
---
--- @param self ScanRequest the template class for this command
--- @param device st.zigbee.Device the device to build this message to
--- @param inter_pan_transaction_identifier st.zigbee.data_types.Uint32
--- @param zigbee_information st.zigbee.zcl.clusters.TouchlinkCommissioning.types.TlZigbeeInformation
--- @param touchlink_information st.zigbee.zcl.clusters.TouchlinkCommissioning.types.TlTouchlinkInformation
--- @return st.zigbee.ZigbeeMessageTx the full command addressed to the device
function ScanRequest:init(device, inter_pan_transaction_identifier, zigbee_information, touchlink_information)
  local args = {inter_pan_transaction_identifier, zigbee_information, touchlink_information}

  return cluster_base.command_init(self, device, args, "server")
end

function ScanRequest:set_parent_cluster(cluster)
  self._cluster = cluster
  return self
end

setmetatable(ScanRequest, {__call = ScanRequest.init})

return ScanRequest
