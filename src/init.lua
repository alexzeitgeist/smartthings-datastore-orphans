--------------------------------------------------------------------------------
-- init.lua
--
-- Debug driver for examining SmartThings datastore behavior.
--------------------------------------------------------------------------------

local Driver = require("st.driver")
local capabilities = require("st.capabilities")
local log = require("log")
local socket = require("cosock.socket")
local st_utils = require("st.utils")

--------------------------------------------------------------------------------
-- Constants
--------------------------------------------------------------------------------

local CHILD_PROFILE = "child"
local GATEWAY_PROFILE = "gateway"
local PREFIX = "[DATASTORE-DEBUG]"

-- Device identifiers
local CHILD_KEY_PREFIX = "child:"
local DEVICE_TYPE_EDGE_CHILD = "EDGE_CHILD"
local DEVICE_TYPE_LAN = "LAN"
local GATEWAY_DNI = "test-gateway-001"

-- Manufacturer info
local MANUFACTURER_IOT = "IoT Solutions Corp."
local MANUFACTURER_SMARTTHINGS = "SmartThings"

-- Timing constants
local HEALTH_CHECK_INTERVAL = 120
local PERIODIC_DUMP_INTERVAL = 60
local DISCOVERY_SLEEP_INTERVAL = 1
local DEVICE_CREATION_DELAY = 2
local REMOVAL_DUMP_DELAY = 1

-- Field validation
local MIN_DEVICE_ID_LENGTH = 32

--------------------------------------------------------------------------------
-- Module State
--------------------------------------------------------------------------------

local child_counter = 0

--------------------------------------------------------------------------------
-- Private Helper Functions
--------------------------------------------------------------------------------

--- Dump complete datastore contents for debugging
-- @tparam Driver driver SmartThings driver instance
-- @tparam string|nil context Optional context description
local function _dump_datastore(driver, context)
  log.info(string.format("%s ===== DATASTORE DUMP =====", PREFIX))
  log.info(string.format("%s Timestamp: %s", PREFIX, os.date("%Y-%m-%d %H:%M:%S")))

  local device_count = 0
  local field_count = 0

  -- Iterate through all devices
  for _, device in ipairs(driver:get_devices()) do
    device_count = device_count + 1
    log.info(string.format("%s Device: %s", PREFIX, device.id))
    log.info(string.format("%s   Label: %s", PREFIX, tostring(device.label)))
    log.info(string.format("%s   Device Network ID: %s", PREFIX, tostring(device.device_network_id)))
    log.info(string.format("%s   Parent: %s", PREFIX, tostring(device.parent_device_id)))

    -- Only count persistent fields for basic tracking
    if device.persistent_store then
      for field_name, value in pairs(device.persistent_store) do
        field_count = field_count + 1
      end
    end
  end

  log.info(string.format("%s Total Devices: %d", PREFIX, device_count))
  log.info(string.format("%s Total Fields: %d", PREFIX, field_count))

  -- Show driver-level datastore (like official driver does)
  log.info(string.format("%s Driver Datastore:", PREFIX))
  if driver.datastore then
    for key, value in pairs(driver.datastore) do
      log.info(string.format("%s   %s: %s", PREFIX, key, st_utils.stringify_table(value)))
    end
  else
    log.info(string.format("%s   (no driver datastore)", PREFIX))
  end

  -- Check for orphaned devices in __devices_store
  if driver.datastore and driver.datastore.__devices_store then
    local orphan_count = 0
    local active_devices = {}

    -- Build set of active device IDs
    for _, device in ipairs(driver:get_devices()) do
      active_devices[device.id] = true
    end

    -- Check for orphans
    log.info(string.format("%s Checking for orphaned device entries:", PREFIX))
    for device_id, device_data in pairs(driver.datastore.__devices_store) do
      if not active_devices[device_id] then
        orphan_count = orphan_count + 1
        log.warn(string.format("%s   ORPHAN: %s (data still in __devices_store)", PREFIX, device_id))
      end
    end

    if orphan_count > 0 then
      log.warn(string.format("%s Found %d orphaned device entries in __devices_store!", PREFIX, orphan_count))
      log.warn(string.format("%s This indicates incomplete cleanup after device removal/crash", PREFIX))
    else
      log.info(string.format("%s   No orphaned entries found", PREFIX))
    end
  end

  log.info(string.format("%s =========================", PREFIX))

  if context then
    log.info(string.format("%s Context: %s", PREFIX, context))
  end
end

--- Create a test child device for debugging purposes
-- @tparam Driver driver SmartThings driver instance
-- @tparam Device parent_device Parent device to attach child to
local function _create_child_device(driver, parent_device)
  child_counter = child_counter + 1
  local child_key = string.format("%s%s-%d", CHILD_KEY_PREFIX, parent_device.device_network_id, child_counter)
  local child_label = string.format("Test Child %d", child_counter)

  log.info(string.format("%s Creating child device: %s", PREFIX, child_key))

  -- Check if device already exists in DNI map
  if driver.dni_to_device_map and driver.dni_to_device_map[child_key] then
    log.info(string.format("%s Child device already exists: %s", PREFIX, child_key))
    return
  end

  local create_device_msg = {
    type = DEVICE_TYPE_EDGE_CHILD,
    parent_assigned_child_key = child_key,
    label = child_label,
    profile = CHILD_PROFILE,
    manufacturer = MANUFACTURER_SMARTTHINGS,
    model = "Test Child",
    parent_device_id = parent_device.id,
    vendor_provided_label = child_label
  }

  local success, err = pcall(driver.try_create_device, driver, create_device_msg)
  if not success then
    log.error(string.format("%s Failed to create child device: %s", PREFIX, tostring(err)))
  else
    log.info(string.format("%s Child device creation requested: %s", PREFIX, child_key))
  end
end

--------------------------------------------------------------------------------
-- Device Lifecycle Handlers
--------------------------------------------------------------------------------

--- Handle device addition event
-- @tparam Driver driver SmartThings driver instance
-- @tparam Device device Newly added device
local function _device_added(driver, device)
  log.info(string.format("%s ===== DEVICE ADDED =====", PREFIX))
  log.info(string.format("%s Device ID: %s", PREFIX, device.id))
  log.info(string.format("%s Label: %s", PREFIX, tostring(device.label)))
  log.info(string.format("%s Device Network ID: %s", PREFIX, tostring(device.device_network_id)))
  log.info(string.format("%s Parent ID: %s", PREFIX, tostring(device.parent_device_id)))
  log.info(string.format("%s Profile ID: %s", PREFIX, tostring(device.profile and device.profile.id)))

  -- Update DNI map
  if device.device_network_id then
    driver.dni_to_device_map = driver.dni_to_device_map or {}
    driver.dni_to_device_map[device.device_network_id] = device
    log.info(string.format("%s Added to DNI map: %s", PREFIX, device.device_network_id))
  end

  -- For child devices, set initial switch state
  if device:supports_capability_by_id("switch", "main") then
    device:emit_event(capabilities.switch.switch.off())
    log.info(string.format("%s Set initial switch state to OFF for child device", PREFIX))
  end

  -- Dump datastore after addition
  _dump_datastore(driver, "After device added")

  -- Set device as online
  device:online()
end

--- Handle device removal event
-- @tparam Driver driver SmartThings driver instance
-- @tparam Device device Device being removed
local function _device_removed(driver, device)
  log.info(string.format("%s ===== DEVICE REMOVED =====", PREFIX))
  log.info(string.format("%s Device ID: %s", PREFIX, device.id))
  log.info(string.format("%s Label: %s", PREFIX, tostring(device.label)))
  log.info(string.format("%s Device Network ID: %s", PREFIX, tostring(device.device_network_id)))
  log.info(string.format("%s Parent ID: %s", PREFIX, tostring(device.parent_device_id)))

  -- Dump datastore before removal
  _dump_datastore(driver, "Before device removal")

  -- Platform automatically handles child device removal when parent is deleted
  local is_gateway = device.device_network_id and device.device_network_id:find("^" .. GATEWAY_DNI:gsub("%-", "%%-"))
  if is_gateway then
    log.info(string.format("%s Gateway removal - platform will handle child device cleanup automatically", PREFIX))
  end


  -- Clean up DNI mapping
  if driver.dni_to_device_map and device.device_network_id then
    driver.dni_to_device_map[device.device_network_id] = nil
    log.info(string.format("%s Removed from DNI map: %s", PREFIX, device.device_network_id))
  end

  log.info(string.format("%s Completed device removal cleanup", PREFIX))

  -- Schedule a datastore dump after removal completes
  driver:call_with_delay(REMOVAL_DUMP_DELAY, function()
    _dump_datastore(driver, "After device removal")
  end)
end

--- Handle device initialization event
-- @tparam Driver driver SmartThings driver instance
-- @tparam Device device Device being initialized
local function _device_init(driver, device)
  log.info(string.format("%s ===== DEVICE INIT =====", PREFIX))
  log.info(string.format("%s Device ID: %s", PREFIX, device.id))
  log.info(string.format("%s Label: %s", PREFIX, tostring(device.label)))
  log.info(string.format("%s Checking persistent fields...", PREFIX))

  -- Simply log that device initialization completed
  log.info(string.format("%s Device initialization completed", PREFIX))

  -- Schedule periodic health updates
  device.thread:call_on_schedule(
    HEALTH_CHECK_INTERVAL,
    function()
      device:online()
    end,
    "health_update_timer"
  )
end

--------------------------------------------------------------------------------
-- Capability Handlers
--------------------------------------------------------------------------------

--- Handle refresh command
-- @tparam Driver driver SmartThings driver instance
-- @tparam Device device Device receiving command
-- @tparam table command Command details
local function _handle_refresh(driver, device, command)
  log.info(string.format("%s Refresh command received", PREFIX))
  _dump_datastore(driver, "Manual refresh command")

  -- If gateway, create a test child
  local is_gateway = device.device_network_id and device.device_network_id:find("^" .. GATEWAY_DNI:gsub("%-", "%%-"))
  if is_gateway then
    log.info(string.format("%s Creating child device for gateway", PREFIX))
    _create_child_device(driver, device)
  end
end

--- Handle switch on command
-- @tparam Driver driver SmartThings driver instance
-- @tparam Device device Device receiving command
-- @tparam table command Command details
local function _handle_switch_on(driver, device, command)
  log.info(string.format("%s Switch ON command for device: %s (%s)", PREFIX, device.id, tostring(device.label)))
  device:emit_event(capabilities.switch.switch.on())
end

--- Handle switch off command
-- @tparam Driver driver SmartThings driver instance
-- @tparam Device device Device receiving command
-- @tparam table command Command details
local function _handle_switch_off(driver, device, command)
  log.info(string.format("%s Switch OFF command for device: %s (%s)", PREFIX, device.id, tostring(device.label)))
  device:emit_event(capabilities.switch.switch.off())
end

--------------------------------------------------------------------------------
-- Discovery Handler
--------------------------------------------------------------------------------

--- Handle device discovery process
-- @tparam Driver driver SmartThings driver instance
-- @tparam table opts Discovery options
-- @tparam function cont Continuation function to check if discovery should continue
local function _discovery_handler(driver, opts, cont)
  log.info(string.format("%s Discovery started", PREFIX))

  local iteration = 0

  -- Discovery needs to run in a loop until user stops it
  while cont() do
    iteration = iteration + 1

    -- Check current devices
    local current_devices = driver:get_devices()

    -- Check if gateway already exists
    local gateway_exists = false

    -- Check for existing gateway
    for _, device in ipairs(current_devices) do
      if device.device_network_id == GATEWAY_DNI then
        gateway_exists = true
        break
      end
    end

    -- Create gateway if it doesn't exist
    if not gateway_exists then
      log.info(string.format("%s Creating gateway device...", PREFIX))

      local create_device_msg = {
        type = DEVICE_TYPE_LAN,
        device_network_id = GATEWAY_DNI,
        label = "IoT Solutions Gateway (Debug)",
        profile = GATEWAY_PROFILE,
        manufacturer = MANUFACTURER_IOT,
        model = "IoT Solutions Debug",
        vendor_provided_label = "iot-gateway-debug",
      }

      local success, err = pcall(driver.try_create_device, driver, create_device_msg)
      if success then
        log.info(string.format("%s Gateway created successfully", PREFIX))
        socket.sleep(DEVICE_CREATION_DELAY)
      else
        log.error(string.format("%s Failed to create gateway: %s", PREFIX, tostring(err)))
      end
    end

    if cont() then
      socket.sleep(DISCOVERY_SLEEP_INTERVAL)
    end
  end

  log.info(string.format("%s Discovery completed after %d iterations", PREFIX, iteration))
end

--------------------------------------------------------------------------------
-- Driver Lifecycle
--------------------------------------------------------------------------------

--- Handle driver switched event
-- @tparam Driver driver SmartThings driver instance
local function _driver_switched(driver)
  log.info(string.format("%s ===== DRIVER SWITCHED =====", PREFIX))
  _dump_datastore(driver, "Driver switched (capability update)")
end

--- Handle driver startup
-- @tparam Driver driver SmartThings driver instance
local function _driver_do_run(driver)
  log.info(string.format("%s Driver starting up - checking initial datastore state...", PREFIX))

  -- Initial datastore dump
  _dump_datastore(driver, "Driver startup")

  -- Set up periodic datastore monitoring
  driver:call_on_schedule(
    PERIODIC_DUMP_INTERVAL,
    function()
      _dump_datastore(driver, "Periodic check")
    end,
    "periodic_datastore_dump"
  )

  log.info(string.format("%s Driver startup complete", PREFIX))
end

--------------------------------------------------------------------------------
-- Driver Construction and Initialization
--------------------------------------------------------------------------------

local datastore_debug_driver = Driver("datastore-debug-driver", {
  discovery = _discovery_handler,
  lifecycle_handlers = {
    init = _device_init,
    added = _device_added,
    removed = _device_removed,
    driverSwitched = _driver_switched,
    doConfigure = _device_init
  },
  capability_handlers = {
    [capabilities.refresh.ID] = {
      [capabilities.refresh.commands.refresh.NAME] = _handle_refresh
    },
    [capabilities.switch.ID] = {
      [capabilities.switch.commands.on.NAME] = _handle_switch_on,
      [capabilities.switch.commands.off.NAME] = _handle_switch_off
    }
  },
  supported_capabilities = {
    capabilities.refresh,
    capabilities.switch,
    capabilities.healthCheck
  }
})

-- Initialize DNI to device mapping
datastore_debug_driver.dni_to_device_map = {}

--- Override driver run to add startup logging
function datastore_debug_driver:run()
  _driver_do_run(self)
  Driver.run(self)
end

-- Run the driver
datastore_debug_driver:run()