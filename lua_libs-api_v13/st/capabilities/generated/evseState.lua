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

return [[{"name": "Evse State", "status": "proposed", "attributes": {"state": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"$ref": "EvseState"}}, "required": ["value"]}}, "supplyState": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"$ref": "EvSupplyState"}}, "required": ["value"]}}, "faultState": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"$ref": "EvseFaultState"}}, "required": ["value"]}}}, "commands": {}, "id": "evseState", "version": 1}]]
