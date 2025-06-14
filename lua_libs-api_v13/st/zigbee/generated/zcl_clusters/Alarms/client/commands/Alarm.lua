local data_types = require "st.zigbee.data_types"
local utils = require "st.zigbee.utils"
local log = require "log"
local cluster_base = require "st.zigbee.cluster_base"

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
-- Alarms command Alarm
-----------------------------------------------------------

--- @class st.zigbee.zcl.clusters.Alarms.Alarm
--- @alias Alarm
---
--- @field public ID number 0x00 the ID of this command
--- @field public NAME string "Alarm" the name of this command
--- @field public alarm_code st.zigbee.data_types.Enum8
--- @field public cluster_identifier st.zigbee.data_types.ClusterId
local Alarm = {}
Alarm.NAME = "Alarm"
Alarm.ID = 0x00
Alarm.args_def = {
  {
    name = "alarm_code",
    optional = false,
    data_type = data_types.Enum8,
    is_complex = false,
    is_array = false,
    default = 0x00,
  },
  {
    name = "cluster_identifier",
    optional = false,
    data_type = data_types.ClusterId,
    is_complex = false,
    is_array = false,
  },
}

function Alarm:get_fields()
  return cluster_base.command_get_fields(self)
end

Alarm.get_length = utils.length_from_fields
Alarm._serialize = utils.serialize_from_fields
Alarm.pretty_print = utils.print_from_fields

--- Deserialize this command
---
--- @param buf buf the bytes of the command body
--- @return Alarm
function Alarm.deserialize(buf)
  return cluster_base.command_deserialize(Alarm, buf)
end

function Alarm:set_field_names()
  cluster_base.command_set_fields(self)
end

--- Build a version of this message as if it came from the device
---
--- @param device st.zigbee.Device the device to build the message from
--- @param alarm_code st.zigbee.data_types.Enum8
--- @param cluster_identifier st.zigbee.data_types.ClusterId
--- @return st.zigbee.ZigbeeMessageRx The full Zigbee message containing this command body
function Alarm.build_test_rx(device, alarm_code, cluster_identifier)
  local args = {alarm_code, cluster_identifier}

  return cluster_base.command_build_test_rx(Alarm, device, args, "client")
end

--- Initialize the Alarm command
---
--- @param self Alarm the template class for this command
--- @param device st.zigbee.Device the device to build this message to
--- @param alarm_code st.zigbee.data_types.Enum8
--- @param cluster_identifier st.zigbee.data_types.ClusterId
--- @return st.zigbee.ZigbeeMessageTx the full command addressed to the device
function Alarm:init(device, alarm_code, cluster_identifier)
  local args = {alarm_code, cluster_identifier}

  return cluster_base.command_init(self, device, args, "client")
end

function Alarm:set_parent_cluster(cluster)
  self._cluster = cluster
  return self
end

setmetatable(Alarm, {__call = Alarm.init})

return Alarm
