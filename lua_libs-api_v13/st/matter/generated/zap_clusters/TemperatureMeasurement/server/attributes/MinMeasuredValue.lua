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
local data_types = require "st.matter.data_types"
local TLVParser = require "st.matter.TLV.TLVParser"

--- @class st.matter.clusters.TemperatureMeasurement.MinMeasuredValue
--- @alias MinMeasuredValue
---
--- @field public ID number 0x0001 the ID of this attribute
--- @field public NAME string "MinMeasuredValue" the name of this attribute
--- @field public data_type st.matter.data_types.Int16 the data type of this attribute

local MinMeasuredValue = {
  ID = 0x0001,
  NAME = "MinMeasuredValue",
  base_type = require "st.matter.data_types.Int16",
}

--- Create a Int16 object of this attribute with any additional features provided for the attribute
--- This is also usable with the MinMeasuredValue(...) syntax
---
--- @vararg vararg the values needed to construct a Int16
--- @return st.matter.data_types.Int16
function MinMeasuredValue:new_value(...)
  local o = self.base_type(table.unpack({...}))

  return o
end

--- Constructs an st.matter.interaction_model.InteractionRequest to read
--- this attribute from a device
--- @param device st.matter.Device
--- @param endpoint_id number|nil
--- @return st.matter.interaction_model.InteractionRequest containing an Interaction Request
function MinMeasuredValue:read(device, endpoint_id)
  return cluster_base.read(
    device,
    endpoint_id,
    self._cluster.ID,
    self.ID,
    nil --event_id
  )
end


--- Reporting policy: MinMeasuredValue => true => mandatory

--- Sets up a Subscribe Interaction
---
--- @param device any
--- @param endpoint_id number|nil
--- @return any
function MinMeasuredValue:subscribe(device, endpoint_id)
  return cluster_base.subscribe(
    device,
    endpoint_id,
    self._cluster.ID,
    self.ID,
    nil --event_id
  )
end

function MinMeasuredValue:set_parent_cluster(cluster)
  self._cluster = cluster
  return self
end

--- Builds an MinMeasuredValue test attribute reponse for the driver integration testing framework
---
--- @param device st.matter.Device the device to build this message for
--- @param endpoint_id number|nil
--- @param value any
--- @param status string Interaction status associated with the path
--- @return st.matter.interaction_model.InteractionResponse of type REPORT_DATA
function MinMeasuredValue:build_test_report_data(
  device,
  endpoint_id,
  value,
  status
)
  local data = data_types.validate_or_build_type(value, self.base_type)

  return cluster_base.build_test_report_data(
    device,
    endpoint_id,
    self._cluster.ID,
    self.ID,
    data,
    status
  )
end

function MinMeasuredValue:deserialize(tlv_buf)
  local data = TLVParser.decode_tlv(tlv_buf)

  return data
end

setmetatable(MinMeasuredValue, {__call = MinMeasuredValue.new_value, __index = MinMeasuredValue.base_type})
return MinMeasuredValue

