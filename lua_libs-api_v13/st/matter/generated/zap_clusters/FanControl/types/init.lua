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

local types_mt = {}
types_mt.__types_cache = {}
types_mt.__index = function(self, key)
  if types_mt.__types_cache[key] == nil then
    types_mt.__types_cache[key] = require("st.matter.generated.zap_clusters.FanControl.types." .. key)
  end
  return types_mt.__types_cache[key]
end

--- @class st.matter.generated.zap_clusters.FanControlTypes
---
--- @field public AirflowDirectionEnum st.matter.generated.zap_clusters.FanControl.types.AirflowDirectionEnum
--- @field public FanModeEnum st.matter.generated.zap_clusters.FanControl.types.FanModeEnum
--- @field public FanModeSequenceEnum st.matter.generated.zap_clusters.FanControl.types.FanModeSequenceEnum
--- @field public StepDirectionEnum st.matter.generated.zap_clusters.FanControl.types.StepDirectionEnum

--- @field public Feature st.matter.generated.zap_clusters.FanControl.types.Feature
--- @field public RockBitmap st.matter.generated.zap_clusters.FanControl.types.RockBitmap
--- @field public WindBitmap st.matter.generated.zap_clusters.FanControl.types.WindBitmap
local FanControlTypes = {}

setmetatable(FanControlTypes, types_mt)

local status, aliases = pcall(require, "st.matter.clusters.aliases.FanControl.types")
if status then
  aliases:add_to_class(FanControlTypes)
end

return FanControlTypes

