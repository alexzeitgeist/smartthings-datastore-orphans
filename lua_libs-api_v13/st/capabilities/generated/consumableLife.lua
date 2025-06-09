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

return [[{"name": "Consumable Life", "status": "proposed", "attributes": {"startDate": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"$ref": "Iso8601Date"}}, "required": ["value"]}}, "lifespan": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"$ref": "PositiveInteger"}}}}, "type": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"$ref": "ConsumableType"}}}}}, "commands": {"reset": {"arguments": [], "name": "reset"}}, "id": "consumableLife", "version": 1}]]
