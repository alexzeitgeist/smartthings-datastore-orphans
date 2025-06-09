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

return [[{"name": "Laundry Washer Rinse Mode", "status": "live", "attributes": {"rinseMode": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"$ref": "RinseMode"}}, "required": ["value"]}, "setter": "setRinseMode"}, "supportedRinseModes": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"type": "array", "items": {"$ref": "RinseMode"}}}, "required": ["value"]}}}, "commands": {"setRinseMode": {"arguments": [{"name": "rinseMode", "schema": {"$ref": "RinseMode"}, "optional": false}], "name": "setRinseMode"}}, "id": "laundryWasherRinseMode", "version": 1}]]
