---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by larryhou.
--- DateTime: 2018/9/3 7:59 PM
---


function print_args(...)
    print(...)
    --params = table.pack(...)
    --for n = 1, params.n do
    --    print(params[n])
    --end
end

function print_args_except_first(...)
    index = select('#', ...)
    print(table.unpack({...}, 2, index))
end

function print_args_except_last(...)
    index = select('#', ...)
    print(table.unpack({...},1, index - 1))
end

function shuffle(array)
    math.randomseed(os.time() + os.clock())
    length = #array
    for n = 1, length do
        position = length - n + 1
        index = math.random(1, position)
        array[position], array[index] = array[index], array[position]
        --value = array[position]
        --array[position] = array[index]
        --array[index] = value
    end
end

function combination(array, m, solution)
    if m > 0 then
        if #array >= m then
            solution = solution or {}
            solution_copy = {}
            table.move(solution,1,#solution, 1, solution_copy)
            solution[#solution + 1] = table.remove(array, 1)
            array_copy = {}
            table.move(array,1,#array, 1, array_copy)
            combination(array_copy, m, solution_copy)
            combination(array, m - 1, solution)
        end
    else
        print(table.unpack(solution or {'nil'}))
    end
end

--print_args(1,3,4,nil,nil)
--print_args_except_first(1,3,4,nil,nil)
--print_args_except_last(1,3,4,nil,nil)
--
--data_list = {}
--for n = 1, 100 do
--    data_list[#data_list + 1] = n
--end
--print(table.unpack(data_list))

--shuffle(data_list)
--print(table.unpack(data_list))
--print(#data_list)

num_list = {}
for n = 1, 10 do num_list[#num_list + 1] = n end

combination(num_list, 7)
