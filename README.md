# SmartThings Datastore Persistence Analysis

## Executive Summary

This analysis documents a critical issue in the SmartThings Edge platform where device data persists in the `__devices_store` after devices are removed, creating "orphan" entries that accumulate over time. This was discovered while debugging a crash that occurred when manually deleting child devices during gateway removal.

**See `logs.txt` for the complete raw log output referenced throughout this analysis.**

## Test Setup

- **Driver**: Custom debug driver (`datastore-debug-driver`)
- **Test Date**: 2025-06-07
- **Test Duration**: ~3.5 minutes (10:10:13 - 10:13:53)
- **Hub v3 Firmware**: 0.56.11
- **Complete logs**: See `logs.txt` for full SmartThings driver output

## Repository Contents

- `README.md` - This analysis document
- `logs.txt` - Complete SmartThings driver logs showing the issue
- `src/init.lua` - Debug driver source code used for testing
- `profiles/` - Device profiles used during testing
- `config.yaml` - Driver configuration

## Device Creation Timeline

### 1. Gateway Creation (10:10:13 - 10:10:15)
```
10:10:13.908 - Discovery started, gateway creation initiated
10:10:15.130 - Gateway device added successfully
   Device ID: 63114b3a-f1e2-47c8-82d6-ccb09eedf869
   Label: IoT Solutions Gateway (Debug)
   DNI: test-gateway-001
   Type: LAN device
```

### 2. Child Device Creation (10:11:42 - 10:11:50)
Three child devices were created via the refresh command:

```
10:11:42.363 - Child 1 added
   Device ID: 90f57a28-f8f5-4e7e-b9a0-bf15a42e3a88
   Label: Test Child 1
   Parent: 63114b3a-f1e2-47c8-82d6-ccb09eedf869

10:11:47.267 - Child 2 added
   Device ID: d08ce559-03ba-436e-bf69-73f8ce5c6e9d
   Label: Test Child 2
   Parent: 63114b3a-f1e2-47c8-82d6-ccb09eedf869

10:11:50.507 - Child 3 added
   Device ID: 9b867ddb-eea6-4f65-849b-f95414d50e0e
   Label: Test Child 3
   Parent: 63114b3a-f1e2-47c8-82d6-ccb09eedf869
```

## Device Removal Sequence (10:13:51 - 10:13:53)

The gateway was deleted from the SmartThings app, triggering an automatic cascade deletion:

### Removal Order and Orphan Accumulation

1. **Gateway Removal (10:13:51.778)**
   - Gateway device lifecycle event triggered
   - Platform begins automatic child cleanup
   - **Result**: 4 orphans detected in `__devices_store`
   - All 4 devices still have data in the datastore despite gateway being removed

2. **Child 3 Removal (10:13:53.270)**
   - Device ID: 9b867ddb-eea6-4f65-849b-f95414d50e0e
   - **Result**: 3 orphans remaining
   - Child 3's data was cleaned from `__devices_store`

3. **Child 2 Removal (10:13:53.393)**
   - Device ID: d08ce559-03ba-436e-bf69-73f8ce5c6e9d
   - **Result**: 2 orphans remaining
   - Child 2's data was cleaned, but inconsistently

4. **Child 1 Removal (10:13:53.451)**
   - Device ID: 90f57a28-f8f5-4e7e-b9a0-bf15a42e3a88
   - **Result**: 2 orphans still remaining
   - **Critical**: Child 1's removal did NOT clean its datastore entry

## Key Findings

### 1. Inconsistent Datastore Cleanup
The platform's cleanup of `__devices_store` is unreliable:
- Some devices are properly cleaned (Child 3)
- Others leave orphaned entries (Child 1, Child 2)
- The gateway's entry persisted initially but was eventually cleaned

### 2. Orphan Detection Results
After all removals completed:
```
Orphaned entries in __devices_store:
- d08ce559-03ba-436e-bf69-73f8ce5c6e9d (Child 2)
- 90f57a28-f8f5-4e7e-b9a0-bf15a42e3a88 (Child 1)
```

### 3. Platform Behavior
- The SmartThings platform automatically handles parent-child relationships
- When a gateway is deleted, children are automatically removed
- `driver:get_devices()` correctly reflects device removal
- `driver.datastore.__devices_store` does NOT reliably clean up

### 4. Original Crash Cause

The investigation began when attempting to manually delete child devices during gateway removal resulted in a fatal crash:

```
2025-06-07T09:47:41.542205674Z FATAL Datastore Debug Driver  Remote Error: Other("error in scripting-engine broker")
Traceback:
stack traceback:
    [C]: in function 'coroutine.yield'
    [string "coroutine"]:15: in function 'wrapped_coroutine_resume'
    [string "cosock.lua"]:219: in upvalue 'step_thread'
    [string "cosock.lua"]:358: in field 'run'
    [string "st/driver.lua"]:1096: in field 'run'
    [string "init.lua"]:482: in method 'run'
    [string "init.lua"]:486: in main chunk
```

**Root Cause Analysis:**
- The driver's `device_removed` handler was attempting to manually delete child devices using `driver:try_delete_device(child_id)`
- This created a race condition where:
  1. The SmartThings platform was already automatically removing child devices when the parent gateway was deleted
  2. The driver was simultaneously trying to delete the same child devices
  3. Both deletion attempts were operating on the same internal resources
- The "scripting-engine broker" error indicates a conflict in the platform's internal messaging/event system
- The crash occurred specifically when processing the second child device deletion, suggesting the platform's state became corrupted

**The Fix:**
Removed all manual child device deletion code and allowed the SmartThings platform to handle parent-child relationships automatically, as it's designed to do. This eliminated the race condition and prevented the crash.

## Implications

1. **Memory Leak**: Orphaned entries accumulate over time, potentially causing memory issues
2. **Data Inconsistency**: The datastore doesn't accurately reflect actual device state
3. **Platform Bug**: This appears to be a bug in the SmartThings Edge platform itself
