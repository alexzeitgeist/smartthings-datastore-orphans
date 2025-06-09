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

return [[{"name": "Lock Users", "id": "lockUsers", "version": 1, "status": "proposed", "attributes": {"users": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"type": "array", "items": {"type": "object", "additionalProperties": false, "properties": {"userIndex": {"type": "integer", "minimum": 1}, "userType": {"$ref": "LockUserType"}}, "required": ["userIndex", "userType"]}}}}}, "commandResult": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"type": "object", "additionalProperties": false, "properties": {"commandName": {"type": "string", "enum": ["addUser", "updateUser", "deleteUser", "deleteAllUsers"]}, "userIndex": {"type": "integer"}, "statusCode": {"type": "string", "enum": ["success", "failure", "occupied", "invalidCommand", "resourceExhausted", "busy"]}}, "required": ["commandName", "statusCode"]}}}}, "totalUsersSupported": {"schema": {"type": "object", "additionalProperties": false, "properties": {"value": {"type": "integer", "minimum": 0}}, "required": ["value"]}}}, "commands": {"addUser": {"name": "addUser", "arguments": [{"name": "userName", "schema": {"type": "string", "maxLength": 10}}, {"name": "userType", "schema": {"$ref": "LockUserType"}}]}, "updateUser": {"name": "updateUser", "arguments": [{"name": "userIndex", "schema": {"type": "integer", "minimum": 1}}, {"name": "userName", "schema": {"type": "string", "maxLength": 10}}, {"name": "userType", "schema": {"$ref": "LockUserType"}}]}, "deleteUser": {"name": "deleteUser", "arguments": [{"name": "userIndex", "schema": {"type": "integer", "minimum": 1}}]}, "deleteAllUsers": {"name": "deleteAllUsers", "arguments": []}}}]]
