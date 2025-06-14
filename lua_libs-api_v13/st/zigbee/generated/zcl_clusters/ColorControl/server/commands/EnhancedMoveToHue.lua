local data_types = require "st.zigbee.data_types"
local utils = require "st.zigbee.utils"
local log = require "log"
local cluster_base = require "st.zigbee.cluster_base"
local CcColorOptionsType = require "st.zigbee.generated.zcl_clusters.ColorControl.types.CcColorOptions"
local CcDirectionType = require "st.zigbee.generated.zcl_clusters.ColorControl.types.CcDirection"

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
-- ColorControl command EnhancedMoveToHue
-----------------------------------------------------------

--- @class st.zigbee.zcl.clusters.ColorControl.EnhancedMoveToHue
--- @alias EnhancedMoveToHue
---
--- @field public ID number 0x40 the ID of this command
--- @field public NAME string "EnhancedMoveToHue" the name of this command
--- @field public enhanced_hue st.zigbee.data_types.Uint16
--- @field public direction st.zigbee.zcl.clusters.ColorControl.types.CcDirection
--- @field public transition_time st.zigbee.data_types.Uint16
--- @field public options_mask st.zigbee.zcl.clusters.ColorControl.types.CcColorOptions
--- @field public options_override st.zigbee.zcl.clusters.ColorControl.types.CcColorOptions
local EnhancedMoveToHue = {}
EnhancedMoveToHue.NAME = "EnhancedMoveToHue"
EnhancedMoveToHue.ID = 0x40
EnhancedMoveToHue.args_def = {
  {
    name = "enhanced_hue",
    optional = false,
    data_type = data_types.Uint16,
    is_complex = false,
    is_array = false,
    default = 0x0000,
  },
  {
    name = "direction",
    optional = false,
    data_type = CcDirectionType,
    is_complex = false,
    is_array = false,
    default = 0x00,
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

function EnhancedMoveToHue:get_fields()
  return cluster_base.command_get_fields(self)
end

EnhancedMoveToHue.get_length = utils.length_from_fields
EnhancedMoveToHue._serialize = utils.serialize_from_fields
EnhancedMoveToHue.pretty_print = utils.print_from_fields

--- Deserialize this command
---
--- @param buf buf the bytes of the command body
--- @return EnhancedMoveToHue
function EnhancedMoveToHue.deserialize(buf)
  return cluster_base.command_deserialize(EnhancedMoveToHue, buf)
end

function EnhancedMoveToHue:set_field_names()
  cluster_base.command_set_fields(self)
end

--- Build a version of this message as if it came from the device
---
--- @param device st.zigbee.Device the device to build the message from
--- @param enhanced_hue st.zigbee.data_types.Uint16
--- @param direction st.zigbee.zcl.clusters.ColorControl.types.CcDirection
--- @param transition_time st.zigbee.data_types.Uint16
--- @param options_mask st.zigbee.zcl.clusters.ColorControl.types.CcColorOptions
--- @param options_override st.zigbee.zcl.clusters.ColorControl.types.CcColorOptions
--- @return st.zigbee.ZigbeeMessageRx The full Zigbee message containing this command body
function EnhancedMoveToHue.build_test_rx(device, enhanced_hue, direction, transition_time, options_mask, options_override)
  local args = {enhanced_hue, direction, transition_time, options_mask, options_override}

  return cluster_base.command_build_test_rx(EnhancedMoveToHue, device, args, "server")
end

--- Initialize the EnhancedMoveToHue command
---
--- @param self EnhancedMoveToHue the template class for this command
--- @param device st.zigbee.Device the device to build this message to
--- @param enhanced_hue st.zigbee.data_types.Uint16
--- @param direction st.zigbee.zcl.clusters.ColorControl.types.CcDirection
--- @param transition_time st.zigbee.data_types.Uint16
--- @param options_mask st.zigbee.zcl.clusters.ColorControl.types.CcColorOptions
--- @param options_override st.zigbee.zcl.clusters.ColorControl.types.CcColorOptions
--- @return st.zigbee.ZigbeeMessageTx the full command addressed to the device
function EnhancedMoveToHue:init(device, enhanced_hue, direction, transition_time, options_mask, options_override)
  local args = {enhanced_hue, direction, transition_time, options_mask, options_override}

  return cluster_base.command_init(self, device, args, "server")
end

function EnhancedMoveToHue:set_parent_cluster(cluster)
  self._cluster = cluster
  return self
end

setmetatable(EnhancedMoveToHue, {__call = EnhancedMoveToHue.init})

return EnhancedMoveToHue
