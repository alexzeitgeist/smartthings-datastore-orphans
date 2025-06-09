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
local utils = require "st.utils"

local IS_PARENT_CHILD_DEVICE = "__is_parent_child_device"

local MOST_RECENT_TEMP = "mostRecentTemp"
local MIRED_KELVIN_CONVERSION_CONSTANT = 1000000
-- These values are a "sanity check" to check that values we are getting are reasonable
local COLOR_TEMPERATURE_KELVIN_MAX = 15000
local COLOR_TEMPERATURE_KELVIN_MIN = 1000
local COLOR_TEMPERATURE_MIRED_MAX = MIRED_KELVIN_CONVERSION_CONSTANT/COLOR_TEMPERATURE_KELVIN_MIN
local COLOR_TEMPERATURE_MIRED_MIN = MIRED_KELVIN_CONVERSION_CONSTANT/COLOR_TEMPERATURE_KELVIN_MAX
local TRANSITION_TIME = 0 --1/10ths of a second
-- When sent with a command, these options mask and override bitmaps cause the command
-- to take effect when the switch/light is off.
local OPTIONS_MASK = 0x01
local OPTIONS_OVERRIDE = 0x01

--- @class st.matter.defaults.colorTemperature
--- @field public matter_handlers table
--- @field public subscribed_attributes table
--- @field public capability_handlers table
local color_temp_defaults = {}

local function temp_attr_handler(driver, device, ib, response)
  if ib.data.value ~= nil then
    if (ib.data.value < COLOR_TEMPERATURE_MIRED_MIN or ib.data.value > COLOR_TEMPERATURE_MIRED_MAX) then
      device.log.warn_with({hub_logs = true}, string.format("Device reported color temperature %d mired outside of sane range of %.2f-%.2f", ib.data.value, COLOR_TEMPERATURE_MIRED_MIN, COLOR_TEMPERATURE_MIRED_MAX))
      return
    end
    local temp = utils.round(MIRED_KELVIN_CONVERSION_CONSTANT/ib.data.value)
    local temp_device = device
    if device:get_field(IS_PARENT_CHILD_DEVICE) == true then
      temp_device = device:get_child_by_parent_assigned_key(string.format("%d",  ib.endpoint_id)) or device
    end
    local most_recent_temp = temp_device:get_field(MOST_RECENT_TEMP)
    -- this is to avoid rounding errors from the round-trip conversion of Kelvin to mireds
    if most_recent_temp ~= nil and
      most_recent_temp <= utils.round(MIRED_KELVIN_CONVERSION_CONSTANT/(ib.data.value - 1)) and
      most_recent_temp >= utils.round(MIRED_KELVIN_CONVERSION_CONSTANT/(ib.data.value + 1)) then
        temp = most_recent_temp
    end
    device:emit_event_for_endpoint(ib.endpoint_id, capabilities.colorTemperature.colorTemperature(temp))
  end
end

local function handle_set_color_temperature(driver, device, cmd, register_native)
  if register_native then
    device:register_native_capability_cmd_handler(cmd.capability, cmd.command)
  end

  local endpoint_id = device:component_to_endpoint(cmd.component)
  local temp_in_mired = utils.round(MIRED_KELVIN_CONVERSION_CONSTANT / cmd.args.temperature)
  local req = clusters.ColorControl.server.commands.MoveToColorTemperature(
                device, endpoint_id, temp_in_mired, TRANSITION_TIME, OPTIONS_MASK, OPTIONS_OVERRIDE
              )
  device:set_field(MOST_RECENT_TEMP, cmd.args.temperature)
  device:send(req)
end

color_temp_defaults.matter_handlers = {
  attr = {
    [clusters.ColorControl.ID] = {
      [clusters.ColorControl.attributes.ColorTemperature.ID] = temp_attr_handler,
    },
  },
}
color_temp_defaults.capability_handlers = {
  [capabilities.colorTemperature.commands.setColorTemperature] = handle_set_color_temperature,
}
color_temp_defaults.subscribed_attributes = {clusters.ColorControl.attributes.ColorTemperature}

return color_temp_defaults
