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

return [[{"name": "Cook Time", "status": "proposed", "attributes": {"cookTime": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"type": "integer", "minimum": 1, "maximum": 86400}, "unit": {"type": "string", "enum": ["s"], "default": "s"}}, "required": ["value"]}, "setter": "setCookTime"}, "cookTimeRange": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"type": "object", "additionalProperties": false, "properties": {"minimum": {"type": "integer", "minimum": 1, "maximum": 86400}, "maximum": {"type": "integer", "minimum": 1, "maximum": 86400}}, "required": ["minimum", "maximum"]}, "unit": {"type": "string", "enum": ["s"], "default": "s"}}}}}, "commands": {"setCookTime": {"arguments": [{"name": "time", "schema": {"type": "integer", "minimum": 1, "maximum": 86400}, "optional": false}], "name": "setCookTime"}}, "id": "cookTime", "version": 1}]]
