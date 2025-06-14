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
local ApplicationLauncherServerAttributes = require "st.matter.generated.zap_clusters.ApplicationLauncher.server.attributes"
local ApplicationLauncherServerCommands = require "st.matter.generated.zap_clusters.ApplicationLauncher.server.commands"
local ApplicationLauncherClientCommands = require "st.matter.generated.zap_clusters.ApplicationLauncher.client.commands"
local ApplicationLauncherTypes = require "st.matter.generated.zap_clusters.ApplicationLauncher.types"

--- @class st.matter.generated.zap_clusters.ApplicationLauncher
--- @alias ApplicationLauncher
---
--- @field public ID number 0x050C the ID of this cluster
--- @field public NAME string "ApplicationLauncher" the name of this cluster
--- @field public attributes st.matter.generated.zap_clusters.ApplicationLauncherServerAttributes | st.matter.generated.zap_clusters.ApplicationLauncherClientAttributes
--- @field public commands st.matter.generated.zap_clusters.ApplicationLauncherServerCommands | st.matter.generated.zap_clusters.ApplicationLauncherClientCommands
--- @field public types st.matter.generated.zap_clusters.ApplicationLauncherTypes

local ApplicationLauncher = {}

ApplicationLauncher.ID = 0x050C
ApplicationLauncher.NAME = "ApplicationLauncher"
ApplicationLauncher.server = {}
ApplicationLauncher.client = {}
ApplicationLauncher.server.attributes = ApplicationLauncherServerAttributes:set_parent_cluster(ApplicationLauncher)
ApplicationLauncher.server.commands = ApplicationLauncherServerCommands:set_parent_cluster(ApplicationLauncher)
ApplicationLauncher.client.commands = ApplicationLauncherClientCommands:set_parent_cluster(ApplicationLauncher)
ApplicationLauncher.types = ApplicationLauncherTypes

--- Find an attribute by id
---
--- @param attr_id number
function ApplicationLauncher:get_attribute_by_id(attr_id)
  local attr_id_map = {
    [0x0000] = "CatalogList",
    [0x0001] = "CurrentApp",
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
function ApplicationLauncher:get_server_command_by_id(command_id)
  local server_id_map = {
    [0x0000] = "LaunchApp",
    [0x0001] = "StopApp",
    [0x0002] = "HideApp",
  }
  if server_id_map[command_id] ~= nil then
    return self.server.commands[server_id_map[command_id]]
  end
  return nil
end

--- Find a client command by id
---
--- @param command_id number
function ApplicationLauncher:get_client_command_by_id(command_id)
  local client_id_map = {
    [0x0003] = "LauncherResponse",
  }
  if client_id_map[command_id] ~= nil then
    return self.client.commands[client_id_map[command_id]]
  end
  return nil
end

-- Attribute Mapping
ApplicationLauncher.attribute_direction_map = {
  ["CatalogList"] = "server",
  ["CurrentApp"] = "server",
  ["AcceptedCommandList"] = "server",
  ["EventList"] = "server",
  ["AttributeList"] = "server",
}

do
  local has_aliases, aliases = pcall(require, "st.matter.clusters.aliases.ApplicationLauncher.server.attributes")
  if has_aliases then
    for alias, _ in pairs(aliases) do
      ApplicationLauncher.attribute_direction_map[alias] = "server"
    end
  end
end

-- Command Mapping
ApplicationLauncher.command_direction_map = {
  ["LaunchApp"] = "server",
  ["StopApp"] = "server",
  ["HideApp"] = "server",
  ["LauncherResponse"] = "client",
}

do
  local has_aliases, aliases = pcall(require, "st.matter.clusters.aliases.ApplicationLauncher.server.commands")
  if has_aliases then
    for alias, _ in pairs(aliases) do
      ApplicationLauncher.command_direction_map[alias] = "server"
    end
  end
end

do
  local has_aliases, aliases = pcall(require, "st.matter.clusters.aliases.ApplicationLauncher.client.commands")
  if has_aliases then
    for alias, _ in pairs(aliases) do
      ApplicationLauncher.command_direction_map[alias] = "client"
    end
  end
end

ApplicationLauncher.FeatureMap = ApplicationLauncher.types.Feature

function ApplicationLauncher.are_features_supported(feature, feature_map)
  if (ApplicationLauncher.FeatureMap.bits_are_valid(feature)) then
    return (feature & feature_map) == feature
  end
  return false
end

-- Cluster Completion
local attribute_helper_mt = {}
attribute_helper_mt.__index = function(self, key)
  local direction = ApplicationLauncher.attribute_direction_map[key]
  if direction == nil then
    error(string.format("Referenced unknown attribute %s on cluster %s", key, ApplicationLauncher.NAME))
  end
  return ApplicationLauncher[direction].attributes[key]
end
ApplicationLauncher.attributes = {}
setmetatable(ApplicationLauncher.attributes, attribute_helper_mt)

local command_helper_mt = {}
command_helper_mt.__index = function(self, key)
  local direction = ApplicationLauncher.command_direction_map[key]
  if direction == nil then
    error(string.format("Referenced unknown command %s on cluster %s", key, ApplicationLauncher.NAME))
  end
  return ApplicationLauncher[direction].commands[key]
end
ApplicationLauncher.commands = {}
setmetatable(ApplicationLauncher.commands, command_helper_mt)

local event_helper_mt = {}
event_helper_mt.__index = function(self, key)
  return ApplicationLauncher.server.events[key]
end
ApplicationLauncher.events = {}
setmetatable(ApplicationLauncher.events, event_helper_mt)

setmetatable(ApplicationLauncher, {__index = cluster_base})

return ApplicationLauncher

