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

return [[{"name": "Motion Bed", "status": "proposed", "attributes": {"mode": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"type": "string", "enum": ["preset1", "preset2", "zeroG", "flat", "tv", "reading", "antiSnore"]}}}}, "supportedModes": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"type": "array", "items": {"type": "string", "enum": ["preset1", "preset2", "zeroG", "flat", "tv", "reading", "antiSnore"]}}}}}, "supportedMotionPositions": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"type": "array", "items": {"type": "string", "enum": ["headUp", "headDown", "footUp", "footDown", "elevationUp", "elevationDown"]}}}}}, "statelessMode": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"type": "boolean"}}}}}, "commands": {"setMode": {"arguments": [{"name": "mode", "schema": {"type": "string", "enum": ["preset1", "preset2", "zeroG", "flat", "tv", "reading", "antiSnore"]}, "optional": false}], "name": "setMode"}, "start": {"arguments": [{"name": "position", "schema": {"type": "string", "enum": ["headUp", "headDown", "footUp", "footDown", "elevationUp", "elevationDown"]}, "optional": false}], "name": "start"}, "stop": {"arguments": [{"name": "position", "schema": {"type": "string", "enum": ["headUp", "headDown", "footUp", "footDown", "elevationUp", "elevationDown"]}, "optional": false}], "name": "stop"}}, "id": "motionBed", "version": 1}]]
