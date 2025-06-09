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

return require("st.matter.clusters.aliases.AliasTable"):new {
  -- 1.0 to 1.2 Aliases
  FADE_TO_OFF_IN_0P8_SECONDS = "DELAYED_OFF_FAST_FADE",
  _50_PERCENT_DIM_DOWN_IN_0P8_SECONDS_THEN_FADE_TO_OFF_IN_12_SECONDS = "DELAYED_OFF_SLOW_FADE",
}
