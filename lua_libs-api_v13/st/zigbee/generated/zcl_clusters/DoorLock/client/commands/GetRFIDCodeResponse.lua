local data_types = require "st.zigbee.data_types"
local utils = require "st.zigbee.utils"
local log = require "log"
local cluster_base = require "st.zigbee.cluster_base"
local DrlkUserStatusType = require "st.zigbee.generated.zcl_clusters.DoorLock.types.DrlkUserStatus"
local DrlkUserTypeType = require "st.zigbee.generated.zcl_clusters.DoorLock.types.DrlkUserType"

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
-- DoorLock command GetRFIDCodeResponse
-----------------------------------------------------------

--- @class st.zigbee.zcl.clusters.DoorLock.GetRFIDCodeResponse
--- @alias GetRFIDCodeResponse
---
--- @field public ID number 0x17 the ID of this command
--- @field public NAME string "GetRFIDCodeResponse" the name of this command
--- @field public user_id st.zigbee.data_types.Uint16
--- @field public user_status st.zigbee.zcl.clusters.DoorLock.types.DrlkUserStatus
--- @field public user_type st.zigbee.zcl.clusters.DoorLock.types.DrlkUserType
--- @field public rfid_code st.zigbee.data_types.OctetString
local GetRFIDCodeResponse = {}
GetRFIDCodeResponse.NAME = "GetRFIDCodeResponse"
GetRFIDCodeResponse.ID = 0x17
GetRFIDCodeResponse.args_def = {
  {
    name = "user_id",
    optional = false,
    data_type = data_types.Uint16,
    is_complex = false,
    is_array = false,
    default = 0x0000,
  },
  {
    name = "user_status",
    optional = false,
    data_type = DrlkUserStatusType,
    is_complex = false,
    is_array = false,
    default = 0x00,
  },
  {
    name = "user_type",
    optional = false,
    data_type = DrlkUserTypeType,
    is_complex = false,
    is_array = false,
    default = 0x00,
  },
  {
    name = "rfid_code",
    optional = false,
    data_type = data_types.OctetString,
    is_complex = false,
    is_array = false,
    default = "",
  },
}

function GetRFIDCodeResponse:get_fields()
  return cluster_base.command_get_fields(self)
end

GetRFIDCodeResponse.get_length = utils.length_from_fields
GetRFIDCodeResponse._serialize = utils.serialize_from_fields
GetRFIDCodeResponse.pretty_print = utils.print_from_fields

--- Deserialize this command
---
--- @param buf buf the bytes of the command body
--- @return GetRFIDCodeResponse
function GetRFIDCodeResponse.deserialize(buf)
  return cluster_base.command_deserialize(GetRFIDCodeResponse, buf)
end

function GetRFIDCodeResponse:set_field_names()
  cluster_base.command_set_fields(self)
end

--- Build a version of this message as if it came from the device
---
--- @param device st.zigbee.Device the device to build the message from
--- @param user_id st.zigbee.data_types.Uint16
--- @param user_status st.zigbee.zcl.clusters.DoorLock.types.DrlkUserStatus
--- @param user_type st.zigbee.zcl.clusters.DoorLock.types.DrlkUserType
--- @param rfid_code st.zigbee.data_types.OctetString
--- @return st.zigbee.ZigbeeMessageRx The full Zigbee message containing this command body
function GetRFIDCodeResponse.build_test_rx(device, user_id, user_status, user_type, rfid_code)
  local args = {user_id, user_status, user_type, rfid_code}

  return cluster_base.command_build_test_rx(GetRFIDCodeResponse, device, args, "client")
end

--- Initialize the GetRFIDCodeResponse command
---
--- @param self GetRFIDCodeResponse the template class for this command
--- @param device st.zigbee.Device the device to build this message to
--- @param user_id st.zigbee.data_types.Uint16
--- @param user_status st.zigbee.zcl.clusters.DoorLock.types.DrlkUserStatus
--- @param user_type st.zigbee.zcl.clusters.DoorLock.types.DrlkUserType
--- @param rfid_code st.zigbee.data_types.OctetString
--- @return st.zigbee.ZigbeeMessageTx the full command addressed to the device
function GetRFIDCodeResponse:init(device, user_id, user_status, user_type, rfid_code)
  local args = {user_id, user_status, user_type, rfid_code}

  return cluster_base.command_init(self, device, args, "client")
end

function GetRFIDCodeResponse:set_parent_cluster(cluster)
  self._cluster = cluster
  return self
end

setmetatable(GetRFIDCodeResponse, {__call = GetRFIDCodeResponse.init})

return GetRFIDCodeResponse
