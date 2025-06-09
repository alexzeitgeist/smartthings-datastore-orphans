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

return [[{"name": "Massage Time Control", "status": "proposed", "attributes": {"completionTime": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"$ref": "Iso8601Date"}}, "required": ["value"]}}, "supportedSetTimes": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"type": "array", "items": {"type": "integer", "enum": [0, 10, 20, 30, 40, 50, 60]}}}}}}, "commands": {"setTime": {"arguments": [{"name": "massageTime", "schema": {"type": "integer", "minimum": 0, "maximum": 60}}], "name": "setTime"}}, "id": "massageTimeControl", "version": 1}]]
