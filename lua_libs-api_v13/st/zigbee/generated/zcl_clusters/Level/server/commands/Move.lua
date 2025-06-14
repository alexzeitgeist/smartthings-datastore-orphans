local data_types = require "st.zigbee.data_types"
local utils = require "st.zigbee.utils"
local log = require "log"
local cluster_base = require "st.zigbee.cluster_base"
local LevelOptionsType = require "st.zigbee.generated.zcl_clusters.Level.types.LevelOptions"
local MoveStepModeType = require "st.zigbee.generated.zcl_clusters.Level.types.MoveStepMode"

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
-- Level command Move
-----------------------------------------------------------

--- @class st.zigbee.zcl.clusters.Level.Move
--- @alias Move
---
--- @field public ID number 0x01 the ID of this command
--- @field public NAME string "Move" the name of this command
--- @field public move_mode st.zigbee.zcl.clusters.Level.types.MoveStepMode
--- @field public rate st.zigbee.data_types.Uint8
--- @field public options_mask st.zigbee.zcl.clusters.Level.types.LevelOptions
--- @field public options_override st.zigbee.zcl.clusters.Level.types.LevelOptions
local Move = {}
Move.NAME = "Move"
Move.ID = 0x01
Move.args_def = {
  {
    name = "move_mode",
    optional = false,
    data_type = MoveStepModeType,
    is_complex = false,
    is_array = false,
    default = 0x00,
  },
  {
    name = "rate",
    optional = false,
    data_type = data_types.Uint8,
    is_complex = false,
    is_array = false,
    default = 0x00,
  },
  {
    name = "options_mask",
    optional = false,
    data_type = LevelOptionsType,
    is_complex = false,
    is_array = false,
    default = 0x00,
  },
  {
    name = "options_override",
    optional = false,
    data_type = LevelOptionsType,
    is_complex = false,
    is_array = false,
    default = 0x00,
  },
}

function Move:get_fields()
  return cluster_base.command_get_fields(self)
end

Move.get_length = utils.length_from_fields
Move._serialize = utils.serialize_from_fields
Move.pretty_print = utils.print_from_fields

--- Deserialize this command
---
--- @param buf buf the bytes of the command body
--- @return Move
function Move.deserialize(buf)
  return cluster_base.command_deserialize(Move, buf)
end

function Move:set_field_names()
  cluster_base.command_set_fields(self)
end

--- Build a version of this message as if it came from the device
---
--- @param device st.zigbee.Device the device to build the message from
--- @param move_mode st.zigbee.zcl.clusters.Level.types.MoveStepMode
--- @param rate st.zigbee.data_types.Uint8
--- @param options_mask st.zigbee.zcl.clusters.Level.types.LevelOptions
--- @param options_override st.zigbee.zcl.clusters.Level.types.LevelOptions
--- @return st.zigbee.ZigbeeMessageRx The full Zigbee message containing this command body
function Move.build_test_rx(device, move_mode, rate, options_mask, options_override)
  local args = {move_mode, rate, options_mask, options_override}

  return cluster_base.command_build_test_rx(Move, device, args, "server")
end

--- Initialize the Move command
---
--- @param self Move the template class for this command
--- @param device st.zigbee.Device the device to build this message to
--- @param move_mode st.zigbee.zcl.clusters.Level.types.MoveStepMode
--- @param rate st.zigbee.data_types.Uint8
--- @param options_mask st.zigbee.zcl.clusters.Level.types.LevelOptions
--- @param options_override st.zigbee.zcl.clusters.Level.types.LevelOptions
--- @return st.zigbee.ZigbeeMessageTx the full command addressed to the device
function Move:init(device, move_mode, rate, options_mask, options_override)
  local args = {move_mode, rate, options_mask, options_override}

  return cluster_base.command_init(self, device, args, "server")
end

function Move:set_parent_cluster(cluster)
  self._cluster = cluster
  return self
end

setmetatable(Move, {__call = Move.init})

return Move
