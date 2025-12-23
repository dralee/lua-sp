--[[
queue
2025.12.23 by dralee
]]

Queue = {}

function Queue:new()
    return {
        data = {}, -- queue
        front = 1, -- front index
        tail = 0 -- tail index
    }
end

function Queue:enqueue(queue, value)
    queue.tail = queue.tail + 1
    queue.data[queue.tail] = value
end

function Queue:dequeue(queue)
    if queue.front > queue.tail then
        error("Queue underflow")
    end
    local value = queue.data[queue.front]
    queue.data[queue.front] = nil
    queue.front = queue.front + 1
    return value
end

function Queue:isEmpty(queue)
    return queue.front > queue.tail
end

local queue = Queue:new()
Queue:enqueue(queue, 1)
Queue:enqueue(queue, 2)
Queue:enqueue(queue, 3)

print(Queue:dequeue(queue))
print(Queue:dequeue(queue))
print(Queue:dequeue(queue))