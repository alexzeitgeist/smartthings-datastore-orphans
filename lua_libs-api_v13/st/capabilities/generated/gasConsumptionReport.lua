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

return [[{"id": "gasConsumptionReport", "version": 1, "status": "proposed", "name": "Gas Consumption Report", "ephemeral": false, "attributes": {"gasConsumption": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"type": "object", "properties": {"deltaUsage": {"type": "number"}, "usageSaved": {"type": "number"}, "cumulativeUsage": {"type": "number"}}, "required": ["deltaUsage"]}, "unit": {"type": "string", "enum": ["Wh", "m^3", "cf", "MJ"], "default": "Wh"}}, "required": ["value"]}, "enumCommands": []}}, "commands": {}}]]
