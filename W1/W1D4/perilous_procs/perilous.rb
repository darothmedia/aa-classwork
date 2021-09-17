def some?(arr, &proc)
    arr.each do |num|
        return true if proc.call(num) == true
    end
    return false
end

def exactly?(arr, n, &proc)
    count = 0
    arr.each {|el| count += 1 if proc.call(el) == true}
    count == n
end

def filter_out(arr, &proc)
    new_arr = []
    arr.each {|el| new_arr << el if proc.call(el) == false}
    new_arr
end

def at_least?(arr, n, &proc)
    count = 0
    arr.each {|el| count += 1 if proc.call(el) == true}
    count >= n
end

def every?(arr, &proc)
    count = 0
    arr.each {|el| count += 1 if proc.call(el) == true}
    count == arr.length
end

def at_most?(arr, n, &proc)
    count = 0
    arr.each {|el| count += 1 if proc.call(el) == true}
    count <= n
end

def first_index(arr, &proc)
    arr.each do |el|
        if proc.call(el) == true
            return arr.index(el)
        end
    end
    return nil
end

def xnor_select(arr, proc_1, proc_2)
    new_arr = []
    arr.each {|el| new_arr << el if (proc_1.call(el) == true && proc_2.call(el) == true) || (proc_1.call(el) == false && proc_2.call(el) == false)}
    new_arr
end

def filter_out!(arr, &proc)
    ft = []
    arr.each_with_index {|el, i| arr[i] = nil if proc.call(el) == true}
    arr.delete(nil)
    arr
end


def multi_map(arr, n=1, &proc)
    new_arr = []
    arr.each do |el|
        changed = [el]
        n.times do
            changed << proc.call(changed[-1])
        end
        new_arr << changed[-1]
    end
    new_arr
end

def proctition(arr, &proc)
    new_arr = Array.new(2) {Array.new(0)}
    arr.each do |el|
        if proc.call(el) == true
            new_arr[0] << el
        else
            new_arr[1] << el
        end
    end
    return new_arr.flatten
end

# p proctition([4, -5, 7, -10, -2, 1, 3]) { |el| el > 0 }
# # [4, 7, 1, 3, -5, -10, -2]

# p proctition([7, 8, 3, 6, 10]) { |el| el.even? }
# # [8, 6, 10, 7, 3]

# p proctition(['cat','boot', 'dog', 'bug', 'boat']) { |s| s[0] == 'b' }
# # ["boot", "bug", "boat", "cat", "dog"]

def selected_map!(array, proc_1, proc_2)
    new_arr = []
    array.each_with_index do |el|
        if proc_1.call(el) == true
            new_arr << proc_2.call(el)
        else
            new_arr << el
        end
    end
    new_arr.each_index do |i|
        array[i] = new_arr[i]
    end
    return nil
end

# is_even = Proc.new { |n| n.even? }
# is_positive = Proc.new { |n| n > 0 }
# square = Proc.new { |n| n * n }
# flip_sign = Proc.new { |n| -n }

# arr_1 = [8, 5, 10, 4]
# p selected_map!(arr_1, is_even, square)     # nil
# p arr_1                                     # [64, 5, 100, 16]

# arr_2 = [-10, 4, 7, 6, -2, -9]
# p selected_map!(arr_2, is_even, flip_sign)  # nil
# p arr_2                                     # [10, -4, 7, -6, 2, -9]

# arr_3 = [-10, 4, 7, 6, -2, -9]
# p selected_map!(arr_3, is_positive, square) # nil
# p arr_3                                     # [-10, 16, 49, 36, -2, -9]

def chain_map(n, array)
    changed = [n]
    array.each do |proc|
        changed << proc.call(changed[-1])
    end
    if changed[-1] - changed[-1].to_i == 0
        return changed[-1].to_i
    else
        return changed[-1]
    end
end

# add_5 = Proc.new { |n| n + 5 }
# half = Proc.new { |n| n / 2.0 }
# square = Proc.new { |n| n * n }

# p chain_map(25, [add_5, half])          # 15.0
# p chain_map(25, [half, add_5])          # 17.5
# p chain_map(25, [add_5, half, square])  # 225
# p chain_map(4, [square, half])          # 8
# p chain_map(4, [half, square])          # 4

def proc_suffix(sent, hash)
    new_sent = sent.split(" ")
    new_sent.each do |word|
        hash.each do |proc, suffix|
            if proc.call(word) == true
                word.insert(-1, suffix)
            end
        end
    end
    new_sent.join(" ")
end

# contains_a = Proc.new { |w| w.include?('a') }
# three_letters = Proc.new { |w| w.length == 3 }
# four_letters = Proc.new { |w| w.length == 4 }

# p proc_suffix('dog cat',
#     contains_a => 'ly',
#     three_letters => 'o'
# )   # "dogo catlyo"

# p proc_suffix('dog cat',
#     three_letters => 'o',
#     contains_a => 'ly'
# )   # "dogo catoly"

# p proc_suffix('wrong glad cat',
#     contains_a => 'ly',
#     three_letters => 'o',
#     four_letters => 'ing'
# )   # "wrong gladlying catlyo"

# p proc_suffix('food glad rant dog cat',
#     four_letters => 'ing',
#     contains_a => 'ly',
#     three_letters => 'o'
# )   # "fooding gladingly rantingly dogo catlyo"


def proctition_platinum(array, *procs)
    hash = Hash.new {|h, k| h[k] = []}
    procs.each_index {|ind| hash[ind + 1] = []}
    array.each do |el|
        i = 0
        while i < procs.length
            if procs[i].call(el) == true
                hash[i + 1] << el
                i = procs.length
            else
                i += 1
            end
        end
    end
    hash.sort.to_h
end


# is_yelled = Proc.new { |s| s[-1] == '!' }
# is_upcase = Proc.new { |s| s.upcase == s }
# contains_a = Proc.new { |s| s.downcase.include?('a') }
# begins_w = Proc.new { |s| s.downcase[0] == 'w' }

# p proctition_platinum(['WHO', 'what', 'when!', 'WHERE!', 'how', 'WHY'], is_yelled, contains_a)
# # {1=>["when!", "WHERE!"], 2=>["what"]}

# p proctition_platinum(['WHO', 'what', 'when!', 'WHERE!', 'how', 'WHY'], is_yelled, is_upcase, contains_a)
# # {1=>["when!", "WHERE!"], 2=>["WHO", "WHY"], 3=>["what"]}

# p proctition_platinum(['WHO', 'what', 'when!', 'WHERE!', 'how', 'WHY'], is_upcase, is_yelled, contains_a)
# # {1=>["WHO", "WHERE!", "WHY"], 2=>["when!"], 3=>["what"]}

# p proctition_platinum(['WHO', 'what', 'when!', 'WHERE!', 'how', 'WHY'], begins_w, is_upcase, is_yelled, contains_a)
# # {1=>["WHO", "what", "when!", "WHERE!", "WHY"], 2=>[], 3=>[], 4=>[]}

def procipher(sent, hash)
    new_sent = []
    sent.split(" ").each.with_index do |word, i|
        new_word = ""
        hash.each do |k, v|
            if k.call(word) == true && new_word == ""
                new_word += v.call(word)
            elsif k.call(word) == true && new_word != ""
                new_word = v.call(new_word)
            end
        end
        new_word = word if new_word == ""
        new_sent << new_word
    end
    new_sent.join(" ")
end

# is_yelled = Proc.new { |s| s[-1] == '!' }
# is_upcase = Proc.new { |s| s.upcase == s }
# contains_a = Proc.new { |s| s.downcase.include?('a') }
# make_question = Proc.new { |s| s + '???' }
# reverse = Proc.new { |s| s.reverse }
# add_smile = Proc.new { |s| s + ':)' }

# p procipher('he said what!',
#     is_yelled => make_question,
#     contains_a => reverse
# ) # "he dias ???!tahw"

# p procipher('he said what!',
#     contains_a => reverse,
#     is_yelled => make_question
# ) # "he dias !tahw???"

# p procipher('he said what!',
#     contains_a => reverse,
#     is_yelled => add_smile
# ) # "he dias !tahw:)"

# p procipher('stop that taxi now',
#     is_upcase => add_smile,
#     is_yelled => reverse,
#     contains_a => make_question
# ) # "stop that??? taxi??? now"

# p procipher('STOP that taxi now!',
#     is_upcase => add_smile,
#     is_yelled => reverse,
#     contains_a => make_question
# ) # "STOP:) that??? taxi??? !won"

def picky_procipher(sent, hash)
    new_sent = []
    sent.split(" ").each do |word|
        new_word = ""
        hash.each do |k, v|
            new_word += v.call(word) if k.call(word) == true && new_word == ""
        end
        new_word = word if new_word == ""
        new_sent << new_word
    end
    return new_sent.join(" ")
end

# is_yelled = Proc.new { |s| s[-1] == '!' }
# is_upcase = Proc.new { |s| s.upcase == s }
# contains_a = Proc.new { |s| s.downcase.include?('a') }
# make_question = Proc.new { |s| s + '???' }
# reverse = Proc.new { |s| s.reverse }
# add_smile = Proc.new { |s| s + ':)' }

# p picky_procipher('he said what!',
#     is_yelled => make_question,
#     contains_a => reverse
# ) # "he dias what!???"

# p picky_procipher('he said what!',
#     contains_a => reverse,
#     is_yelled => make_question
# ) # "he dias !tahw"

# p picky_procipher('he said what!',
#     contains_a => reverse,
#     is_yelled => add_smile
# ) # "he dias !tahw"

# p picky_procipher('stop that taxi now',
#     is_upcase => add_smile,
#     is_yelled => reverse,
#     contains_a => make_question
# ) # "stop that??? taxi??? now"

# p picky_procipher('STOP that taxi!',
#     is_upcase => add_smile,
#     is_yelled => reverse,
#     contains_a => make_question
# ) # "STOP:) that??? !ixat"