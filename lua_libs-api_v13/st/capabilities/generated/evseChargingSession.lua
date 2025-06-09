-- Copyright 2025 SmartThings
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

return [[{"name": "Evse Charging Session", "status": "proposed", "attributes": {"chargingState": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"type": "string", "enum": ["charging", "stopped", "disabled"]}}, "required": ["value"]}}, "targetEndTime": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"$ref": "Iso8601Date"}}, "required": ["value"]}}, "minCurrent": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"type": "integer", "minimum": 0}, "unit": {"type": "string", "enum": ["mA"], "default": "mA"}}, "required": ["value"]}}, "maxCurrent": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"type": "integer", "minimum": 0}, "unit": {"type": "string", "enum": ["mA"], "default": "mA"}}, "required": ["value"]}}, "sessionTime": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"type": "integer", "minimum": 0}, "unit": {"type": "string", "enum": ["s"], "default": "s"}}, "required": ["value"]}}, "energyDelivered": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"type": "integer", "minimum": 0}, "unit": {"type": "string", "enum": ["mWh"], "default": "mWh"}}, "required": ["value"]}}, "supportedChargingCommands": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"type": "array", "items": {"type": "string", "enum": ["enableCharging", "disableCharging"]}}}}}}, "commands": {"setTargetEndTime": {"arguments": [{"name": "time", "schema": {"$ref": "Iso8601Date"}, "optional": false}], "name": "setChargingTime"}, "setMinCurrent": {"arguments": [{"name": "minCurrent", "schema": {"type": "integer", "minimum": 0}, "optional": false}], "name": "setMinCurrent"}, "setMaxCurrent": {"arguments": [{"name": "maxCurrent", "schema": {"type": "integer", "minimum": 0}, "optional": false}], "name": "setMaxCurrent"}, "enableCharging": {"arguments": [{"name": "time", "schema": {"$ref": "Iso8601Date"}, "optional": false}, {"name": "minCurrent", "schema": {"type": "integer", "minimum": 0}, "optional": false}, {"name": "maxCurrent", "schema": {"type": "integer", "minimum": 0}, "optional": false}], "name": "enableCharging"}, "disableCharging": {"arguments": [], "name": "disableCharging"}}, "id": "evseChargingSession", "version": 1}]]
