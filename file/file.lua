--[[
2025.12.23 by dralee
read first word
]]

-- opens a file in read mode
file = io.open("demo.txt", "r")

-- set default input as demo.txt
io.input(file)

-- read the first line
local line = io.read()

-- current position in line
local pos = 1

-- find the string seperated by whitespace
local s,e = string.find(line, "%w+", pos)

-- print the word read
print(string.sub(line, s, e))

-- close the file
io.close(file)