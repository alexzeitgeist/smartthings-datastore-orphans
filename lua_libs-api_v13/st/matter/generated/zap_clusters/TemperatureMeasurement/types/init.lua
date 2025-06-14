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
    types_mt.__types_cache[key] = require("st.matter.generated.zap_clusters.TemperatureMeasurement.types." .. key)
  end
  return types_mt.__types_cache[key]
end

--- @class st.matter.generated.zap_clusters.TemperatureMeasurementTypes
---

local TemperatureMeasurementTypes = {}

setmetatable(TemperatureMeasurementTypes, types_mt)

local status, aliases = pcall(require, "st.matter.clusters.aliases.TemperatureMeasurement.types")
if status then
  aliases:add_to_class(TemperatureMeasurementTypes)
end

return TemperatureMeasurementTypes

