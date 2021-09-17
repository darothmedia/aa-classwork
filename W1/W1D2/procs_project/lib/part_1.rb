def my_map(arr, &proc)
    new_arr = []
    arr.each {|num| new_arr << proc.call(num) }
    new_arr
end

def my_select(array, &proc)
    new_arr = []
    array.each {|el| new_arr << el if proc.call(el) == true}
    new_arr
end

def my_count(array, &proc)
    count = 0
    array.each {|el| count += 1 if proc.call(el) == true}
    count
end

def my_any?(array, &proc)
    count = 0
    array.each {|el| count += 1 if proc.call(el) == true}
    if count > 0
        return true
    else
        return false
    end
end

def my_all?(array, &proc)
    count = 0
    array.each {|el| count += 1 if proc.call(el) == false}
    if count > 0
        return false
    else
        return true
    end
end

def my_none?(array, &proc)
    count = 0
    array.each {|el| count += 1 if proc.call(el) == true}
    if count > 0
        return false
    else
        return true
    end
end

 