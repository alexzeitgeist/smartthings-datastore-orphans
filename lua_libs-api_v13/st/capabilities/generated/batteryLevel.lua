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

return [[{"name": "Battery Level", "status": "live", "attributes": {"battery": {"schema": {"type": "object", "properties": {"value": {"type": "string", "enum": ["normal", "warning", "critical"]}}, "additionalProperties": false, "required": ["value"]}}, "type": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"$ref": "BatteryType"}}, "required": ["value"]}}, "quantity": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"$ref": "PositiveInteger"}}, "required": ["value"]}}}, "commands": {}, "id": "batteryLevel", "version": 1}]]
