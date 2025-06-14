local cluster_base = require "st.zigbee.cluster_base"
local data_types = require "st.zigbee.data_types"

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

--- @class st.zigbee.zcl.clusters.ColorControl.ColorCapabilities
--- @alias ColorCapabilities
---
--- @field public ID number 0x400A the ID of this attribute
--- @field public NAME string "ColorCapabilities" the name of this attribute
--- @field public data_type st.zigbee.data_types.Bitmap16 the data type of this attribute
--- @field public HUE_SATURATION_SUPPORTED number 1
--- @field public ENHANCED_HUE_SUPPORTED number 2
--- @field public COLOR_LOOP_SUPPORTED number 4
--- @field public XY_SUPPORTED number 8
--- @field public COLOR_TEMPERATURE_SUPPORTED number 16
local ColorCapabilities = {
  ID = 0x400A,
  NAME = "ColorCapabilities",
  base_type = data_types.Bitmap16,
}

ColorCapabilities.BASE_MASK                   = 0xFFFF
ColorCapabilities.HUE_SATURATION_SUPPORTED    = 0x0001
ColorCapabilities.ENHANCED_HUE_SUPPORTED      = 0x0002
ColorCapabilities.COLOR_LOOP_SUPPORTED        = 0x0004
ColorCapabilities.XY_SUPPORTED                = 0x0008
ColorCapabilities.COLOR_TEMPERATURE_SUPPORTED = 0x0010


ColorCapabilities.mask_fields = {
  BASE_MASK = 0xFFFF,
  HUE_SATURATION_SUPPORTED = 0x0001,
  ENHANCED_HUE_SUPPORTED = 0x0002,
  COLOR_LOOP_SUPPORTED = 0x0004,
  XY_SUPPORTED = 0x0008,
  COLOR_TEMPERATURE_SUPPORTED = 0x0010,
}


--- @function ColorCapabilities:is_hue_saturation_supported_set
--- @return boolean True if the value of HUE_SATURATION_SUPPORTED is non-zero
ColorCapabilities.is_hue_saturation_supported_set = function(self)
  return (self.value & self.HUE_SATURATION_SUPPORTED) ~= 0
end
 
--- @function ColorCapabilities:set_hue_saturation_supported
--- Set the value of the bit in the HUE_SATURATION_SUPPORTED field to 1
ColorCapabilities.set_hue_saturation_supported = function(self)
  self.value = self.value | self.HUE_SATURATION_SUPPORTED
end

--- @function ColorCapabilities:unset_hue_saturation_supported
--- Set the value of the bits in the HUE_SATURATION_SUPPORTED field to 0
ColorCapabilities.unset_hue_saturation_supported = function(self)
  self.value = self.value & (~self.HUE_SATURATION_SUPPORTED & self.BASE_MASK)
end

--- @function ColorCapabilities:is_enhanced_hue_supported_set
--- @return boolean True if the value of ENHANCED_HUE_SUPPORTED is non-zero
ColorCapabilities.is_enhanced_hue_supported_set = function(self)
  return (self.value & self.ENHANCED_HUE_SUPPORTED) ~= 0
end
 
--- @function ColorCapabilities:set_enhanced_hue_supported
--- Set the value of the bit in the ENHANCED_HUE_SUPPORTED field to 1
ColorCapabilities.set_enhanced_hue_supported = function(self)
  self.value = self.value | self.ENHANCED_HUE_SUPPORTED
end

--- @function ColorCapabilities:unset_enhanced_hue_supported
--- Set the value of the bits in the ENHANCED_HUE_SUPPORTED field to 0
ColorCapabilities.unset_enhanced_hue_supported = function(self)
  self.value = self.value & (~self.ENHANCED_HUE_SUPPORTED & self.BASE_MASK)
end

--- @function ColorCapabilities:is_color_loop_supported_set
--- @return boolean True if the value of COLOR_LOOP_SUPPORTED is non-zero
ColorCapabilities.is_color_loop_supported_set = function(self)
  return (self.value & self.COLOR_LOOP_SUPPORTED) ~= 0
end
 
--- @function ColorCapabilities:set_color_loop_supported
--- Set the value of the bit in the COLOR_LOOP_SUPPORTED field to 1
ColorCapabilities.set_color_loop_supported = function(self)
  self.value = self.value | self.COLOR_LOOP_SUPPORTED
end

--- @function ColorCapabilities:unset_color_loop_supported
--- Set the value of the bits in the COLOR_LOOP_SUPPORTED field to 0
ColorCapabilities.unset_color_loop_supported = function(self)
  self.value = self.value & (~self.COLOR_LOOP_SUPPORTED & self.BASE_MASK)
end

--- @function ColorCapabilities:is_xy_supported_set
--- @return boolean True if the value of XY_SUPPORTED is non-zero
ColorCapabilities.is_xy_supported_set = function(self)
  return (self.value & self.XY_SUPPORTED) ~= 0
end
 
--- @function ColorCapabilities:set_xy_supported
--- Set the value of the bit in the XY_SUPPORTED field to 1
ColorCapabilities.set_xy_supported = function(self)
  self.value = self.value | self.XY_SUPPORTED
end

--- @function ColorCapabilities:unset_xy_supported
--- Set the value of the bits in the XY_SUPPORTED field to 0
ColorCapabilities.unset_xy_supported = function(self)
  self.value = self.value & (~self.XY_SUPPORTED & self.BASE_MASK)
end

--- @function ColorCapabilities:is_color_temperature_supported_set
--- @return boolean True if the value of COLOR_TEMPERATURE_SUPPORTED is non-zero
ColorCapabilities.is_color_temperature_supported_set = function(self)
  return (self.value & self.COLOR_TEMPERATURE_SUPPORTED) ~= 0
end
 
--- @function ColorCapabilities:set_color_temperature_supported
--- Set the value of the bit in the COLOR_TEMPERATURE_SUPPORTED field to 1
ColorCapabilities.set_color_temperature_supported = function(self)
  self.value = self.value | self.COLOR_TEMPERATURE_SUPPORTED
end

--- @function ColorCapabilities:unset_color_temperature_supported
--- Set the value of the bits in the COLOR_TEMPERATURE_SUPPORTED field to 0
ColorCapabilities.unset_color_temperature_supported = function(self)
  self.value = self.value & (~self.COLOR_TEMPERATURE_SUPPORTED & self.BASE_MASK)
end


ColorCapabilities.mask_methods = {
  is_hue_saturation_supported_set = ColorCapabilities.is_hue_saturation_supported_set,
  set_hue_saturation_supported = ColorCapabilities.set_hue_saturation_supported,
  unset_hue_saturation_supported = ColorCapabilities.unset_hue_saturation_supported,
  is_enhanced_hue_supported_set = ColorCapabilities.is_enhanced_hue_supported_set,
  set_enhanced_hue_supported = ColorCapabilities.set_enhanced_hue_supported,
  unset_enhanced_hue_supported = ColorCapabilities.unset_enhanced_hue_supported,
  is_color_loop_supported_set = ColorCapabilities.is_color_loop_supported_set,
  set_color_loop_supported = ColorCapabilities.set_color_loop_supported,
  unset_color_loop_supported = ColorCapabilities.unset_color_loop_supported,
  is_xy_supported_set = ColorCapabilities.is_xy_supported_set,
  set_xy_supported = ColorCapabilities.set_xy_supported,
  unset_xy_supported = ColorCapabilities.unset_xy_supported,
  is_color_temperature_supported_set = ColorCapabilities.is_color_temperature_supported_set,
  set_color_temperature_supported = ColorCapabilities.set_color_temperature_supported,
  unset_color_temperature_supported = ColorCapabilities.unset_color_temperature_supported,
}

--- Add additional functionality to the base type object
---
--- @param base_type_obj st.zigbee.data_types.Bitmap16 the base data type object to add functionality to
function ColorCapabilities:augment_type(base_type_obj)
  cluster_base.attribute_augment_type_bitmap(self, base_type_obj)
end

function ColorCapabilities.pretty_print(value_obj)
  local zb_utils = require "st.zigbee.utils"
  local pattern = ">I" .. value_obj.byte_length
  return string.format("%s: %s[0x%s]", value_obj.field_name or value_obj.NAME, ColorCapabilities.NAME, zb_utils.pretty_print_hex_str(string.pack(pattern, value_obj.value)))
end

--- @function ColorCapabilities:build_test_attr_report
---
--- Build a Rx Zigbee message as if a device reported this attribute
--- @param device st.zigbee.Device
--- @param data st.zigbee.data_types.Bitmap16 the attribute value
--- @return st.zigbee.ZigbeeMessageRx containing an AttributeReport body
ColorCapabilities.build_test_attr_report = cluster_base.build_test_attr_report

--- @function ColorCapabilities:build_test_read_attr_response
---
--- Build a Rx Zigbee message as if a device sent a read response for this attribute
--- @param device st.zigbee.Device
--- @param data st.zigbee.data_types.Bitmap16 the attribute value
--- @return st.zigbee.ZigbeeMessageRx containing an ReadAttributeResponse body
ColorCapabilities.build_test_read_attr_response = cluster_base.build_test_read_attr_response

--- Create a Bitmap16 object of this attribute with any additional features provided for the attribute
---
--- This is also usable with the ColorCapabilities(...) syntax
---
--- @vararg vararg the values needed to construct a Bitmap16
--- @return st.zigbee.data_types.Bitmap16
function ColorCapabilities:new_value(...)
    local o = self.base_type(table.unpack({...}))
    self:augment_type(o)
    return o
end

--- Construct a st.zigbee.ZigbeeMessageTx to read this attribute from a device
---
--- @param device st.zigbee.Device
--- @return st.zigbee.ZigbeeMessageTx containing a ReadAttribute body
function ColorCapabilities:read(device)
    return cluster_base.read_attribute(device, data_types.ClusterId(self._cluster.ID), data_types.AttributeId(self.ID))
end

--- Construct a st.zigbee.ZigbeeMessageTx to configure this attribute for reporting on a device
---
--- @param device st.zigbee.Device
--- @param min_rep_int number|st.zigbee.data_types.Uint16 the minimum interval allowed between reports of this attribute
--- @param max_rep_int number|st.zigbee.data_types.Uint16 the maximum interval allowed between reports of this attribute
--- @return st.zigbee.ZigbeeMessageTx containing a ConfigureReporting body
function ColorCapabilities:configure_reporting(device, min_rep_int, max_rep_int)
  local min = data_types.validate_or_build_type(min_rep_int, data_types.Uint16, "minimum_reporting_interval")
  local max = data_types.validate_or_build_type(max_rep_int, data_types.Uint16, "maximum_reporting_interval")
  local rep_change = nil
  return cluster_base.configure_reporting(device, data_types.ClusterId(self._cluster.ID), data_types.AttributeId(self.ID), data_types.ZigbeeDataType(self.base_type.ID), min, max, rep_change)
end

function ColorCapabilities:set_parent_cluster(cluster)
  self._cluster = cluster
  return self
end

setmetatable(ColorCapabilities, {__call = ColorCapabilities.new_value})
return ColorCapabilities
