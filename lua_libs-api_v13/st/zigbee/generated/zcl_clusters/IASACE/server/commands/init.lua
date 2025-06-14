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

local command_mt = {}
command_mt.__command_cache = {}
command_mt.__index = function(self, key)
  if command_mt.__command_cache[key] == nil then
    local req_loc = string.format("st.zigbee.generated.zcl_clusters.IASACE.server.commands.%s", key)
    local raw_def = require(req_loc)
    local cluster = rawget(self, "_cluster")
    command_mt.__command_cache[key] = raw_def:set_parent_cluster(cluster)
  end
  return command_mt.__command_cache[key]
end
--- @class st.zigbee.zcl.clusters.IASACEServerCommands
---
--- @field public Arm st.zigbee.zcl.clusters.IASACE.Arm
--- @field public Bypass st.zigbee.zcl.clusters.IASACE.Bypass
--- @field public Emergency st.zigbee.zcl.clusters.IASACE.Emergency
--- @field public Fire st.zigbee.zcl.clusters.IASACE.Fire
--- @field public Panic st.zigbee.zcl.clusters.IASACE.Panic
--- @field public GetZoneIDMap st.zigbee.zcl.clusters.IASACE.GetZoneIDMap
--- @field public GetZoneInformation st.zigbee.zcl.clusters.IASACE.GetZoneInformation
--- @field public GetPanelStatus st.zigbee.zcl.clusters.IASACE.GetPanelStatus
--- @field public GetBypassedZoneList st.zigbee.zcl.clusters.IASACE.GetBypassedZoneList
--- @field public GetZoneStatus st.zigbee.zcl.clusters.IASACE.GetZoneStatus
local IASACEServerCommands = {}

function IASACEServerCommands:set_parent_cluster(cluster)
  self._cluster = cluster
  return self
end

setmetatable(IASACEServerCommands, command_mt)

return IASACEServerCommands
