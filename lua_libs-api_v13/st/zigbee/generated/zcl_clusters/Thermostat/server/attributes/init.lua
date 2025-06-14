-- Copyright 2024 SmartThings
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--     http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.

-- DO NOT EDIT: this code is automatically generated by tools/zigbee_lib_generator/generate_clusters_from_xml.py
-- ZCL XML version: 7.2

local attr_mt = {}
attr_mt.__attr_cache = {}
attr_mt.__index = function(self, key)
  if attr_mt.__attr_cache[key] == nil then
    local req_loc = string.format("st.zigbee.generated.zcl_clusters.Thermostat.server.attributes.%s", key)
    local raw_def = require(req_loc)
    local cluster = rawget(self, "_cluster")
    raw_def:set_parent_cluster(cluster)
    attr_mt.__attr_cache[key] = raw_def
  end
  return attr_mt.__attr_cache[key]
end


--- @class st.zigbee.zcl.clusters.ThermostatServerAttributes
---
--- @field public LocalTemperature st.zigbee.zcl.clusters.Thermostat.LocalTemperature
--- @field public OutdoorTemperature st.zigbee.zcl.clusters.Thermostat.OutdoorTemperature
--- @field public Occupancy st.zigbee.zcl.clusters.Thermostat.Occupancy
--- @field public AbsMinHeatSetpointLimit st.zigbee.zcl.clusters.Thermostat.AbsMinHeatSetpointLimit
--- @field public AbsMaxHeatSetpointLimit st.zigbee.zcl.clusters.Thermostat.AbsMaxHeatSetpointLimit
--- @field public AbsMinCoolSetpointLimit st.zigbee.zcl.clusters.Thermostat.AbsMinCoolSetpointLimit
--- @field public AbsMaxCoolSetpointLimit st.zigbee.zcl.clusters.Thermostat.AbsMaxCoolSetpointLimit
--- @field public PICoolingDemand st.zigbee.zcl.clusters.Thermostat.PICoolingDemand
--- @field public PIHeatingDemand st.zigbee.zcl.clusters.Thermostat.PIHeatingDemand
--- @field public HVACSystemTypeConfiguration st.zigbee.zcl.clusters.Thermostat.HVACSystemTypeConfiguration
--- @field public LocalTemperatureCalibration st.zigbee.zcl.clusters.Thermostat.LocalTemperatureCalibration
--- @field public OccupiedCoolingSetpoint st.zigbee.zcl.clusters.Thermostat.OccupiedCoolingSetpoint
--- @field public OccupiedHeatingSetpoint st.zigbee.zcl.clusters.Thermostat.OccupiedHeatingSetpoint
--- @field public UnoccupiedCoolingSetpoint st.zigbee.zcl.clusters.Thermostat.UnoccupiedCoolingSetpoint
--- @field public UnoccupiedHeatingSetpoint st.zigbee.zcl.clusters.Thermostat.UnoccupiedHeatingSetpoint
--- @field public MinHeatSetpointLimit st.zigbee.zcl.clusters.Thermostat.MinHeatSetpointLimit
--- @field public MaxHeatSetpointLimit st.zigbee.zcl.clusters.Thermostat.MaxHeatSetpointLimit
--- @field public MinCoolSetpointLimit st.zigbee.zcl.clusters.Thermostat.MinCoolSetpointLimit
--- @field public MaxCoolSetpointLimit st.zigbee.zcl.clusters.Thermostat.MaxCoolSetpointLimit
--- @field public MinSetpointDeadBand st.zigbee.zcl.clusters.Thermostat.MinSetpointDeadBand
--- @field public RemoteSensing st.zigbee.zcl.clusters.Thermostat.RemoteSensing
--- @field public ControlSequenceOfOperation st.zigbee.zcl.clusters.Thermostat.ControlSequenceOfOperation
--- @field public SystemMode st.zigbee.zcl.clusters.Thermostat.SystemMode
--- @field public AlarmMask st.zigbee.zcl.clusters.Thermostat.AlarmMask
--- @field public ThermostatRunningMode st.zigbee.zcl.clusters.Thermostat.ThermostatRunningMode
--- @field public StartOfWeek st.zigbee.zcl.clusters.Thermostat.StartOfWeek
--- @field public NumberOfWeeklyTransitions st.zigbee.zcl.clusters.Thermostat.NumberOfWeeklyTransitions
--- @field public NumberOfDailyTransitions st.zigbee.zcl.clusters.Thermostat.NumberOfDailyTransitions
--- @field public TemperatureSetpointHold st.zigbee.zcl.clusters.Thermostat.TemperatureSetpointHold
--- @field public TemperatureSetpointHoldDuration st.zigbee.zcl.clusters.Thermostat.TemperatureSetpointHoldDuration
--- @field public ThermostatProgrammingOperationMode st.zigbee.zcl.clusters.Thermostat.ThermostatProgrammingOperationMode
--- @field public ThermostatRunningState st.zigbee.zcl.clusters.Thermostat.ThermostatRunningState
--- @field public SetpointChangeSource st.zigbee.zcl.clusters.Thermostat.SetpointChangeSource
--- @field public SetpointChangeAmount st.zigbee.zcl.clusters.Thermostat.SetpointChangeAmount
--- @field public SetpointChangeSourceTimestamp st.zigbee.zcl.clusters.Thermostat.SetpointChangeSourceTimestamp
--- @field public OccupiedSetback st.zigbee.zcl.clusters.Thermostat.OccupiedSetback
--- @field public OccupiedSetbackMin st.zigbee.zcl.clusters.Thermostat.OccupiedSetbackMin
--- @field public OccupiedSetbackMax st.zigbee.zcl.clusters.Thermostat.OccupiedSetbackMax
--- @field public UnoccupiedSetback st.zigbee.zcl.clusters.Thermostat.UnoccupiedSetback
--- @field public UnoccupiedSetbackMin st.zigbee.zcl.clusters.Thermostat.UnoccupiedSetbackMin
--- @field public UnoccupiedSetbackMax st.zigbee.zcl.clusters.Thermostat.UnoccupiedSetbackMax
--- @field public EmergencyHeatDelta st.zigbee.zcl.clusters.Thermostat.EmergencyHeatDelta
--- @field public ACType st.zigbee.zcl.clusters.Thermostat.ACType
--- @field public ACCapacity st.zigbee.zcl.clusters.Thermostat.ACCapacity
--- @field public ACRefrigerantType st.zigbee.zcl.clusters.Thermostat.ACRefrigerantType
--- @field public ACCompressorType st.zigbee.zcl.clusters.Thermostat.ACCompressorType
--- @field public ACErrorCode st.zigbee.zcl.clusters.Thermostat.ACErrorCode
--- @field public ACLouverPosition st.zigbee.zcl.clusters.Thermostat.ACLouverPosition
--- @field public ACCoilTemperature st.zigbee.zcl.clusters.Thermostat.ACCoilTemperature
--- @field public ACCapacityFormat st.zigbee.zcl.clusters.Thermostat.ACCapacityFormat

local ThermostatServerAttributes = {}

function ThermostatServerAttributes:set_parent_cluster(cluster)
  self._cluster = cluster
  return self
end

setmetatable(ThermostatServerAttributes, attr_mt)

return ThermostatServerAttributes
