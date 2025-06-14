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
    local req_loc = string.format("st.matter.generated.zap_clusters.BallastConfiguration.server.attributes.%s", key)
    local raw_def = require(req_loc)
    local cluster = rawget(self, "_cluster")
    raw_def:set_parent_cluster(cluster)
    attr_mt.__attr_cache[key] = raw_def
  end
  return attr_mt.__attr_cache[key]
end

--- @class st.matter.generated.zap_clusters.BallastConfigurationServerAttributes
---
--- @field public PhysicalMinLevel st.matter.generated.zap_clusters.BallastConfiguration.server.attributes.PhysicalMinLevel
--- @field public PhysicalMaxLevel st.matter.generated.zap_clusters.BallastConfiguration.server.attributes.PhysicalMaxLevel
--- @field public BallastStatus st.matter.generated.zap_clusters.BallastConfiguration.server.attributes.BallastStatus
--- @field public MinLevel st.matter.generated.zap_clusters.BallastConfiguration.server.attributes.MinLevel
--- @field public MaxLevel st.matter.generated.zap_clusters.BallastConfiguration.server.attributes.MaxLevel
--- @field public IntrinsicBallastFactor st.matter.generated.zap_clusters.BallastConfiguration.server.attributes.IntrinsicBallastFactor
--- @field public BallastFactorAdjustment st.matter.generated.zap_clusters.BallastConfiguration.server.attributes.BallastFactorAdjustment
--- @field public LampQuantity st.matter.generated.zap_clusters.BallastConfiguration.server.attributes.LampQuantity
--- @field public LampType st.matter.generated.zap_clusters.BallastConfiguration.server.attributes.LampType
--- @field public LampManufacturer st.matter.generated.zap_clusters.BallastConfiguration.server.attributes.LampManufacturer
--- @field public LampRatedHours st.matter.generated.zap_clusters.BallastConfiguration.server.attributes.LampRatedHours
--- @field public LampBurnHours st.matter.generated.zap_clusters.BallastConfiguration.server.attributes.LampBurnHours
--- @field public LampAlarmMode st.matter.generated.zap_clusters.BallastConfiguration.server.attributes.LampAlarmMode
--- @field public LampBurnHoursTripPoint st.matter.generated.zap_clusters.BallastConfiguration.server.attributes.LampBurnHoursTripPoint
--- @field public AcceptedCommandList st.matter.generated.zap_clusters.BallastConfiguration.server.attributes.AcceptedCommandList
--- @field public EventList st.matter.generated.zap_clusters.BallastConfiguration.server.attributes.EventList
--- @field public AttributeList st.matter.generated.zap_clusters.BallastConfiguration.server.attributes.AttributeList
local BallastConfigurationServerAttributes = {}

function BallastConfigurationServerAttributes:set_parent_cluster(cluster)
  self._cluster = cluster
  return self
end

setmetatable(BallastConfigurationServerAttributes, attr_mt)

local has_aliases, aliases = pcall(require, "st.matter.clusters.aliases.BallastConfiguration.server.attributes")
if has_aliases then
  aliases:add_to_class(BallastConfigurationServerAttributes)
end

return BallastConfigurationServerAttributes

