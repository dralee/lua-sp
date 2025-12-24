

-- List Implementation
list = {}
list.__index = list

setmetatable(list, { __call = function(_, ...)
   local t = setmetatable({ length = 0 }, list)
      for _, v in ipairs{...} do
        print("meta push ...", v)
        t:push(v) 
      end
      return t
   end })

-- push an element to the end of the list
function list:push(t)
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
   -- increment the length of the list
   self.length = self.length + 1
end

-- iterate through the list
local function iterate(self, current)
   if not current then
      current = self.first
   elseif current then
      current = current._next
   end
  
   return current
end

function list:iterate()
   return iterate, self, nil
end

-- define data tables
local mon = { "Mon" }
local tue = { "Tue" }

-- create a new list with two values
local l = list(mon, tue)

-- create more data
local wed = { "Wed" }
local fri = { "Fri" }

-- add a table to the list 
l:push(wed)
-- add a table to the list
l:push({ "Thu" })
-- add a table to the list
l:push(fri)

-- iterate throgh entries
for v in l:iterate() do 
   print(v[1]) 
end