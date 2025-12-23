--[[
stack
2025.12.23 by dralee
]]

function Stack()
    return setmetatable({
    _stack = {},
    count = 0,
    
    push = function(self, value)
        self.count = self.count + 1
        rawset(self._stack, self.count, value)
    end,

    pop = function(self)
        self.count = self.count - 1
        return table.remove(self._stack)
    end
    }, {
        __index = function (self, index)
            return rawget(self._stack, index)
        end
    })
end

local s = Stack()
s:push(1)
s:push(2)
s:push(3)
print(s:pop())
print(s:pop())
print(s:pop())