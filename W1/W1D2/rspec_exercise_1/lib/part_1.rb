def average(num_1, num_2)
    sum = num_1 + num_2
    avg = sum / 2.0
    return avg
end

def average_array(arr)
    average = arr.sum.to_f / arr.length.to_f
    return average
end

def repeat(str, num)
    new_str = ""
    num.times do new_str << str
    end
    new_str
end

def yell(str)
    return str.upcase + "!"
end

def alternating_case(str)
    new_str = []
    arr = str.split(" ")
    arr.each_index do |i|
        if i == 0
            new_str << arr[i].upcase
        elsif i % 2 != 0
            new_str << arr[i].downcase
        else
            new_str << arr[i].upcase
        end
    end
    new_str.join(" ")
end


