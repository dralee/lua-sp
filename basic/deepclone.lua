--[[
deep copy of table
2025.12.23 by dralee
]]

local function deepcopy(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in next, orig, nil do
            copy[deepcopy(orig_key)] = deepcopy(orig_value)
        end
        setmetatable(copy, deepcopy(getmetatable(orig)))
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end

local t = {1,2,3, nil, ["inner"]={a=1, b=2, c=3}, 4,5}
local t2 = deepcopy(t)
print(t2[1], t2["inner"]["b"], "code", t["inner"], t2["inner"])