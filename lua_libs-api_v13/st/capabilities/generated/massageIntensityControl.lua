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

return [[{"name": "Massage Intensity Control", "status": "proposed", "attributes": {"intensityHead": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"type": "integer"}}}}, "intensityFoot": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"type": "integer"}}}}, "intensityWhole": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"type": "integer"}}}}, "intensityRange": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"type": "object", "additionalProperties": false, "properties": {"minimum": {"type": "integer"}, "maximum": {"type": "integer"}, "step": {"type": "integer"}}, "required": ["minimum", "maximum"]}}}}, "supportedPositions": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"type": "array", "items": {"type": "string", "enum": ["head", "foot", "whole"]}}}}}}, "commands": {"setIntensityHead": {"arguments": [{"name": "intensity", "schema": {"type": "integer"}, "optional": false}], "name": "setIntensityHead"}, "setIntensityFoot": {"arguments": [{"name": "intensity", "schema": {"type": "integer"}, "optional": false}], "name": "setIntensityFoot"}, "setIntensityWhole": {"arguments": [{"name": "intensity", "schema": {"type": "integer"}, "optional": false}], "name": "setIntensityWhole"}}, "id": "massageIntensityControl", "version": 1}]]
