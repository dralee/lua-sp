--[[
list insert
2025.12.24 by dralee
]]


List = {}
List.__index = List

-- modify list behavior when list is called to push elements
setmetatable(List, {
    __call = function(_, ...)
        local t = setmetatable({ length = 0 }, List)
        local args = {...} -- convert varargs to table
        for _,v in ipairs(args) do
            print("meta push ...", v[1])
            t:push(v)
        end
        return t
    end
})

-- push an element to the end of the list
function List:push(t)
    -- move till last node
    if self.last then
        self.last._next = t
        t._prev = self.last
        self.last = t
    else
        -- set the node as first node
        self.first = t
        self.last = t
    end
    print("push ...", self.length)
    -- increment the length of the list
    self.length = self.length + 1
end

-- remove element from the end of the list and remove(t) to remove a given element
function List:removeLast()
    -- if last is nil then list is empty
    if not self.last then
        return nil
    end
    local removedElement = self.last

    if removedElement._prev then
        removedElement._prev._next = nil
        self.last = removedElement._prev
        removedElement._prev = nil
    else
        self.first = nil
        self.last = nil
    end
    self.length = self.length - 1

    return removedElement
end

-- remove a specific element t
function List:remove(t)
    -- if node to delete has next node
    -- update the pointers of prev and next nodes
    if t._next then
        if t._prev then
            t._next._prev = t._prev
            t._prev._next = t._next
        else
            -- this was the first node
            t._next._prev = nil
            self.first = t._next
        end
    elseif t._prev then
      -- this was the last node
      t._prev._next = nil
      self.last = t._prev
    else
        -- this was the only node
        self.first = nil
        self.last = nil
    end

    t._next = nil
    t._prev = nil
    self.length = self.length - 1
end

-- iterate through the list
local function iterate(self, current)
    if not current then
        current = self.first
    else
        current = current._next
    end
    return current
end

function List:iterate()
    return iterate, self
end


-- test
local a = { "hello" }
local b = { "world" }

local list = List(a, b)

local c = { "What" }
local d = { "How" }

list:push(c)
list:push(d)
list:push({"where"})

print("the list elements...")
for v in list:iterate() do
    print(v[1])
end

list:removeLast()
print("after remove last: the list elements...")
for v in list:iterate() do
    print(v[1])
end

list:remove(c)

print("after remove c: elements...")
for v in list:iterate() do
    print(v[1])
end