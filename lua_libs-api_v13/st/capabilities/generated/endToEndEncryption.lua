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

return [[{"name": "End to End Encryption", "status": "proposed", "id": "endToEndEncryption", "version": 1, "ephemeral": true, "attributes": {"encryptedKek": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"schema": {"type": "object", "additionalProperties": false, "properties": {"key": {"type": "string"}, "clientId": {"$ref": "String"}}, "required": ["key", "clientId"]}}}, "required": ["value"]}, "actedOnBy": ["encryptKek"]}, "nonce": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"schema": {"type": "object", "additionalProperties": false, "properties": {"nonce": {"type": "string"}, "clientId": {"$ref": "String"}}, "required": ["nonce", "clientId"]}}}, "required": ["value"]}, "actedOnBy": ["generateNonce"]}}, "commands": {"encryptKek": {"name": "encryptKek", "arguments": [{"name": "nonce", "schema": {"type": "string"}, "optional": false}, {"name": "signature", "schema": {"type": "string"}, "optional": false}, {"name": "certificate", "schema": {"type": "string"}, "optional": false}, {"name": "clientId", "schema": {"$ref": "String"}, "optional": false}]}, "generateNonce": {"name": "generateNonce", "arguments": [{"name": "clientId", "schema": {"$ref": "String"}, "optional": false}]}}}]]
