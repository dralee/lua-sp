-- oop
-- 继承&多态
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


-- 学生继承Person
Student = Person:new()

-- 重写构造函数
function Student:new(grade,class)
	local p = {} -- p = p or {} 如果传入对象为空，则创建新
	setmetatable(p, self) -- 设置元素，使其继承Person方法
	self.__index = self -- 确保在访问时能找到方法和属性
	p.grade = grade or '' -- 年级
	p.class = class or '' -- 班级
	return p
end

function Student:info()
	s = ''
	if self.name then
		s = s .. 'name:'..self.name
	end
	if self.age and self.age > 0 then
		s = s .. ' age:' .. self.age
	end
	if self.addr then
		s = s .. ' addr:'..self.addr
	end
	if self.grade then
		s = s .. ' grade:'..self.grade
	end
	if self.class then
		s = s..' class:'..self.class
	end
	print(string:trim(s))
end

function string:trim(s)
	--return s:gsub("^%s+",""):gsub("%s+$","")
	return s:match("^%s*(.-)%s*$")
end

-- 创建对象
local s = Student:new("1年","2班")
-- 显示信息
s:info()

s.name,s.age,s.addr = 'lee',18,'gd sz'
s:info()
