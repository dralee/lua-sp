--[[
weaktable
2025.12.23 by dralee
]]

-- weak table
local days = {}
-- meta table
local modes = {}
-- set the metatable
setmetatable(days, modes)

-- set the keys of days table as weak keys
modes.__mode = "k"

-- create first key as object
local key = {}
days[key] = "mon"

-- create a new key as object
key = {}
days[key] = "MON"

local function output(msg)
    print("==================" .. msg .. "==================")
    for _, v in pairs(days) do
        print(v)
    end
end

output("before gc")

-- force a garbage collection cycle
-- to collect first key as it is not referenced now
collectgarbage()

output("after gc")

--[[
==================before gc==================
mon
MON
==================after gc==================
MON
]]