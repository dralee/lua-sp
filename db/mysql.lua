-- mysql连接
-- 2025.4.3 by dralee
--[[
luarocks install luasql-sqlite3
luarocks install luasql-postgres
luarocks install luasql-mysql
luarocks install luasql-sqlite
luarocks install luasql-odbc

--]]

luasql = require("luasql.mysql")

-- 环境
env = luasql.mysql()

-- 连接
conn = env:connect("z9yun_dev_usercenter","z9yun_dev_dba","JYq6L6aohycIlVDLVGZ","192.168.0.220",4000)

-- 设置数据库编码格式
conn:execute("SET NAMES UTF8bin")

-- 执行数据库操作
cur = conn:execute("select * from account")

row = cur:fetch({},"a")

-- 文件创建
file = io.open("account.log", "w+")

local count = 10
while row do
	r = string.format("%d %s %s\n", row.id, row.account_no, row.account_name)
	print(r)
	file:write(r)

	row = cur:fetch(row,"a")

	cout = count - 1
	if count == 0 then
		break
	end
end

file:close()
conn:close()
env:close()
