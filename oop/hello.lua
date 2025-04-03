-- oop
-- 2025.4.3 by dralee

-- 定义Person类
Person = { name = "", age = 0, addr = "" }

-- 构造函数
function Person:new(name,age,addr)
	local obj = {} -- 新表作为对象
	setmetatable(obj, self) -- 设置元素，使其成为Person实例
	self.__index = self -- 设置索引方法，指向Person
	self.name = name
	self.age = age
	self.addr = addr
	return obj
end

function Person:info()
	print(string.format("name: %s, age: %d, addr: %s", self.name, self.age, self.addr))
end



-- 创建对象
local p = Person:new("lee",18,"gd,sz")
-- 显示信息
p:info()
print("the name is ", p.name)

