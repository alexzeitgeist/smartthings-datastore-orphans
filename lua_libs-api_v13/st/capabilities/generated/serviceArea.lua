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

return [[{"name": "Service Area", "status": "proposed", "attributes": {"supportedAreas": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"type": "array", "items": {"type": "object", "additionalProperties": false, "properties": {"areaId": {"type": "integer", "minimum": 0}, "areaName": {"type": "string"}}, "required": ["areaId", "areaName"]}}}}}, "selectedAreas": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"type": "array", "items": {"type": "integer", "minimum": 0}}}}, "setter": "selectAreas"}}, "commands": {"selectAreas": {"name": "selectAreas", "arguments": [{"name": "areas", "schema": {"type": "array", "items": {"type": "integer", "minimum": 0}}}]}}, "id": "serviceArea", "version": 1}]]
