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
local ContentLauncherServerAttributes = require "st.matter.generated.zap_clusters.ContentLauncher.server.attributes"
local ContentLauncherServerCommands = require "st.matter.generated.zap_clusters.ContentLauncher.server.commands"
local ContentLauncherClientCommands = require "st.matter.generated.zap_clusters.ContentLauncher.client.commands"
local ContentLauncherTypes = require "st.matter.generated.zap_clusters.ContentLauncher.types"

--- @class st.matter.generated.zap_clusters.ContentLauncher
--- @alias ContentLauncher
---
--- @field public ID number 0x050A the ID of this cluster
--- @field public NAME string "ContentLauncher" the name of this cluster
--- @field public attributes st.matter.generated.zap_clusters.ContentLauncherServerAttributes | st.matter.generated.zap_clusters.ContentLauncherClientAttributes
--- @field public commands st.matter.generated.zap_clusters.ContentLauncherServerCommands | st.matter.generated.zap_clusters.ContentLauncherClientCommands
--- @field public types st.matter.generated.zap_clusters.ContentLauncherTypes

local ContentLauncher = {}

ContentLauncher.ID = 0x050A
ContentLauncher.NAME = "ContentLauncher"
ContentLauncher.server = {}
ContentLauncher.client = {}
ContentLauncher.server.attributes = ContentLauncherServerAttributes:set_parent_cluster(ContentLauncher)
ContentLauncher.server.commands = ContentLauncherServerCommands:set_parent_cluster(ContentLauncher)
ContentLauncher.client.commands = ContentLauncherClientCommands:set_parent_cluster(ContentLauncher)
ContentLauncher.types = ContentLauncherTypes

--- Find an attribute by id
---
--- @param attr_id number
function ContentLauncher:get_attribute_by_id(attr_id)
  local attr_id_map = {
    [0x0000] = "AcceptHeader",
    [0x0001] = "SupportedStreamingProtocols",
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
function ContentLauncher:get_server_command_by_id(command_id)
  local server_id_map = {
    [0x0000] = "LaunchContent",
    [0x0001] = "LaunchURL",
  }
  if server_id_map[command_id] ~= nil then
    return self.server.commands[server_id_map[command_id]]
  end
  return nil
end

--- Find a client command by id
---
--- @param command_id number
function ContentLauncher:get_client_command_by_id(command_id)
  local client_id_map = {
    [0x0002] = "LauncherResponse",
  }
  if client_id_map[command_id] ~= nil then
    return self.client.commands[client_id_map[command_id]]
  end
  return nil
end

-- Attribute Mapping
ContentLauncher.attribute_direction_map = {
  ["AcceptHeader"] = "server",
  ["SupportedStreamingProtocols"] = "server",
  ["AcceptedCommandList"] = "server",
  ["EventList"] = "server",
  ["AttributeList"] = "server",
}

do
  local has_aliases, aliases = pcall(require, "st.matter.clusters.aliases.ContentLauncher.server.attributes")
  if has_aliases then
    for alias, _ in pairs(aliases) do
      ContentLauncher.attribute_direction_map[alias] = "server"
    end
  end
end

-- Command Mapping
ContentLauncher.command_direction_map = {
  ["LaunchContent"] = "server",
  ["LaunchURL"] = "server",
  ["LauncherResponse"] = "client",
}

do
  local has_aliases, aliases = pcall(require, "st.matter.clusters.aliases.ContentLauncher.server.commands")
  if has_aliases then
    for alias, _ in pairs(aliases) do
      ContentLauncher.command_direction_map[alias] = "server"
    end
  end
end

do
  local has_aliases, aliases = pcall(require, "st.matter.clusters.aliases.ContentLauncher.client.commands")
  if has_aliases then
    for alias, _ in pairs(aliases) do
      ContentLauncher.command_direction_map[alias] = "client"
    end
  end
end

ContentLauncher.FeatureMap = ContentLauncher.types.Feature

function ContentLauncher.are_features_supported(feature, feature_map)
  if (ContentLauncher.FeatureMap.bits_are_valid(feature)) then
    return (feature & feature_map) == feature
  end
  return false
end

-- Cluster Completion
local attribute_helper_mt = {}
attribute_helper_mt.__index = function(self, key)
  local direction = ContentLauncher.attribute_direction_map[key]
  if direction == nil then
    error(string.format("Referenced unknown attribute %s on cluster %s", key, ContentLauncher.NAME))
  end
  return ContentLauncher[direction].attributes[key]
end
ContentLauncher.attributes = {}
setmetatable(ContentLauncher.attributes, attribute_helper_mt)

local command_helper_mt = {}
command_helper_mt.__index = function(self, key)
  local direction = ContentLauncher.command_direction_map[key]
  if direction == nil then
    error(string.format("Referenced unknown command %s on cluster %s", key, ContentLauncher.NAME))
  end
  return ContentLauncher[direction].commands[key]
end
ContentLauncher.commands = {}
setmetatable(ContentLauncher.commands, command_helper_mt)

local event_helper_mt = {}
event_helper_mt.__index = function(self, key)
  return ContentLauncher.server.events[key]
end
ContentLauncher.events = {}
setmetatable(ContentLauncher.events, event_helper_mt)

setmetatable(ContentLauncher, {__index = cluster_base})

return ContentLauncher

