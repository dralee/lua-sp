--[[
set
2025.12.23 by dralee
]]

-- save the value in keys
function Set(list)
    local set = {}
    for _,v in pairs(list) do
        set[v] = true
    end
    return set
end

local list = {"a", "b","c","e","a","c","d","f"}
local set = Set(list)

for  v,_ in pairs(set) do
    print(v)
end