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

return [[{"name": "Window Shade", "status": "live", "attributes": {"windowShade": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"$ref": "OpenableState"}}, "required": ["value"]}, "enumCommands": [{"command": "close", "value": "closed"}, {"command": "open", "value": "open"}], "actedOnBy": ["open", "close", "pause"]}, "supportedWindowShadeCommands": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"type": "array", "items": {"type": "string", "enum": ["open", "close", "pause"]}}}}}}, "commands": {"close": {"arguments": [], "name": "close"}, "open": {"arguments": [], "name": "open"}, "pause": {"arguments": [], "name": "pause"}}, "id": "windowShade", "version": 1}]]
