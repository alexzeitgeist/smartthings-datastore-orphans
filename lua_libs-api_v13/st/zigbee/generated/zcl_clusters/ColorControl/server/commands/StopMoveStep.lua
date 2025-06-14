local data_types = require "st.zigbee.data_types"
local utils = require "st.zigbee.utils"
local log = require "log"
local cluster_base = require "st.zigbee.cluster_base"
local CcColorOptionsType = require "st.zigbee.generated.zcl_clusters.ColorControl.types.CcColorOptions"

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
-- ColorControl command StopMoveStep
-----------------------------------------------------------

--- @class st.zigbee.zcl.clusters.ColorControl.StopMoveStep
--- @alias StopMoveStep
---
--- @field public ID number 0x47 the ID of this command
--- @field public NAME string "StopMoveStep" the name of this command
--- @field public options_mask st.zigbee.zcl.clusters.ColorControl.types.CcColorOptions
--- @field public options_override st.zigbee.zcl.clusters.ColorControl.types.CcColorOptions
local StopMoveStep = {}
StopMoveStep.NAME = "StopMoveStep"
StopMoveStep.ID = 0x47
StopMoveStep.args_def = {
  {
    name = "options_mask",
    optional = false,
    data_type = CcColorOptionsType,
    is_complex = false,
    is_array = false,
    default = 0x00,
  },
  {
    name = "options_override",
    optional = false,
    data_type = CcColorOptionsType,
    is_complex = false,
    is_array = false,
    default = 0x00,
  },
}

function StopMoveStep:get_fields()
  return cluster_base.command_get_fields(self)
end

StopMoveStep.get_length = utils.length_from_fields
StopMoveStep._serialize = utils.serialize_from_fields
StopMoveStep.pretty_print = utils.print_from_fields

--- Deserialize this command
---
--- @param buf buf the bytes of the command body
--- @return StopMoveStep
function StopMoveStep.deserialize(buf)
  return cluster_base.command_deserialize(StopMoveStep, buf)
end

function StopMoveStep:set_field_names()
  cluster_base.command_set_fields(self)
end

--- Build a version of this message as if it came from the device
---
--- @param device st.zigbee.Device the device to build the message from
--- @param options_mask st.zigbee.zcl.clusters.ColorControl.types.CcColorOptions
--- @param options_override st.zigbee.zcl.clusters.ColorControl.types.CcColorOptions
--- @return st.zigbee.ZigbeeMessageRx The full Zigbee message containing this command body
function StopMoveStep.build_test_rx(device, options_mask, options_override)
  local args = {options_mask, options_override}

  return cluster_base.command_build_test_rx(StopMoveStep, device, args, "server")
end

--- Initialize the StopMoveStep command
---
--- @param self StopMoveStep the template class for this command
--- @param device st.zigbee.Device the device to build this message to
--- @param options_mask st.zigbee.zcl.clusters.ColorControl.types.CcColorOptions
--- @param options_override st.zigbee.zcl.clusters.ColorControl.types.CcColorOptions
--- @return st.zigbee.ZigbeeMessageTx the full command addressed to the device
function StopMoveStep:init(device, options_mask, options_override)
  local args = {options_mask, options_override}

  return cluster_base.command_init(self, device, args, "server")
end

function StopMoveStep:set_parent_cluster(cluster)
  self._cluster = cluster
  return self
end

setmetatable(StopMoveStep, {__call = StopMoveStep.init})

return StopMoveStep
