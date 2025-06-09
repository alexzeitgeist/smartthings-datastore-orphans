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

return [[{"name": "Security System", "status": "live", "attributes": {"securitySystemStatus": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"type": "string", "enum": ["armedAway", "armedStay", "disarmed"]}}, "required": ["value"]}, "enumCommands": [{"command": "armStay", "value": "armedStay"}, {"command": "armAway", "value": "armedAway"}, {"command": "disarm", "value": "disarmed"}]}, "supportedSecuritySystemStatuses": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"type": "array", "items": {"type": "string", "enum": ["armedAway", "armedStay", "disarmed"]}}}}}, "supportedSecuritySystemCommands": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"type": "array", "items": {"type": "string", "enum": ["armAway", "armStay", "disarm"]}}}}}, "sensorStatus": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"type": "string", "enum": ["ready", "bypassedNotReady"]}, "data": {"type": "object", "additionalProperties": false, "properties": {"openSensors": {"type": "array", "items": {"type": "object", "additionalProperties": false, "properties": {"name": {"$ref": "String"}, "status": {"type": "string", "enum": ["open", "unlocked", "unresponsive", "other"]}, "externalId": {"$ref": "String"}}}}}}}}}, "alarm": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"$ref": "String"}}, "required": ["value"]}}}, "commands": {"armStay": {"arguments": [{"name": "bypassAll", "schema": {"type": "boolean"}, "optional": true}], "name": "armStay"}, "armAway": {"arguments": [{"name": "bypassAll", "schema": {"type": "boolean"}, "optional": true}], "name": "armAway"}, "disarm": {"arguments": [], "name": "disarm"}}, "id": "securitySystem", "version": 1}]]
