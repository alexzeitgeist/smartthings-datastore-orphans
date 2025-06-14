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
-- ColorControl command MoveToColor
-----------------------------------------------------------

--- @class st.zigbee.zcl.clusters.ColorControl.MoveToColor
--- @alias MoveToColor
---
--- @field public ID number 0x07 the ID of this command
--- @field public NAME string "MoveToColor" the name of this command
--- @field public color_x st.zigbee.data_types.Uint16
--- @field public color_y st.zigbee.data_types.Uint16
--- @field public transition_time st.zigbee.data_types.Uint16
--- @field public options_mask st.zigbee.zcl.clusters.ColorControl.types.CcColorOptions
--- @field public options_override st.zigbee.zcl.clusters.ColorControl.types.CcColorOptions
local MoveToColor = {}
MoveToColor.NAME = "MoveToColor"
MoveToColor.ID = 0x07
MoveToColor.args_def = {
  {
    name = "color_x",
    optional = false,
    data_type = data_types.Uint16,
    is_complex = false,
    is_array = false,
    default = 0x0000,
  },
  {
    name = "color_y",
    optional = false,
    data_type = data_types.Uint16,
    is_complex = false,
    is_array = false,
    default = 0x0000,
  },
  {
    name = "transition_time",
    optional = false,
    data_type = data_types.Uint16,
    is_complex = false,
    is_array = false,
    default = 0x0000,
  },
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

function MoveToColor:get_fields()
  return cluster_base.command_get_fields(self)
end

MoveToColor.get_length = utils.length_from_fields
MoveToColor._serialize = utils.serialize_from_fields
MoveToColor.pretty_print = utils.print_from_fields

--- Deserialize this command
---
--- @param buf buf the bytes of the command body
--- @return MoveToColor
function MoveToColor.deserialize(buf)
  return cluster_base.command_deserialize(MoveToColor, buf)
end

function MoveToColor:set_field_names()
  cluster_base.command_set_fields(self)
end

--- Build a version of this message as if it came from the device
---
--- @param device st.zigbee.Device the device to build the message from
--- @param color_x st.zigbee.data_types.Uint16
--- @param color_y st.zigbee.data_types.Uint16
--- @param transition_time st.zigbee.data_types.Uint16
--- @param options_mask st.zigbee.zcl.clusters.ColorControl.types.CcColorOptions
--- @param options_override st.zigbee.zcl.clusters.ColorControl.types.CcColorOptions
--- @return st.zigbee.ZigbeeMessageRx The full Zigbee message containing this command body
function MoveToColor.build_test_rx(device, color_x, color_y, transition_time, options_mask, options_override)
  local args = {color_x, color_y, transition_time, options_mask, options_override}

  return cluster_base.command_build_test_rx(MoveToColor, device, args, "server")
end

--- Initialize the MoveToColor command
---
--- @param self MoveToColor the template class for this command
--- @param device st.zigbee.Device the device to build this message to
--- @param color_x st.zigbee.data_types.Uint16
--- @param color_y st.zigbee.data_types.Uint16
--- @param transition_time st.zigbee.data_types.Uint16
--- @param options_mask st.zigbee.zcl.clusters.ColorControl.types.CcColorOptions
--- @param options_override st.zigbee.zcl.clusters.ColorControl.types.CcColorOptions
--- @return st.zigbee.ZigbeeMessageTx the full command addressed to the device
function MoveToColor:init(device, color_x, color_y, transition_time, options_mask, options_override)
  local args = {color_x, color_y, transition_time, options_mask, options_override}

  return cluster_base.command_init(self, device, args, "server")
end

function MoveToColor:set_parent_cluster(cluster)
  self._cluster = cluster
  return self
end

setmetatable(MoveToColor, {__call = MoveToColor.init})

return MoveToColor
