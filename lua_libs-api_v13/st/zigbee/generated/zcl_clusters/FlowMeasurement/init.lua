local cluster_base = require "st.zigbee.cluster_base"
local FlowMeasurementClientAttributes = require "st.zigbee.generated.zcl_clusters.FlowMeasurement.client.attributes"
local FlowMeasurementServerAttributes = require "st.zigbee.generated.zcl_clusters.FlowMeasurement.server.attributes"
local FlowMeasurementClientCommands = require "st.zigbee.generated.zcl_clusters.FlowMeasurement.client.commands"
local FlowMeasurementServerCommands = require "st.zigbee.generated.zcl_clusters.FlowMeasurement.server.commands"
local FlowMeasurementTypes = require "st.zigbee.generated.zcl_clusters.FlowMeasurement.types"

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

--- @class st.zigbee.zcl.clusters.FlowMeasurement
--- @alias FlowMeasurement
---
--- @field public ID number 0x0404 the ID of this cluster
--- @field public NAME string "FlowMeasurement" the name of this cluster
--- @field public attributes st.zigbee.zcl.clusters.FlowMeasurementServerAttributes | st.zigbee.zcl.clusters.FlowMeasurementClientAttributes
--- @field public commands st.zigbee.zcl.clusters.FlowMeasurementServerCommands | st.zigbee.zcl.clusters.FlowMeasurementClientCommands
--- @field public types st.zigbee.zcl.clusters.FlowMeasurementTypes
local FlowMeasurement = {}

FlowMeasurement.ID = 0x0404
FlowMeasurement.NAME = "FlowMeasurement"
FlowMeasurement.server = {}
FlowMeasurement.client = {}
FlowMeasurement.server.attributes = FlowMeasurementServerAttributes:set_parent_cluster(FlowMeasurement)
FlowMeasurement.client.attributes = FlowMeasurementClientAttributes:set_parent_cluster(FlowMeasurement)
FlowMeasurement.server.commands = FlowMeasurementServerCommands:set_parent_cluster(FlowMeasurement)
FlowMeasurement.client.commands = FlowMeasurementClientCommands:set_parent_cluster(FlowMeasurement)
FlowMeasurement.types = FlowMeasurementTypes

function FlowMeasurement.attr_id_map()
    return {
    [0x0000] = "MeasuredValue",
    [0x0001] = "MinMeasuredValue",
    [0x0002] = "MaxMeasuredValue",
    [0x0003] = "Tolerance",
  }
end

function FlowMeasurement.server_id_map()
    return {
  }
end

function FlowMeasurement.client_id_map()
    return {
  }
end

FlowMeasurement.attribute_direction_map = {
  ["MeasuredValue"] = "server",
  ["MinMeasuredValue"] = "server",
  ["MaxMeasuredValue"] = "server",
  ["Tolerance"] = "server",
}
FlowMeasurement.command_direction_map = {}

setmetatable(FlowMeasurement, {__index = cluster_base})

FlowMeasurement:init_attributes_table()
FlowMeasurement:init_commands_table()

return FlowMeasurement
