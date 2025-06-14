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
local LowPowerServerAttributes = require "st.matter.generated.zap_clusters.LowPower.server.attributes"
local LowPowerServerCommands = require "st.matter.generated.zap_clusters.LowPower.server.commands"
local LowPowerTypes = require "st.matter.generated.zap_clusters.LowPower.types"

--- @class st.matter.generated.zap_clusters.LowPower
--- @alias LowPower
---
--- @field public ID number 0x0508 the ID of this cluster
--- @field public NAME string "LowPower" the name of this cluster
--- @field public attributes st.matter.generated.zap_clusters.LowPowerServerAttributes | st.matter.generated.zap_clusters.LowPowerClientAttributes
--- @field public commands st.matter.generated.zap_clusters.LowPowerServerCommands | st.matter.generated.zap_clusters.LowPowerClientCommands
--- @field public types st.matter.generated.zap_clusters.LowPowerTypes

local LowPower = {}

LowPower.ID = 0x0508
LowPower.NAME = "LowPower"
LowPower.server = {}
LowPower.client = {}
LowPower.server.attributes = LowPowerServerAttributes:set_parent_cluster(LowPower)
LowPower.server.commands = LowPowerServerCommands:set_parent_cluster(LowPower)
LowPower.types = LowPowerTypes

--- Find an attribute by id
---
--- @param attr_id number
function LowPower:get_attribute_by_id(attr_id)
  local attr_id_map = {
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
function LowPower:get_server_command_by_id(command_id)
  local server_id_map = {
    [0x0000] = "Sleep",
  }
  if server_id_map[command_id] ~= nil then
    return self.server.commands[server_id_map[command_id]]
  end
  return nil
end


-- Attribute Mapping
LowPower.attribute_direction_map = {
  ["AcceptedCommandList"] = "server",
  ["EventList"] = "server",
  ["AttributeList"] = "server",
}

do
  local has_aliases, aliases = pcall(require, "st.matter.clusters.aliases.LowPower.server.attributes")
  if has_aliases then
    for alias, _ in pairs(aliases) do
      LowPower.attribute_direction_map[alias] = "server"
    end
  end
end

-- Command Mapping
LowPower.command_direction_map = {
  ["Sleep"] = "server",
}

do
  local has_aliases, aliases = pcall(require, "st.matter.clusters.aliases.LowPower.server.commands")
  if has_aliases then
    for alias, _ in pairs(aliases) do
      LowPower.command_direction_map[alias] = "server"
    end
  end
end

do
  local has_aliases, aliases = pcall(require, "st.matter.clusters.aliases.LowPower.client.commands")
  if has_aliases then
    for alias, _ in pairs(aliases) do
      LowPower.command_direction_map[alias] = "client"
    end
  end
end

-- Cluster Completion
local attribute_helper_mt = {}
attribute_helper_mt.__index = function(self, key)
  local direction = LowPower.attribute_direction_map[key]
  if direction == nil then
    error(string.format("Referenced unknown attribute %s on cluster %s", key, LowPower.NAME))
  end
  return LowPower[direction].attributes[key]
end
LowPower.attributes = {}
setmetatable(LowPower.attributes, attribute_helper_mt)

local command_helper_mt = {}
command_helper_mt.__index = function(self, key)
  local direction = LowPower.command_direction_map[key]
  if direction == nil then
    error(string.format("Referenced unknown command %s on cluster %s", key, LowPower.NAME))
  end
  return LowPower[direction].commands[key]
end
LowPower.commands = {}
setmetatable(LowPower.commands, command_helper_mt)

local event_helper_mt = {}
event_helper_mt.__index = function(self, key)
  return LowPower.server.events[key]
end
LowPower.events = {}
setmetatable(LowPower.events, event_helper_mt)

setmetatable(LowPower, {__index = cluster_base})

return LowPower

