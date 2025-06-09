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

return [[{"id": "multipleZonePresence", "version": 1, "status": "proposed", "name": "Multiple Zone Presence", "ephemeral": false, "attributes": {"zoneState": {"schema": {"type": "object", "properties": {"value": {"type": "array", "items": {"title": "zoneState", "type": "object", "additionalProperties": false, "properties": {"id": {"$ref": "String"}, "name": {"$ref": "String"}, "state": {"$ref": "PresenceState"}}, "required": ["id", "name", "state"]}}}, "additionalProperties": false, "required": ["value"]}, "enumCommands": []}}, "commands": {"updateZoneName": {"name": "updateZoneName", "arguments": [{"name": "id", "optional": false, "schema": {"$ref": "String"}}, {"name": "name", "optional": false, "schema": {"$ref": "String"}}]}, "deleteZone": {"name": "deleteZone", "arguments": [{"name": "id", "optional": false, "schema": {"$ref": "String"}}]}, "createZone": {"name": "createZone", "arguments": [{"name": "name", "optional": false, "schema": {"$ref": "String"}}, {"name": "id", "optional": true, "schema": {"$ref": "String"}}]}}}]]
