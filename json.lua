local cjson = require("cjson")

print(package.path)

local file = io.open("data.json","r")
local data = file:read("*all")
print("data:"..data)

local obj = cjson.decode(data)
print(obj[1]["playlist-path"])
-- print("0: "..obj)
file:close()


