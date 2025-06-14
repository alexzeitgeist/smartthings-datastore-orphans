local data_types = require "st.zigbee.data_types"
local utils = require "st.zigbee.utils"


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

--- @class st.zigbee.zcl.clusters.Scenes.types.SExtensionFieldSetList
--- @alias SExtensionFieldSetList
--- @field public NAME SExtensionFieldSetList
--- @field public cluster_id st.zigbee.data_types.Uint16
--- @field public extension_field_set st.zigbee.data_types.OctetString
local SExtensionFieldSetList = {}
SExtensionFieldSetList.NAME = "SExtensionFieldSetList"
SExtensionFieldSetList.get_fields = function(self)
  local out = {}
  out[#out + 1] = self.cluster_id
  out[#out + 1] = self.extension_field_set
  return out
end
SExtensionFieldSetList.set_field_names = function(self)
  self.cluster_id.field_name = "cluster_id"
  self.extension_field_set.field_name = "extension_field_set"
end

--- @function SExtensionFieldSetList:get_length
--- @return number the length in bytes of this frame
SExtensionFieldSetList.get_length = utils.length_from_fields

--- @function SExtensionFieldSetList:_serialize
--- @return string this class serialized to bytes
SExtensionFieldSetList._serialize = utils.serialize_from_fields

--- @function SExtensionFieldSetList:pretty_print
--- @return string this class in a human readable format
SExtensionFieldSetList.pretty_print = utils.print_from_fields

--- @function SExtensionFieldSetList.deserialize
--- @param buf Reader the buf to parse this class from
--- @return number the length in bytes of this frame
SExtensionFieldSetList.deserialize = function(buf)
  local o = {}
  o.cluster_id = data_types.Uint16.deserialize(buf)
  o.extension_field_set = {}
  while buf:remain() > 0 do
    local nextRecord = data_types.OctetString.deserialize(buf)
    o.extension_field_set[#o.extension_field_set + 1] = nextRecord
  end
  setmetatable(o, {
    __index = SExtensionFieldSetList,
    __tostring = SExtensionFieldSetList.pretty_print,
  })
  o:set_field_names()
  return o
end

--- @function SExtensionFieldSetList.init
--- @param cluster_id st.zigbee.data_types.Uint16
--- @param extension_field_set st.zigbee.data_types.OctetString
SExtensionFieldSetList.init = function(orig, cluster_id, extension_field_set)
  local o = {}
    o.cluster_id = data_types.Uint16(cluster_id)
    o.extension_field_set = data_types.OctetString(extension_field_set)
  setmetatable(o, {
    __index = orig,
    __tostring = orig.pretty_print
  })
  o:set_field_names()
  return o
end

setmetatable(SExtensionFieldSetList, {__call = SExtensionFieldSetList.init})
return SExtensionFieldSetList
