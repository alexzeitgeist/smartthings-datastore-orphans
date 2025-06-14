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
    local req_loc = string.format("st.matter.generated.zap_clusters.FormaldehydeConcentrationMeasurement.server.attributes.%s", key)
    local raw_def = require(req_loc)
    local cluster = rawget(self, "_cluster")
    raw_def:set_parent_cluster(cluster)
    attr_mt.__attr_cache[key] = raw_def
  end
  return attr_mt.__attr_cache[key]
end

--- @class st.matter.generated.zap_clusters.FormaldehydeConcentrationMeasurementServerAttributes
---
--- @field public MeasuredValue st.matter.generated.zap_clusters.FormaldehydeConcentrationMeasurement.server.attributes.MeasuredValue
--- @field public MinMeasuredValue st.matter.generated.zap_clusters.FormaldehydeConcentrationMeasurement.server.attributes.MinMeasuredValue
--- @field public MaxMeasuredValue st.matter.generated.zap_clusters.FormaldehydeConcentrationMeasurement.server.attributes.MaxMeasuredValue
--- @field public PeakMeasuredValue st.matter.generated.zap_clusters.FormaldehydeConcentrationMeasurement.server.attributes.PeakMeasuredValue
--- @field public PeakMeasuredValueWindow st.matter.generated.zap_clusters.FormaldehydeConcentrationMeasurement.server.attributes.PeakMeasuredValueWindow
--- @field public AverageMeasuredValue st.matter.generated.zap_clusters.FormaldehydeConcentrationMeasurement.server.attributes.AverageMeasuredValue
--- @field public AverageMeasuredValueWindow st.matter.generated.zap_clusters.FormaldehydeConcentrationMeasurement.server.attributes.AverageMeasuredValueWindow
--- @field public Uncertainty st.matter.generated.zap_clusters.FormaldehydeConcentrationMeasurement.server.attributes.Uncertainty
--- @field public MeasurementUnit st.matter.generated.zap_clusters.FormaldehydeConcentrationMeasurement.server.attributes.MeasurementUnit
--- @field public MeasurementMedium st.matter.generated.zap_clusters.FormaldehydeConcentrationMeasurement.server.attributes.MeasurementMedium
--- @field public LevelValue st.matter.generated.zap_clusters.FormaldehydeConcentrationMeasurement.server.attributes.LevelValue
--- @field public AcceptedCommandList st.matter.generated.zap_clusters.FormaldehydeConcentrationMeasurement.server.attributes.AcceptedCommandList
--- @field public EventList st.matter.generated.zap_clusters.FormaldehydeConcentrationMeasurement.server.attributes.EventList
--- @field public AttributeList st.matter.generated.zap_clusters.FormaldehydeConcentrationMeasurement.server.attributes.AttributeList
local FormaldehydeConcentrationMeasurementServerAttributes = {}

function FormaldehydeConcentrationMeasurementServerAttributes:set_parent_cluster(cluster)
  self._cluster = cluster
  return self
end

setmetatable(FormaldehydeConcentrationMeasurementServerAttributes, attr_mt)

local has_aliases, aliases = pcall(require, "st.matter.clusters.aliases.FormaldehydeConcentrationMeasurement.server.attributes")
if has_aliases then
  aliases:add_to_class(FormaldehydeConcentrationMeasurementServerAttributes)
end

return FormaldehydeConcentrationMeasurementServerAttributes

