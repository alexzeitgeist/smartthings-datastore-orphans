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
local ModeSelectServerAttributes = require "st.matter.generated.zap_clusters.ModeSelect.server.attributes"
local ModeSelectServerCommands = require "st.matter.generated.zap_clusters.ModeSelect.server.commands"
local ModeSelectTypes = require "st.matter.generated.zap_clusters.ModeSelect.types"

--- @class st.matter.generated.zap_clusters.ModeSelect
--- @alias ModeSelect
---
--- @field public ID number 0x0050 the ID of this cluster
--- @field public NAME string "ModeSelect" the name of this cluster
--- @field public attributes st.matter.generated.zap_clusters.ModeSelectServerAttributes | st.matter.generated.zap_clusters.ModeSelectClientAttributes
--- @field public commands st.matter.generated.zap_clusters.ModeSelectServerCommands | st.matter.generated.zap_clusters.ModeSelectClientCommands
--- @field public types st.matter.generated.zap_clusters.ModeSelectTypes

local ModeSelect = {}

ModeSelect.ID = 0x0050
ModeSelect.NAME = "ModeSelect"
ModeSelect.server = {}
ModeSelect.client = {}
ModeSelect.server.attributes = ModeSelectServerAttributes:set_parent_cluster(ModeSelect)
ModeSelect.server.commands = ModeSelectServerCommands:set_parent_cluster(ModeSelect)
ModeSelect.types = ModeSelectTypes

--- Find an attribute by id
---
--- @param attr_id number
function ModeSelect:get_attribute_by_id(attr_id)
  local attr_id_map = {
    [0x0000] = "Description",
    [0x0001] = "StandardNamespace",
    [0x0002] = "SupportedModes",
    [0x0003] = "CurrentMode",
    [0x0004] = "StartUpMode",
    [0x0005] = "OnMode",
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
function ModeSelect:get_server_command_by_id(command_id)
  local server_id_map = {
    [0x0000] = "ChangeToMode",
  }
  if server_id_map[command_id] ~= nil then
    return self.server.commands[server_id_map[command_id]]
  end
  return nil
end


-- Attribute Mapping
ModeSelect.attribute_direction_map = {
  ["Description"] = "server",
  ["StandardNamespace"] = "server",
  ["SupportedModes"] = "server",
  ["CurrentMode"] = "server",
  ["StartUpMode"] = "server",
  ["OnMode"] = "server",
  ["AcceptedCommandList"] = "server",
  ["EventList"] = "server",
  ["AttributeList"] = "server",
}

do
  local has_aliases, aliases = pcall(require, "st.matter.clusters.aliases.ModeSelect.server.attributes")
  if has_aliases then
    for alias, _ in pairs(aliases) do
      ModeSelect.attribute_direction_map[alias] = "server"
    end
  end
end

-- Command Mapping
ModeSelect.command_direction_map = {
  ["ChangeToMode"] = "server",
}

do
  local has_aliases, aliases = pcall(require, "st.matter.clusters.aliases.ModeSelect.server.commands")
  if has_aliases then
    for alias, _ in pairs(aliases) do
      ModeSelect.command_direction_map[alias] = "server"
    end
  end
end

do
  local has_aliases, aliases = pcall(require, "st.matter.clusters.aliases.ModeSelect.client.commands")
  if has_aliases then
    for alias, _ in pairs(aliases) do
      ModeSelect.command_direction_map[alias] = "client"
    end
  end
end

ModeSelect.FeatureMap = ModeSelect.types.Feature

function ModeSelect.are_features_supported(feature, feature_map)
  if (ModeSelect.FeatureMap.bits_are_valid(feature)) then
    return (feature & feature_map) == feature
  end
  return false
end

-- Cluster Completion
local attribute_helper_mt = {}
attribute_helper_mt.__index = function(self, key)
  local direction = ModeSelect.attribute_direction_map[key]
  if direction == nil then
    error(string.format("Referenced unknown attribute %s on cluster %s", key, ModeSelect.NAME))
  end
  return ModeSelect[direction].attributes[key]
end
ModeSelect.attributes = {}
setmetatable(ModeSelect.attributes, attribute_helper_mt)

local command_helper_mt = {}
command_helper_mt.__index = function(self, key)
  local direction = ModeSelect.command_direction_map[key]
  if direction == nil then
    error(string.format("Referenced unknown command %s on cluster %s", key, ModeSelect.NAME))
  end
  return ModeSelect[direction].commands[key]
end
ModeSelect.commands = {}
setmetatable(ModeSelect.commands, command_helper_mt)

local event_helper_mt = {}
event_helper_mt.__index = function(self, key)
  return ModeSelect.server.events[key]
end
ModeSelect.events = {}
setmetatable(ModeSelect.events, event_helper_mt)

setmetatable(ModeSelect, {__index = cluster_base})

return ModeSelect

