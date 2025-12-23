--[[
2025.12.23 by dralee
read all words
]]

-- opens a file in read mode
file = io.open("demo.txt", "r")

-- set default input as demo.txt
io.input(file)

-- iterator function
function allwords()
    -- read the line
    local line = io.read()
    local pos = 1 -- current position in line
    
    return function()
        while line do
            -- -- yield the word
            -- coroutine.yield(string.sub(line, s, e))
            -- -- find the next word
            -- pos = e + 1
            -- s, e = string.find(line, "%w+", pos)
            -- find the next word
            local s,e = string.find(line, "%w+", pos)
            if s then
                pos = e + 1
                return string.sub(line, s, e)
            else
                -- no more words
                line = io.read()
                pos = 1
            end
        end
        -- if no more lines, terminate the traversal
        return nil
    end
end

-- iterate through all words
for word in allwords() do
    print(word)
end

-- close the file
io.close(file)