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

return [[{"id": "batchGasConsumptionReport", "version": 1, "status": "proposed", "name": "Batch Gas Consumption Report", "ephemeral": false, "attributes": {"hourlyGasConsumptions": {"schema": {"type": "object", "properties": {"value": {"type": "array", "items": {"type": "object", "additionalProperties": false, "properties": {"deltaUsage": {"type": "number"}, "usageSaved": {"type": "number"}, "start": {"$ref": "Iso8601Date"}}, "required": ["start", "deltaUsage"]}}, "unit": {"type": "string", "enum": ["Wh", "m^3", "cf", "MJ"], "default": "Wh"}}, "additionalProperties": false, "required": ["value"]}, "enumCommands": []}, "hourlyUsageViewAvailable": {"schema": {"type": "object", "properties": {"value": {"type": "boolean"}}, "additionalProperties": false, "required": ["value"]}, "enumCommands": []}, "todayUsageViewAvailable": {"schema": {"type": "object", "properties": {"value": {"type": "boolean"}}, "additionalProperties": false, "required": ["value"]}, "enumCommands": []}}, "commands": {}}]]
