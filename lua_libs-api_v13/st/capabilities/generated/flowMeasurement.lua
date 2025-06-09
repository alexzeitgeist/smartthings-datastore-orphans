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

return [[{"name": "Flow Measurement", "status": "proposed", "attributes": {"flow": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"type": "number", "minimum": 0}, "unit": {"type": "string", "enum": ["m^3/h"], "default": "m^3/h"}}, "required": ["value"]}}, "flowRange": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"type": "object", "additionalProperties": false, "properties": {"minimum": {"$ref": "FlowValue"}, "maximum": {"$ref": "FlowValue"}}, "required": ["minimum", "maximum"]}, "unit": {"type": "string", "enum": ["m^3/h"], "default": "m^3/h"}}, "required": ["value"]}}}, "commands": {}, "id": "flowMeasurement", "version": 1}]]
