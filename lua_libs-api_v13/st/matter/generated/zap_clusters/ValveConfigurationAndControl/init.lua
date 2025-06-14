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
local ValveConfigurationAndControlServerAttributes = require "st.matter.generated.zap_clusters.ValveConfigurationAndControl.server.attributes"
local ValveConfigurationAndControlServerCommands = require "st.matter.generated.zap_clusters.ValveConfigurationAndControl.server.commands"
local ValveConfigurationAndControlEvents = require "st.matter.generated.zap_clusters.ValveConfigurationAndControl.server.events"
local ValveConfigurationAndControlTypes = require "st.matter.generated.zap_clusters.ValveConfigurationAndControl.types"

--- @class st.matter.generated.zap_clusters.ValveConfigurationAndControl
--- @alias ValveConfigurationAndControl
---
--- @field public ID number 0x0081 the ID of this cluster
--- @field public NAME string "ValveConfigurationAndControl" the name of this cluster
--- @field public attributes st.matter.generated.zap_clusters.ValveConfigurationAndControlServerAttributes | st.matter.generated.zap_clusters.ValveConfigurationAndControlClientAttributes
--- @field public commands st.matter.generated.zap_clusters.ValveConfigurationAndControlServerCommands | st.matter.generated.zap_clusters.ValveConfigurationAndControlClientCommands
--- @field public types st.matter.generated.zap_clusters.ValveConfigurationAndControlTypes

local ValveConfigurationAndControl = {}

ValveConfigurationAndControl.ID = 0x0081
ValveConfigurationAndControl.NAME = "ValveConfigurationAndControl"
ValveConfigurationAndControl.server = {}
ValveConfigurationAndControl.client = {}
ValveConfigurationAndControl.server.attributes = ValveConfigurationAndControlServerAttributes:set_parent_cluster(ValveConfigurationAndControl)
ValveConfigurationAndControl.server.commands = ValveConfigurationAndControlServerCommands:set_parent_cluster(ValveConfigurationAndControl)
ValveConfigurationAndControl.server.events = ValveConfigurationAndControlEvents:set_parent_cluster(ValveConfigurationAndControl)
ValveConfigurationAndControl.types = ValveConfigurationAndControlTypes

--- Find an attribute by id
---
--- @param attr_id number
function ValveConfigurationAndControl:get_attribute_by_id(attr_id)
  local attr_id_map = {
    [0x0000] = "OpenDuration",
    [0x0001] = "DefaultOpenDuration",
    [0x0002] = "AutoCloseTime",
    [0x0003] = "RemainingDuration",
    [0x0004] = "CurrentState",
    [0x0005] = "TargetState",
    [0x0006] = "CurrentLevel",
    [0x0007] = "TargetLevel",
    [0x0008] = "DefaultOpenLevel",
    [0x0009] = "ValveFault",
    [0x000A] = "LevelStep",
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
function ValveConfigurationAndControl:get_server_command_by_id(command_id)
  local server_id_map = {
    [0x0000] = "Open",
    [0x0001] = "Close",
  }
  if server_id_map[command_id] ~= nil then
    return self.server.commands[server_id_map[command_id]]
  end
  return nil
end


--- Find an event by id
---
--- @param event_id number
function ValveConfigurationAndControl:get_event_by_id(event_id)
  local event_id_map = {
    [0x0000] = "ValveStateChanged",
    [0x0001] = "ValveFault",
  }
  if event_id_map[event_id] ~= nil then
    return self.server.events[event_id_map[event_id]]
  end
  return nil
end
-- Attribute Mapping
ValveConfigurationAndControl.attribute_direction_map = {
  ["OpenDuration"] = "server",
  ["DefaultOpenDuration"] = "server",
  ["AutoCloseTime"] = "server",
  ["RemainingDuration"] = "server",
  ["CurrentState"] = "server",
  ["TargetState"] = "server",
  ["CurrentLevel"] = "server",
  ["TargetLevel"] = "server",
  ["DefaultOpenLevel"] = "server",
  ["ValveFault"] = "server",
  ["LevelStep"] = "server",
  ["AcceptedCommandList"] = "server",
  ["EventList"] = "server",
  ["AttributeList"] = "server",
}

do
  local has_aliases, aliases = pcall(require, "st.matter.clusters.aliases.ValveConfigurationAndControl.server.attributes")
  if has_aliases then
    for alias, _ in pairs(aliases) do
      ValveConfigurationAndControl.attribute_direction_map[alias] = "server"
    end
  end
end

-- Command Mapping
ValveConfigurationAndControl.command_direction_map = {
  ["Open"] = "server",
  ["Close"] = "server",
}

do
  local has_aliases, aliases = pcall(require, "st.matter.clusters.aliases.ValveConfigurationAndControl.server.commands")
  if has_aliases then
    for alias, _ in pairs(aliases) do
      ValveConfigurationAndControl.command_direction_map[alias] = "server"
    end
  end
end

do
  local has_aliases, aliases = pcall(require, "st.matter.clusters.aliases.ValveConfigurationAndControl.client.commands")
  if has_aliases then
    for alias, _ in pairs(aliases) do
      ValveConfigurationAndControl.command_direction_map[alias] = "client"
    end
  end
end

ValveConfigurationAndControl.FeatureMap = ValveConfigurationAndControl.types.Feature

function ValveConfigurationAndControl.are_features_supported(feature, feature_map)
  if (ValveConfigurationAndControl.FeatureMap.bits_are_valid(feature)) then
    return (feature & feature_map) == feature
  end
  return false
end

-- Cluster Completion
local attribute_helper_mt = {}
attribute_helper_mt.__index = function(self, key)
  local direction = ValveConfigurationAndControl.attribute_direction_map[key]
  if direction == nil then
    error(string.format("Referenced unknown attribute %s on cluster %s", key, ValveConfigurationAndControl.NAME))
  end
  return ValveConfigurationAndControl[direction].attributes[key]
end
ValveConfigurationAndControl.attributes = {}
setmetatable(ValveConfigurationAndControl.attributes, attribute_helper_mt)

local command_helper_mt = {}
command_helper_mt.__index = function(self, key)
  local direction = ValveConfigurationAndControl.command_direction_map[key]
  if direction == nil then
    error(string.format("Referenced unknown command %s on cluster %s", key, ValveConfigurationAndControl.NAME))
  end
  return ValveConfigurationAndControl[direction].commands[key]
end
ValveConfigurationAndControl.commands = {}
setmetatable(ValveConfigurationAndControl.commands, command_helper_mt)

local event_helper_mt = {}
event_helper_mt.__index = function(self, key)
  return ValveConfigurationAndControl.server.events[key]
end
ValveConfigurationAndControl.events = {}
setmetatable(ValveConfigurationAndControl.events, event_helper_mt)

setmetatable(ValveConfigurationAndControl, {__index = cluster_base})

return ValveConfigurationAndControl

