local md5 = require("md5")

local str = "hello world, test the md5"
local val = md5.sumhexa(str)
print("md5:"..val)
