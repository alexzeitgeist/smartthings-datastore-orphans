local json = require "st.json"
local datastore = _envlibrequire "datastore"
local log = require "log"
local cosock = require "cosock"

--- @module st_datastore
local st_datastore = {}

-- A registry of metatables we have created for datastore entries.  This allows us to
-- know when a value passed in actually has one of our mts
local our_mts = {}

-- Set up our mt registry with weak keys, so they will collected if this is the last reference
local weak_key_mt = {}
weak_key_mt.__mode = "k"
setmetatable(our_mts, weak_key_mt)

local convert_child
local dirty = false

-- Recursively check keys and values to verify that they will be serializable
-- Raises error if any value is invalid
local function check_if_valid(value)
    local t = type(value)
    local valid_types = {
        boolean = true,
        number = true,
        string = true,
        ["nil"] = true,
    }

    if t == "table" then
        local table_mt = getmetatable(value)
        -- Only allow a table with metatable behavior if it is a datastore table
        if table_mt ~= nil and not our_mts[table_mt] then
            error("datastore table values should be simple and not include metatable functionality", 2)
        end
        for k,v in pairs(value) do
            check_if_valid(k)
            check_if_valid(v)
        end
        -- all keys and values are of accepted types.
        return
    elseif valid_types[t] then
        return
    end
    error("Data store keys and values must be JSON encodable: " .. tostring(value) .. " is of unsupported type " .. type(value), 2)
end

local proxies = {}
setmetatable(proxies, weak_key_mt)

local function mt_new_index(self, key, value)
    local mt = getmetatable(self)
    if mt.__funcs[key] ~= nil then
        error("Key: " .. key .. " refers to a protected method, do not overwrite.", 2)
    end
    -- will raise error if invalid
    check_if_valid(key)
    check_if_valid(value)

    -- only able to set here if it was valid
    local values = proxies[self]
    values[key] = convert_child(value)
    dirty = true
end

local function mt_index(self, key)
    local mt = getmetatable(self)
    local values = proxies[self]
    return mt.__funcs[key] or values[key]
end

local function mt_pairs(self)
    return pairs(proxies[self])
end

local function mt_load(self)
    local loaded_json = datastore.get()
    -- the emptry string is not valid JSON.
    -- dkjson for whatever reason handled this gracefully,
    -- but serde will throw an error. We guard against this
    -- now.
    if (loaded_json == nil) or #loaded_json == 0 then return end
    local success, loaded_table = pcall(json.decode, loaded_json)
    if success then
        if type(loaded_table) == "table" then
            local values = proxies[self]
            for k, v in pairs(loaded_table) do
                values[k] = convert_child(v)
            end
        end
    else
        -- if this fails, it's gone, just go as though we had no datastore
        -- loaded_table contains the error from the pcall
        log.error_with({hub_logs = true}, "Could not load datastore:\n" .. tostring(loaded_table), 2)
    end
end

--- If a task was spawned to perform a save after the hubs debounce timer has elapsed and has not
--- yet completed
local debounce_in_progress = false
--- Call into the hub API for datastore.set
---@param self table The datastore to save
---@param force boolean If true will bypass the hubs debounce mechanism on saves
local function do_save(self, force)
    if not force and debounce_in_progress then
        return
    end
    -- Shouldn't fail as we have ensured that all values are encodable, but could fail if
    -- users bypassed restrictions
    local succ, val = pcall(json.encode, self:get_serializable())
    if succ then
        local succ, set_err, to = datastore.set(val)
        if not succ and set_err == "debounce" then
            debounce_in_progress = true
            cosock.spawn(function()
                cosock.socket.sleep(to or 10)
                -- Force saving here to avoid the early return at the top of `do_save`
                do_save(self, true)
                debounce_in_progress = false
            end)
            return 1
        end
        if set_err then
          return nil, set_err
        end
        return 1
    else
        error("Unable to serialize datastore value: " .. tostring(val), 3)
    end
end


local function mt_save(self)
    if debounce_in_progress then
        return
    end
    return do_save(self, false)
end

local function mt_commit(self)
    if not datastore.commit then
        return nil, "Datastore commit not supported on this firmware"
    end
    local saved, err = do_save(self, true)
    if not saved then
        return nil, err
    end
    return datastore.commit()
end

local function mt_is_dirty(self)
    return dirty
end

local function get_serializable(self)
    local valid_types = {
        boolean = true,
        number = true,
        string = true,
        ["nil"] = true,
    }
    local out_table = {}
    for k,v in pairs(proxies[self]) do
        local t = type(v)
        if t == "table" then
            out_table[k] = v:get_serializable()
        elseif valid_types[t] then
            out_table[k] = v
        else
            error("Data store keys and values must be JSON encodable: " .. tostring(v) .. " is of unsupported type " .. type(v), 2)
        end
    end
    return out_table
end

-- Create a new metatable to control the behavior of a datastore or a nested table
-- within that datastore.  The metatable constrains values to be serializable so
-- that we can pass it over RPC.
local function new_mt(head)
    local mt = {}
    our_mts[mt] = true

    mt.__funcs = {}

    -- Set up controls to ensure any value written to the data store is json encodable
    mt.__newindex = mt_new_index
    mt.__index = mt_index
    mt.__pairs = mt_pairs

    -- Define any functionality on the data store we want
    if head then
        mt.__funcs.load = mt_load
        mt.__funcs.save = mt_save
        mt.__funcs.commit = mt_commit
        mt.__funcs._force_save = function(self)
            return do_save(self, true)
        end
    end

    --- @function st_datastore:is_dirty()
    --- A function to return the dirty status of the datastore
    --- @return boolean the dirty status of the datastore
    mt.__funcs.is_dirty = mt_is_dirty

    --- @function st_datastore.getserializable()
    --- A function to return the serialable version of the table
    ---
    --- This primarily will pull out just the values and return the value table without
    --- metatables and functions included
    ---
    --- @return table a table with the values to be serialized
    mt.__funcs.get_serializable = get_serializable

    return mt
end

local head_mt = new_mt(true)
local child_mt = new_mt(false)

-- This is a local recursive function to convert each value present in a table being set
-- in the data store to be able to use the above defined metatable.
function convert_child(child)
    if type(child) ~= "table" then
        return child
    else
        local values = {}
        for k,v in pairs(child) do
            child[k] = nil
            values[k] = convert_child(v)
        end
        proxies[child] = values
        setmetatable(child, child_mt)
        return child
    end
end

--- Initialize the datastore for this driver
---
--- This will create and return a special lua table which, when written to
---
--- @param driver Driver The current driver running containing necessary context for execution
--- @return table The table to write values that need to be persisted to.
function st_datastore.init(driver)
    local ds = {}
    proxies[ds] = {}
    setmetatable(ds, head_mt)
    ds:load()
    return ds
end

return st_datastore
