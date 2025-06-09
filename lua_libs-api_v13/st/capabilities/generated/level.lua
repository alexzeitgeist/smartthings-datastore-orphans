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

return [[{"name": "Level", "status": "proposed", "attributes": {"level": {"schema": {"$ref": "IntegerPercent"}, "setter": "setLevel"}, "levelRange": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"type": "object", "additionalProperties": false, "properties": {"minimum": {"type": "integer", "minimum": 0, "maximum": 100}, "maximum": {"type": "integer", "minimum": 0, "maximum": 100}, "step": {"type": "integer", "minimum": 1, "maximum": 100}}, "required": ["minimum", "maximum"]}, "unit": {"type": "string", "enum": ["%"], "default": "%"}}}}}, "commands": {"setLevel": {"arguments": [{"name": "level", "schema": {"type": "integer", "minimum": 0, "maximum": 100}, "optional": false}, {"name": "rate", "schema": {"$ref": "PositiveInteger"}, "optional": true}], "name": "setLevel"}}, "id": "level", "version": 1}]]
