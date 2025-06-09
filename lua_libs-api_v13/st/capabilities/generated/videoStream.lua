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

return [[{"name": "Video Stream", "status": "live", "attributes": {"stream": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"$ref": "JsonObject"}}, "required": ["value"]}, "actedOnBy": ["startStream", "stopStream"]}, "supportedFeatures": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"type": "object", "additionalProperties": true, "properties": {"audio": {"type": "string"}, "video": {"type": "string"}, "portrait": {"type": "boolean"}, "width": {"type": "integer", "minimum": 240, "maximum": 4096}, "height": {"type": "integer", "minimum": 240, "maximum": 4096}}}}, "required": ["value"]}}}, "commands": {"startStream": {"arguments": [], "name": "startStream"}, "stopStream": {"arguments": [], "name": "stopStream"}}, "id": "videoStream", "version": 1}]]
