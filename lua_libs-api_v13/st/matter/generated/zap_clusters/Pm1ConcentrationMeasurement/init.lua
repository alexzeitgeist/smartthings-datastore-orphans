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
local Pm1ConcentrationMeasurementServerAttributes = require "st.matter.generated.zap_clusters.Pm1ConcentrationMeasurement.server.attributes"
local Pm1ConcentrationMeasurementServerCommands = require "st.matter.generated.zap_clusters.Pm1ConcentrationMeasurement.server.commands"
local Pm1ConcentrationMeasurementTypes = require "st.matter.generated.zap_clusters.Pm1ConcentrationMeasurement.types"

--- @class st.matter.generated.zap_clusters.Pm1ConcentrationMeasurement
--- @alias Pm1ConcentrationMeasurement
---
--- @field public ID number 0x042C the ID of this cluster
--- @field public NAME string "Pm1ConcentrationMeasurement" the name of this cluster
--- @field public attributes st.matter.generated.zap_clusters.Pm1ConcentrationMeasurementServerAttributes | st.matter.generated.zap_clusters.Pm1ConcentrationMeasurementClientAttributes
--- @field public commands st.matter.generated.zap_clusters.Pm1ConcentrationMeasurementServerCommands | st.matter.generated.zap_clusters.Pm1ConcentrationMeasurementClientCommands
--- @field public types st.matter.generated.zap_clusters.Pm1ConcentrationMeasurementTypes

local Pm1ConcentrationMeasurement = {}

Pm1ConcentrationMeasurement.ID = 0x042C
Pm1ConcentrationMeasurement.NAME = "Pm1ConcentrationMeasurement"
Pm1ConcentrationMeasurement.server = {}
Pm1ConcentrationMeasurement.client = {}
Pm1ConcentrationMeasurement.server.attributes = Pm1ConcentrationMeasurementServerAttributes:set_parent_cluster(Pm1ConcentrationMeasurement)
Pm1ConcentrationMeasurement.server.commands = Pm1ConcentrationMeasurementServerCommands:set_parent_cluster(Pm1ConcentrationMeasurement)
Pm1ConcentrationMeasurement.types = Pm1ConcentrationMeasurementTypes

--- Find an attribute by id
---
--- @param attr_id number
function Pm1ConcentrationMeasurement:get_attribute_by_id(attr_id)
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
function Pm1ConcentrationMeasurement:get_server_command_by_id(command_id)
  local server_id_map = {
  }
  if server_id_map[command_id] ~= nil then
    return self.server.commands[server_id_map[command_id]]
  end
  return nil
end


-- Attribute Mapping
Pm1ConcentrationMeasurement.attribute_direction_map = {
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
  local has_aliases, aliases = pcall(require, "st.matter.clusters.aliases.Pm1ConcentrationMeasurement.server.attributes")
  if has_aliases then
    for alias, _ in pairs(aliases) do
      Pm1ConcentrationMeasurement.attribute_direction_map[alias] = "server"
    end
  end
end

-- Command Mapping
Pm1ConcentrationMeasurement.command_direction_map = {
}

do
  local has_aliases, aliases = pcall(require, "st.matter.clusters.aliases.Pm1ConcentrationMeasurement.server.commands")
  if has_aliases then
    for alias, _ in pairs(aliases) do
      Pm1ConcentrationMeasurement.command_direction_map[alias] = "server"
    end
  end
end

do
  local has_aliases, aliases = pcall(require, "st.matter.clusters.aliases.Pm1ConcentrationMeasurement.client.commands")
  if has_aliases then
    for alias, _ in pairs(aliases) do
      Pm1ConcentrationMeasurement.command_direction_map[alias] = "client"
    end
  end
end

Pm1ConcentrationMeasurement.FeatureMap = Pm1ConcentrationMeasurement.types.Feature

function Pm1ConcentrationMeasurement.are_features_supported(feature, feature_map)
  if (Pm1ConcentrationMeasurement.FeatureMap.bits_are_valid(feature)) then
    return (feature & feature_map) == feature
  end
  return false
end

-- Cluster Completion
local attribute_helper_mt = {}
attribute_helper_mt.__index = function(self, key)
  local direction = Pm1ConcentrationMeasurement.attribute_direction_map[key]
  if direction == nil then
    error(string.format("Referenced unknown attribute %s on cluster %s", key, Pm1ConcentrationMeasurement.NAME))
  end
  return Pm1ConcentrationMeasurement[direction].attributes[key]
end
Pm1ConcentrationMeasurement.attributes = {}
setmetatable(Pm1ConcentrationMeasurement.attributes, attribute_helper_mt)

local command_helper_mt = {}
command_helper_mt.__index = function(self, key)
  local direction = Pm1ConcentrationMeasurement.command_direction_map[key]
  if direction == nil then
    error(string.format("Referenced unknown command %s on cluster %s", key, Pm1ConcentrationMeasurement.NAME))
  end
  return Pm1ConcentrationMeasurement[direction].commands[key]
end
Pm1ConcentrationMeasurement.commands = {}
setmetatable(Pm1ConcentrationMeasurement.commands, command_helper_mt)

local event_helper_mt = {}
event_helper_mt.__index = function(self, key)
  return Pm1ConcentrationMeasurement.server.events[key]
end
Pm1ConcentrationMeasurement.events = {}
setmetatable(Pm1ConcentrationMeasurement.events, event_helper_mt)

setmetatable(Pm1ConcentrationMeasurement, {__index = cluster_base})

return Pm1ConcentrationMeasurement

