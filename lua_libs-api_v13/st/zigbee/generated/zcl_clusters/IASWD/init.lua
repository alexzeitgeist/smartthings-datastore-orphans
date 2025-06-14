local cluster_base = require "st.zigbee.cluster_base"
local IASWDClientAttributes = require "st.zigbee.generated.zcl_clusters.IASWD.client.attributes"
local IASWDServerAttributes = require "st.zigbee.generated.zcl_clusters.IASWD.server.attributes"
local IASWDClientCommands = require "st.zigbee.generated.zcl_clusters.IASWD.client.commands"
local IASWDServerCommands = require "st.zigbee.generated.zcl_clusters.IASWD.server.commands"
local IASWDTypes = require "st.zigbee.generated.zcl_clusters.IASWD.types"

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

--- @class st.zigbee.zcl.clusters.IASWD
--- @alias IASWD
---
--- @field public ID number 0x0502 the ID of this cluster
--- @field public NAME string "IASWD" the name of this cluster
--- @field public attributes st.zigbee.zcl.clusters.IASWDServerAttributes | st.zigbee.zcl.clusters.IASWDClientAttributes
--- @field public commands st.zigbee.zcl.clusters.IASWDServerCommands | st.zigbee.zcl.clusters.IASWDClientCommands
--- @field public types st.zigbee.zcl.clusters.IASWDTypes
local IASWD = {}

IASWD.ID = 0x0502
IASWD.NAME = "IASWD"
IASWD.server = {}
IASWD.client = {}
IASWD.server.attributes = IASWDServerAttributes:set_parent_cluster(IASWD)
IASWD.client.attributes = IASWDClientAttributes:set_parent_cluster(IASWD)
IASWD.server.commands = IASWDServerCommands:set_parent_cluster(IASWD)
IASWD.client.commands = IASWDClientCommands:set_parent_cluster(IASWD)
IASWD.types = IASWDTypes

function IASWD.attr_id_map()
    return {
    [0x0000] = "MaxDuration",
  }
end

function IASWD.server_id_map()
    return {
    [0x00] = "StartWarning",
    [0x01] = "Squawk",
  }
end

function IASWD.client_id_map()
    return {
  }
end

IASWD.attribute_direction_map = {
  ["MaxDuration"] = "server",
}
IASWD.command_direction_map = {
  ["StartWarning"] = "server",
  ["Squawk"] = "server",
}

setmetatable(IASWD, {__index = cluster_base})

IASWD:init_attributes_table()
IASWD:init_commands_table()

return IASWD
