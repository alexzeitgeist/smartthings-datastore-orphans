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

--- The files in this module define aliases for various Matter cluster names,
--- attribute names, etc. This allows for backwards compatibility between
--- Matter releases.
---
--- The aliases are updated with each release to:
---  1) add previous alias
---  2) update all aliases to the latest cluster name

return require("st.matter.clusters.aliases.AliasTable"):new {
  -- 1.0 to 1.2 Aliases
  Basic = "BasicInformation",
  Scenes = "ScenesManagement",
}
