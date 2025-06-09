-- Copyright 2022 SmartThings
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
local capabilities = require "st.capabilities"
local clusters = require "st.matter.clusters"
local log = require "log"
local utils = require "st.utils"

local RECEIVED_X = "receivedX"
local RECEIVED_Y = "receivedY"
local HUESAT_SUPPORT = "huesatSupport"
local TRANSITION_TIME = 0 --1/10ths of a second
-- When sent with a command, these options mask and override bitmaps cause the command
-- to take effect when the switch/light is off.
local OPTIONS_MASK = 0x01
local OPTIONS_OVERRIDE = 0x01

local function convert_huesat_st_to_matter(val)
  return utils.clamp_value(math.floor((val * 0xFE) / 100.0 + 0.5), 0, 254)
end

local function tbl_contains(array, value)
  for _, element in ipairs(array) do
    if element == value then
      return true
    end
  end
  return false
end

--- @class st.matter.defaults.colorControl
--- @field public matter_handlers table
--- @field public subscribed_attributes table
--- @field public capability_handlers table
local color_control_defaults = {}

local function hue_attr_handler(driver, device, ib, response)
  if ib.data.value ~= nil then
    local hue = math.floor((ib.data.value / 0xFE * 100) + 0.5)
    device:emit_event_for_endpoint(ib.endpoint_id, capabilities.colorControl.hue(hue))
  end
end

local function sat_attr_handler(driver, device, ib, response)
  if ib.data.value ~= nil then
    local sat = math.floor((ib.data.value / 0xFE * 100) + 0.5)
    device:emit_event_for_endpoint(ib.endpoint_id, capabilities.colorControl.saturation(sat))
  end
end

local function x_attr_handler(driver, device, ib, response)
  local y = device:get_field(RECEIVED_Y)
  -- TODO it is likely that both x and y attributes are in the response (not guaranteed though)
  -- if they are we can avoid setting fields on the device.
  if y == nil then
    device:set_field(RECEIVED_X, ib.data.value)
  else
    local x = ib.data.value
    local h, s, _ = utils.safe_xy_to_hsv(x, y)
    device:emit_event_for_endpoint(ib.endpoint_id, capabilities.colorControl.hue(h))
    device:emit_event_for_endpoint(ib.endpoint_id, capabilities.colorControl.saturation(s))
    device:set_field(RECEIVED_Y, nil)
  end
end

local function y_attr_handler(driver, device, ib, response)
  local x = device:get_field(RECEIVED_X)
  if x == nil then
    device:set_field(RECEIVED_Y, ib.data.value)
  else
    local y = ib.data.value
    local h, s, _ = utils.safe_xy_to_hsv(x, y)
    device:emit_event_for_endpoint(ib.endpoint_id, capabilities.colorControl.hue(h))
    device:emit_event_for_endpoint(ib.endpoint_id, capabilities.colorControl.saturation(s))
    device:set_field(RECEIVED_X, nil)
  end
end

local function color_cap_attr_handler(driver, device, ib, response)
  if ib.data.value ~= nil then
    if ib.data.value & 0x1 then device:set_field(HUESAT_SUPPORT, true) end
  end
end

local function handle_set_color(driver, device, cmd, register_native)
  if register_native then
    device:register_native_capability_cmd_handler(cmd.capability, cmd.command)
  end
  if type(device.register_native_capability_cmd_handler) == "function" then
    device:register_native_capability_cmd_handler(cmd.capability, cmd.command)
  end
  local endpoint_id = device:component_to_endpoint(cmd.component)
  local req
  local huesat_endpoints = device:get_endpoints(clusters.ColorControl.ID, {feature_bitmap = clusters.ColorControl.FeatureMap.HUE_AND_SATURATION})
  if tbl_contains(huesat_endpoints, endpoint_id) then
    local hue = convert_huesat_st_to_matter(cmd.args.color.hue)
    local sat = convert_huesat_st_to_matter(cmd.args.color.saturation)
    req = clusters.ColorControl.server.commands.MoveToHueAndSaturation(device, endpoint_id, hue, sat, TRANSITION_TIME, OPTIONS_MASK, OPTIONS_OVERRIDE)
  else
    local x, y, _ = utils.safe_hsv_to_xy(cmd.args.color.hue, cmd.args.color.saturation)
    req = clusters.ColorControl.server.commands.MoveToColor(device, endpoint_id, x, y, TRANSITION_TIME, OPTIONS_MASK, OPTIONS_OVERRIDE)
  end
  device:send(req)
end

local function handle_set_hue(driver, device, cmd, register_native)
  if register_native then
    device:register_native_capability_cmd_handler(cmd.capability, cmd.command)
  end
  local endpoint_id = device:component_to_endpoint(cmd.component)
  local huesat_endpoints = device:get_endpoints(clusters.ColorControl.ID, {feature_bitmap = clusters.ColorControl.FeatureMap.HUE_AND_SATURATION})
  if tbl_contains(huesat_endpoints, endpoint_id) then
    local hue = convert_huesat_st_to_matter(cmd.args.hue)
    local req = clusters.ColorControl.server.commands.MoveToHue(device, endpoint_id, hue, 0, TRANSITION_TIME, OPTIONS_MASK, OPTIONS_OVERRIDE)
    device:send(req)
  else
    log.warn("Device does not support huesat features on its color control cluster")
  end
end

local function handle_set_saturation(driver, device, cmd, register_native)
  if register_native then
    device:register_native_capability_cmd_handler(cmd.capability, cmd.command)
  end
  local endpoint_id = device:component_to_endpoint(cmd.component)
  local huesat_endpoints = device:get_endpoints(clusters.ColorControl.ID, {feature_bitmap = clusters.ColorControl.FeatureMap.HUE_AND_SATURATION})
  if tbl_contains(huesat_endpoints, endpoint_id) then
    local sat = convert_huesat_st_to_matter(cmd.args.saturation)
    local req = clusters.ColorControl.server.commands.MoveToSaturation(device, endpoint_id, sat, TRANSITION_TIME, OPTIONS_MASK, OPTIONS_OVERRIDE)
    device:send(req)
  else
    log.warn("Device does not support huesat features on its color control cluster")
  end
end

color_control_defaults.matter_handlers = {
  attr = {
    [clusters.ColorControl.ID] = {
      [clusters.ColorControl.attributes.CurrentHue.ID] = hue_attr_handler,
      [clusters.ColorControl.attributes.CurrentSaturation.ID] = sat_attr_handler,
      [clusters.ColorControl.attributes.CurrentX.ID] = x_attr_handler,
      [clusters.ColorControl.attributes.CurrentY.ID] = y_attr_handler,
      [clusters.ColorControl.attributes.ColorCapabilities.ID] = color_cap_attr_handler,
    },
  },
}
color_control_defaults.capability_handlers = {
  [capabilities.colorControl.commands.setColor] = handle_set_color,
  [capabilities.colorControl.commands.setHue] = handle_set_hue,
  [capabilities.colorControl.commands.setSaturation] = handle_set_saturation,
}
color_control_defaults.subscribed_attributes = {
  clusters.ColorControl.attributes.CurrentHue,
  clusters.ColorControl.attributes.CurrentSaturation,
  clusters.ColorControl.attributes.CurrentX,
  clusters.ColorControl.attributes.CurrentY,
}

return color_control_defaults
