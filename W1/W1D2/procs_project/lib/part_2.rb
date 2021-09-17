def reverser(str, &proc)
    proc.call(str.reverse)
end

p reverser("abcd") { |string| string.upcase }
p reverser("hello") { |string| string + "!!!" }

def word_changer(str, &proc)
    words = str.split(" ")
    words.map {|word| proc.call(word)}.join(" ")
end

def greater_proc_value(num, proc_1, proc_2)
    if proc_1.call(num) > proc_2.call(num)
        return proc_1.call(num)
    else
        return proc_2.call(num)
    end
end

def and_selector(array, proc_1, proc_2)
    array.select {|el| proc_1.call(el) == true && proc_2.call(el) == true}
end

def alternating_mapper(array, proc_1, proc_2)
    new_arr = []
    array.each_with_index do |el, i|
        if i % 2 == 0
          new_arr << proc_1.call(el)
        else
            new_arr << proc_2.call(el)
        end
    end
    new_arr
end
