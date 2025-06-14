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

local attr_mt = {}
attr_mt.__attr_cache = {}
attr_mt.__index = function(self, key)
  if attr_mt.__attr_cache[key] == nil then
    local req_loc = string.format("st.matter.generated.zap_clusters.ValveConfigurationAndControl.server.attributes.%s", key)
    local raw_def = require(req_loc)
    local cluster = rawget(self, "_cluster")
    raw_def:set_parent_cluster(cluster)
    attr_mt.__attr_cache[key] = raw_def
  end
  return attr_mt.__attr_cache[key]
end

--- @class st.matter.generated.zap_clusters.ValveConfigurationAndControlServerAttributes
---
--- @field public OpenDuration st.matter.generated.zap_clusters.ValveConfigurationAndControl.server.attributes.OpenDuration
--- @field public DefaultOpenDuration st.matter.generated.zap_clusters.ValveConfigurationAndControl.server.attributes.DefaultOpenDuration
--- @field public AutoCloseTime st.matter.generated.zap_clusters.ValveConfigurationAndControl.server.attributes.AutoCloseTime
--- @field public RemainingDuration st.matter.generated.zap_clusters.ValveConfigurationAndControl.server.attributes.RemainingDuration
--- @field public CurrentState st.matter.generated.zap_clusters.ValveConfigurationAndControl.server.attributes.CurrentState
--- @field public TargetState st.matter.generated.zap_clusters.ValveConfigurationAndControl.server.attributes.TargetState
--- @field public CurrentLevel st.matter.generated.zap_clusters.ValveConfigurationAndControl.server.attributes.CurrentLevel
--- @field public TargetLevel st.matter.generated.zap_clusters.ValveConfigurationAndControl.server.attributes.TargetLevel
--- @field public DefaultOpenLevel st.matter.generated.zap_clusters.ValveConfigurationAndControl.server.attributes.DefaultOpenLevel
--- @field public ValveFault st.matter.generated.zap_clusters.ValveConfigurationAndControl.server.attributes.ValveFault
--- @field public LevelStep st.matter.generated.zap_clusters.ValveConfigurationAndControl.server.attributes.LevelStep
--- @field public AcceptedCommandList st.matter.generated.zap_clusters.ValveConfigurationAndControl.server.attributes.AcceptedCommandList
--- @field public EventList st.matter.generated.zap_clusters.ValveConfigurationAndControl.server.attributes.EventList
--- @field public AttributeList st.matter.generated.zap_clusters.ValveConfigurationAndControl.server.attributes.AttributeList
local ValveConfigurationAndControlServerAttributes = {}

function ValveConfigurationAndControlServerAttributes:set_parent_cluster(cluster)
  self._cluster = cluster
  return self
end

setmetatable(ValveConfigurationAndControlServerAttributes, attr_mt)

local has_aliases, aliases = pcall(require, "st.matter.clusters.aliases.ValveConfigurationAndControl.server.attributes")
if has_aliases then
  aliases:add_to_class(ValveConfigurationAndControlServerAttributes)
end

return ValveConfigurationAndControlServerAttributes

