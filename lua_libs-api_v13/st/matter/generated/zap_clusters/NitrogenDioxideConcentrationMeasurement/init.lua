-- Copyright 2022 SmartThings
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
-- http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.

-- DO NOT EDIT: this code is automatically generated by ZCL Advanced Platform generator.

local cluster_base = require "st.matter.cluster_base"
local NitrogenDioxideConcentrationMeasurementServerAttributes = require "st.matter.generated.zap_clusters.NitrogenDioxideConcentrationMeasurement.server.attributes"
local NitrogenDioxideConcentrationMeasurementServerCommands = require "st.matter.generated.zap_clusters.NitrogenDioxideConcentrationMeasurement.server.commands"
local NitrogenDioxideConcentrationMeasurementTypes = require "st.matter.generated.zap_clusters.NitrogenDioxideConcentrationMeasurement.types"

--- @class st.matter.generated.zap_clusters.NitrogenDioxideConcentrationMeasurement
--- @alias NitrogenDioxideConcentrationMeasurement
---
--- @field public ID number 0x0413 the ID of this cluster
--- @field public NAME string "NitrogenDioxideConcentrationMeasurement" the name of this cluster
--- @field public attributes st.matter.generated.zap_clusters.NitrogenDioxideConcentrationMeasurementServerAttributes | st.matter.generated.zap_clusters.NitrogenDioxideConcentrationMeasurementClientAttributes
--- @field public commands st.matter.generated.zap_clusters.NitrogenDioxideConcentrationMeasurementServerCommands | st.matter.generated.zap_clusters.NitrogenDioxideConcentrationMeasurementClientCommands
--- @field public types st.matter.generated.zap_clusters.NitrogenDioxideConcentrationMeasurementTypes

local NitrogenDioxideConcentrationMeasurement = {}

NitrogenDioxideConcentrationMeasurement.ID = 0x0413
NitrogenDioxideConcentrationMeasurement.NAME = "NitrogenDioxideConcentrationMeasurement"
NitrogenDioxideConcentrationMeasurement.server = {}
NitrogenDioxideConcentrationMeasurement.client = {}
NitrogenDioxideConcentrationMeasurement.server.attributes = NitrogenDioxideConcentrationMeasurementServerAttributes:set_parent_cluster(NitrogenDioxideConcentrationMeasurement)
NitrogenDioxideConcentrationMeasurement.server.commands = NitrogenDioxideConcentrationMeasurementServerCommands:set_parent_cluster(NitrogenDioxideConcentrationMeasurement)
NitrogenDioxideConcentrationMeasurement.types = NitrogenDioxideConcentrationMeasurementTypes

--- Find an attribute by id
---
--- @param attr_id number
function NitrogenDioxideConcentrationMeasurement:get_attribute_by_id(attr_id)
  local attr_id_map = {
    [0x0000] = "MeasuredValue",
    [0x0001] = "MinMeasuredValue",
    [0x0002] = "MaxMeasuredValue",
    [0x0003] = "PeakMeasuredValue",
    [0x0004] = "PeakMeasuredValueWindow",
    [0x0005] = "AverageMeasuredValue",
    [0x0006] = "AverageMeasuredValueWindow",
    [0x0007] = "Uncertainty",
    [0x0008] = "MeasurementUnit",
    [0x0009] = "MeasurementMedium",
    [0x000A] = "LevelValue",
    [0xFFF9] = "AcceptedCommandList",
    [0xFFFA] = "EventList",
    [0xFFFB] = "AttributeList",
  }
  local attr_name = attr_id_map[attr_id]
  if attr_name ~= nil then
    return self.attributes[attr_name]
  end
  return nil
end

--- Find a server command by id
---
--- @param command_id number
function NitrogenDioxideConcentrationMeasurement:get_server_command_by_id(command_id)
  local server_id_map = {
  }
  if server_id_map[command_id] ~= nil then
    return self.server.commands[server_id_map[command_id]]
  end
  return nil
end


-- Attribute Mapping
NitrogenDioxideConcentrationMeasurement.attribute_direction_map = {
  ["MeasuredValue"] = "server",
  ["MinMeasuredValue"] = "server",
  ["MaxMeasuredValue"] = "server",
  ["PeakMeasuredValue"] = "server",
  ["PeakMeasuredValueWindow"] = "server",
  ["AverageMeasuredValue"] = "server",
  ["AverageMeasuredValueWindow"] = "server",
  ["Uncertainty"] = "server",
  ["MeasurementUnit"] = "server",
  ["MeasurementMedium"] = "server",
  ["LevelValue"] = "server",
  ["AcceptedCommandList"] = "server",
  ["EventList"] = "server",
  ["AttributeList"] = "server",
}

do
  local has_aliases, aliases = pcall(require, "st.matter.clusters.aliases.NitrogenDioxideConcentrationMeasurement.server.attributes")
  if has_aliases then
    for alias, _ in pairs(aliases) do
      NitrogenDioxideConcentrationMeasurement.attribute_direction_map[alias] = "server"
    end
  end
end

-- Command Mapping
NitrogenDioxideConcentrationMeasurement.command_direction_map = {
}

do
  local has_aliases, aliases = pcall(require, "st.matter.clusters.aliases.NitrogenDioxideConcentrationMeasurement.server.commands")
  if has_aliases then
    for alias, _ in pairs(aliases) do
      NitrogenDioxideConcentrationMeasurement.command_direction_map[alias] = "server"
    end
  end
end

do
  local has_aliases, aliases = pcall(require, "st.matter.clusters.aliases.NitrogenDioxideConcentrationMeasurement.client.commands")
  if has_aliases then
    for alias, _ in pairs(aliases) do
      NitrogenDioxideConcentrationMeasurement.command_direction_map[alias] = "client"
    end
  end
end

NitrogenDioxideConcentrationMeasurement.FeatureMap = NitrogenDioxideConcentrationMeasurement.types.Feature

function NitrogenDioxideConcentrationMeasurement.are_features_supported(feature, feature_map)
  if (NitrogenDioxideConcentrationMeasurement.FeatureMap.bits_are_valid(feature)) then
    return (feature & feature_map) == feature
  end
  return false
end

-- Cluster Completion
local attribute_helper_mt = {}
attribute_helper_mt.__index = function(self, key)
  local direction = NitrogenDioxideConcentrationMeasurement.attribute_direction_map[key]
  if direction == nil then
    error(string.format("Referenced unknown attribute %s on cluster %s", key, NitrogenDioxideConcentrationMeasurement.NAME))
  end
  return NitrogenDioxideConcentrationMeasurement[direction].attributes[key]
end
NitrogenDioxideConcentrationMeasurement.attributes = {}
setmetatable(NitrogenDioxideConcentrationMeasurement.attributes, attribute_helper_mt)

local command_helper_mt = {}
command_helper_mt.__index = function(self, key)
  local direction = NitrogenDioxideConcentrationMeasurement.command_direction_map[key]
  if direction == nil then
    error(string.format("Referenced unknown command %s on cluster %s", key, NitrogenDioxideConcentrationMeasurement.NAME))
  end
  return NitrogenDioxideConcentrationMeasurement[direction].commands[key]
end
NitrogenDioxideConcentrationMeasurement.commands = {}
setmetatable(NitrogenDioxideConcentrationMeasurement.commands, command_helper_mt)

local event_helper_mt = {}
event_helper_mt.__index = function(self, key)
  return NitrogenDioxideConcentrationMeasurement.server.events[key]
end
NitrogenDioxideConcentrationMeasurement.events = {}
setmetatable(NitrogenDioxideConcentrationMeasurement.events, event_helper_mt)

setmetatable(NitrogenDioxideConcentrationMeasurement, {__index = cluster_base})

return NitrogenDioxideConcentrationMeasurement

