def my_reject(arr, &proc)
    new_arr = []
    arr.each { |num| new_arr.push(num) if proc.call(num) == false }
    new_arr
end

def my_one?(arr, &proc)
    new_arr = []
    arr.each { |num| new_arr.push(num) if proc.call(num) == true }
    if new_arr.length == 1
        return true
    else
        return false
    end
end

def hash_select(hash, &proc)
    new_hash = {}
    hash.each { |k, v| new_hash[k] = v if proc.call(k, v) == true }
    new_hash
end

def xor_select(arr, proc_1, proc_2)
    new_arr = []
    arr.each {|el| new_arr << el if (proc_1.call(el) == true || proc_2.call(el) == true) && !(proc_1.call(el) == true && proc_2.call(el) == true)}
    new_arr
end

def proc_count(num, arr)
    count = 0
    arr.each {|proc| count += 1 if proc.call(num) == true}
    return count
end

