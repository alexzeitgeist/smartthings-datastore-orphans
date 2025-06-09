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

return [[{"name": "Video Capture 2", "status": "proposed", "id": "videoCapture2", "version": 1, "attributes": {"clip": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"type": "object", "additionalProperties": true, "required": ["clipId", "startDate"], "properties": {"clipId": {"$ref": "UUID"}, "duration": {"type": "integer"}, "prebuffer": {"type": "integer"}, "triggerType": {"$ref": "String"}, "triggerId": {"$ref": "String"}, "mediaUrl": {"$ref": "URL"}, "thumbUrl": {"$ref": "URL"}, "startDate": {"$ref": "Iso8601Date"}, "expirationDate": {"$ref": "Iso8601Date"}, "format": {"$ref": "String"}}}}, "required": ["value"]}, "actedOnBy": ["capture", "stopCapture"]}}, "commands": {"capture": {"name": "capture", "arguments": [{"name": "clipId", "schema": {"$ref": "UUID"}, "optional": true}, {"name": "mediaUrl", "schema": {"$ref": "URL"}, "optional": true}, {"name": "imageUrl", "schema": {"$ref": "URL"}, "optional": true}, {"name": "duration", "schema": {"type": "integer"}, "optional": true}, {"name": "triggerType", "schema": {"$ref": "String"}, "optional": true}, {"name": "triggerId", "schema": {"$ref": "String"}, "optional": true}, {"name": "prebuffer", "schema": {"type": "integer"}, "optional": true}]}, "stopCapture": {"name": "stopCapture", "arguments": [{"name": "clipId", "schema": {"$ref": "UUID"}, "optional": false}]}, "uploadComplete": {"name": "uploadComplete", "arguments": [{"name": "clip", "schema": {"type": "object", "additionalProperties": true, "properties": {"clipId": {"schema": {"$ref": "UUID"}, "optional": false}, "duration": {"schema": {"type": "integer"}, "optional": false}, "startDate": {"schema": {"$ref": "Iso8601Date"}}, "expirationDate": {"schema": {"$ref": "Iso8601Date"}, "optional": false}, "mediaUrl": {"schema": {"$ref": "URL"}, "optional": false}, "triggerType": {"schema": {"$ref": "String"}, "optional": true}, "triggerId": {"schema": {"$ref": "String"}, "optional": true}}}}]}, "uploadFailed": {"name": "uploadFailed", "arguments": [{"name": "clipId", "schema": {"$ref": "UUID"}, "optional": false}, {"name": "error", "schema": {"$ref": "JsonObject"}, "optional": false}]}}}]]
