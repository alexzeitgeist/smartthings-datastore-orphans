-- Copyright (c) 2023 SmartThings.
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

local MessageDispatcher = require "st.dispatcher"

local add_handlers_to_list = function(handler, list)
  local packed_handlers = {}
  if type(handler) == "function" then
    packed_handlers = { handler }
  elseif type(handler) == "table" then
    packed_handlers = handler
  end
  for _, h in ipairs(packed_handlers) do
    table.insert(list, h)
  end
end

--- @class SecretDataDispatcher : MessageDispatcher
---
--- This inherits from the MessageDispatcher and is intended to handle secret data events
---
--- @field public name string A name of this level of dispatcher used for logging
--- @field public child_dispatchers SecretDataDispatcher[] those below this handler in the hierarchy
--- @field public default_handlers table The `secret_data_handlers` structure from the Driver
--- @field public dispatcher_class_name string "SecretDataDispatcher"
local SecretDataDispatcher = {}

function SecretDataDispatcher.init(cls, name, dispatcher_filter, default_handlers)
  return MessageDispatcher.init(cls, name, dispatcher_filter, default_handlers, "SecretDataDispatcher")
end

--- Return a flat list of default handlers that can handle this secret_data event
---
--- These will be of the form of the `secret_data_handlers` on a driver  E.g.
--- `handler(driver, device, secret_data)`
---
--- @param driver Driver the driver context
--- @param device st.Device the device the message came from/is for
--- @param secret_data_event string The event triggering this
--- @return function[] a flat list of the default handlers that can handle this message
function SecretDataDispatcher:find_default_handlers(driver, device, secret_data_event)
  local handlers = {}
  add_handlers_to_list(self.default_handlers[secret_data_event.secret_kind], handlers)
  return handlers
end

--- Return a multiline string representation of the dispatchers default handlers
---
--- @param self SecretDataDispatcher
--- @param indent number the indent level to allow for the hierarchy to be visually distinguishable
--- @return string the string representation
function SecretDataDispatcher.pretty_print_default_handlers(self, indent)
  indent = indent or 0
  local indent_str = string.rep(" ", indent)
  local out = string.format("%sdefault_handlers:\n", indent_str)
  for event, funcs in pairs(self.default_handlers) do
    out = out .. string.format("%s  %s:\n", indent_str, event)
  end
  return out
end

setmetatable(SecretDataDispatcher, {
  __index = MessageDispatcher,
  __call = SecretDataDispatcher.init
})

return SecretDataDispatcher
