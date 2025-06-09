-- Copyright 2024 SmartThings
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

local log = require "log"

local AliasTable = {}

function AliasTable:new(o)
  o = o or {}
  setmetatable(o, self)
  self.__index = self
  return o
end

function AliasTable.add_to_class(aliases, klass)
  local mt = getmetatable(klass) or {}
  setmetatable(klass, mt)
  local old_index = mt.__index
  function mt:__index(key)
    local target = aliases[key]
    if target ~= nil then
      if type(target) == "table" then
        log.warn(string.format("Alias: %s => %s", key, target.NAME))
        return target
      else
        log.warn(string.format("Alias: %s => %s", key, target))
        key = target
      end
    end

    local value = rawget(self, key)
    if value ~= nil then
      return value
    end

    if old_index == nil then
      return nil
    end

    if type(old_index) == "function" then
      return old_index(self, key)
    end
    return old_index[key]
  end
end

return AliasTable
