--[[
list
2025.12.23 by dralee
]]

List = {}

function List.insert(node, value)
    node = { data = value, next = node}
    return node
end

function List.traverse(head)
    while head do
        print(head.data)
        head = head.next
    end
end

-- create a list
local list = nil
list = List.insert(list, "hello")
list = List.insert(list, "word")
list = List.insert(list, "nice")
list = List.insert(list, "to")
list = List.insert(list, "meet")

-- traverse the list
List.traverse(list)