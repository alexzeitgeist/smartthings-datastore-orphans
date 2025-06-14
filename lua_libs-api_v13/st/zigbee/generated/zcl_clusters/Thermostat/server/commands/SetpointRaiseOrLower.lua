local data_types = require "st.zigbee.data_types"
local utils = require "st.zigbee.utils"
local log = require "log"
local cluster_base = require "st.zigbee.cluster_base"
local ModeType = require "st.zigbee.generated.zcl_clusters.Thermostat.types.Mode"

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
-- Thermostat command SetpointRaiseOrLower
-----------------------------------------------------------

--- @class st.zigbee.zcl.clusters.Thermostat.SetpointRaiseOrLower
--- @alias SetpointRaiseOrLower
---
--- @field public ID number 0x00 the ID of this command
--- @field public NAME string "SetpointRaiseOrLower" the name of this command
--- @field public mode st.zigbee.zcl.clusters.Thermostat.types.Mode
--- @field public amount st.zigbee.data_types.Int8
local SetpointRaiseOrLower = {}
SetpointRaiseOrLower.NAME = "SetpointRaiseOrLower"
SetpointRaiseOrLower.ID = 0x00
SetpointRaiseOrLower.args_def = {
  {
    name = "mode",
    optional = false,
    data_type = ModeType,
    is_complex = false,
    is_array = false,
  },
  {
    name = "amount",
    optional = false,
    data_type = data_types.Int8,
    is_complex = false,
    is_array = false,
    default = 0x00,
  },
}

function SetpointRaiseOrLower:get_fields()
  return cluster_base.command_get_fields(self)
end

SetpointRaiseOrLower.get_length = utils.length_from_fields
SetpointRaiseOrLower._serialize = utils.serialize_from_fields
SetpointRaiseOrLower.pretty_print = utils.print_from_fields

--- Deserialize this command
---
--- @param buf buf the bytes of the command body
--- @return SetpointRaiseOrLower
function SetpointRaiseOrLower.deserialize(buf)
  return cluster_base.command_deserialize(SetpointRaiseOrLower, buf)
end

function SetpointRaiseOrLower:set_field_names()
  cluster_base.command_set_fields(self)
end

--- Build a version of this message as if it came from the device
---
--- @param device st.zigbee.Device the device to build the message from
--- @param mode st.zigbee.zcl.clusters.Thermostat.types.Mode
--- @param amount st.zigbee.data_types.Int8
--- @return st.zigbee.ZigbeeMessageRx The full Zigbee message containing this command body
function SetpointRaiseOrLower.build_test_rx(device, mode, amount)
  local args = {mode, amount}

  return cluster_base.command_build_test_rx(SetpointRaiseOrLower, device, args, "server")
end

--- Initialize the SetpointRaiseOrLower command
---
--- @param self SetpointRaiseOrLower the template class for this command
--- @param device st.zigbee.Device the device to build this message to
--- @param mode st.zigbee.zcl.clusters.Thermostat.types.Mode
--- @param amount st.zigbee.data_types.Int8
--- @return st.zigbee.ZigbeeMessageTx the full command addressed to the device
function SetpointRaiseOrLower:init(device, mode, amount)
  local args = {mode, amount}

  return cluster_base.command_init(self, device, args, "server")
end

function SetpointRaiseOrLower:set_parent_cluster(cluster)
  self._cluster = cluster
  return self
end

setmetatable(SetpointRaiseOrLower, {__call = SetpointRaiseOrLower.init})

return SetpointRaiseOrLower
