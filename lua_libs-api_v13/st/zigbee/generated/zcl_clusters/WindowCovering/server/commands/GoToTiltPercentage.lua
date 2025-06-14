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
-- WindowCovering command GoToTiltPercentage
-----------------------------------------------------------

--- @class st.zigbee.zcl.clusters.WindowCovering.GoToTiltPercentage
--- @alias GoToTiltPercentage
---
--- @field public ID number 0x08 the ID of this command
--- @field public NAME string "GoToTiltPercentage" the name of this command
--- @field public percentage_tilt_value st.zigbee.data_types.Uint8
local GoToTiltPercentage = {}
GoToTiltPercentage.NAME = "GoToTiltPercentage"
GoToTiltPercentage.ID = 0x08
GoToTiltPercentage.args_def = {
  {
    name = "percentage_tilt_value",
    optional = false,
    data_type = data_types.Uint8,
    is_complex = false,
    is_array = false,
    default = 0x00,
  },
}

function GoToTiltPercentage:get_fields()
  return cluster_base.command_get_fields(self)
end

GoToTiltPercentage.get_length = utils.length_from_fields
GoToTiltPercentage._serialize = utils.serialize_from_fields
GoToTiltPercentage.pretty_print = utils.print_from_fields

--- Deserialize this command
---
--- @param buf buf the bytes of the command body
--- @return GoToTiltPercentage
function GoToTiltPercentage.deserialize(buf)
  return cluster_base.command_deserialize(GoToTiltPercentage, buf)
end

function GoToTiltPercentage:set_field_names()
  cluster_base.command_set_fields(self)
end

--- Build a version of this message as if it came from the device
---
--- @param device st.zigbee.Device the device to build the message from
--- @param percentage_tilt_value st.zigbee.data_types.Uint8
--- @return st.zigbee.ZigbeeMessageRx The full Zigbee message containing this command body
function GoToTiltPercentage.build_test_rx(device, percentage_tilt_value)
  local args = {percentage_tilt_value}

  return cluster_base.command_build_test_rx(GoToTiltPercentage, device, args, "server")
end

--- Initialize the GoToTiltPercentage command
---
--- @param self GoToTiltPercentage the template class for this command
--- @param device st.zigbee.Device the device to build this message to
--- @param percentage_tilt_value st.zigbee.data_types.Uint8
--- @return st.zigbee.ZigbeeMessageTx the full command addressed to the device
function GoToTiltPercentage:init(device, percentage_tilt_value)
  local args = {percentage_tilt_value}

  return cluster_base.command_init(self, device, args, "server")
end

function GoToTiltPercentage:set_parent_cluster(cluster)
  self._cluster = cluster
  return self
end

setmetatable(GoToTiltPercentage, {__call = GoToTiltPercentage.init})

return GoToTiltPercentage
