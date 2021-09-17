def zip(*arrays)
  new_arr = Array.new(arrays[0].length) {Array.new(0)}
  arrays.each do |array|
    array.each_index do |i|
      new_arr[i] << array[i]
    end
  end
  new_arr
end

# array_1 = ['a', 'b', 'c']
# array_2 = [1, 2, 3]
# array_3 = ['w', 'x', 'y']

# p zip(array_1, array_2)
# p zip(array_3, array_2, array_1)

def prizz_proc(arr, proc_1, proc_2)
  new_arr = []
  arr.each {|el| new_arr << el if (proc_1.call(el) || proc_2.call(el)) && !(proc_1.call(el) && proc_2.call(el)) }
  new_arr
end

# div_3 = Proc.new { |n| n % 3 == 0 }
# div_5 = Proc.new { |n| n % 5 == 0 }
# ends_ly = Proc.new { |s| s.end_with?('ly') }
# has_i = Proc.new { |s| s.include?('i') }

# p prizz_proc([10, 9, 3, 45, 12, 15], div_3, div_5)
# p prizz_proc(['honestly', 'sully', 'sickly', 'trick', 'doggo', 'quickly'], ends_ly, has_i)

def zany_zip(*arrays)
  lengths = []
  arrays.each {|array| lengths << array.length}
  new_arr = Array.new(lengths.max) {Array.new(0)}
  arrays.each do |array|
    array.each_index do |i|
      new_arr[i] << array[i]
    end
    if array.length < lengths.max
      i = array.length
      while i < lengths.max
        new_arr[i] << nil 
        i += 1
      end
    end
  end
  new_arr
end



def maximum(array, &proc)
  results = []
  array.each {|el| results << proc.call(el)}
  max = results.max
  count = 0
  mult = []
  results.each.with_index do |el, i| 
    if el == max
      mult << i
      count += 1
    end
  end
  if count == 1
    return array[results.index(max)]
  elsif count == 2
    return array[mult[-1]]
  elsif count == 0
    return nil
  end
end

# p maximum([2, 4, -5, 1]) { |n| n * n }
# p maximum(['boot', 'cat', 'drop']) { |w| w.length }
# p maximum([]) { |w| w.length}

def my_group_by(array, &proc)
  hash = Hash.new {|h, k| h[k] = []}
  array.each do |el| 
    key_of_hash = proc.call(el)
    hash[key_of_hash] << el
  end
  hash
end

# array_1 = ['mouse', 'dog', 'goat', 'bird', 'cat']
# array_2 = [1, 2, 9, 30, 11, 38]
# p my_group_by(array_1) { |s| s.length }

def max_tie_breaker(array, proc, &block)
  return nil if array.length == 0
  results = []
  array.each do |el|
    results << block.call(el)
  end
  count = 0
  mult = []
  results.each.with_index do |result, i|
    if result == results.max
      mult << i
      count += 1
    end
  end
  if count == 1
    return array[mult[0]] 
  else
    final = []
    final_count = 0
    mult.each do |i|
      final << proc.call(array[i])
    end
    final.each do |result|
      if result == final.max
        final_count +=1
      end
    end
    if final_count == 1
      return array[mult[final.index(final.max)]]
    else
      return array[mult[0]]
    end
  end
end

# array_1 = ['potato', 'swimming', 'cat']
# array_2 = ['cat', 'bootcamp', 'swimming', 'ooooo']
# array_3 = ['photo','bottle', 'bother']
# array_4 = ['photo','bottle', 'bother']
# length = Proc.new { |s| s.length }
# o_count = Proc.new { |s| s.count('o') }

# p max_tie_breaker(array_1, length, &o_count)
# p max_tie_breaker(array_1, o_count, &length)
# p max_tie_breaker(array_2, length, &o_count)
# p max_tie_breaker(array_2, o_count, &length)
# p max_tie_breaker(array_3, o_count, &length)
# p max_tie_breaker([], o_count, &length)

def silly_syllables(sent)
  new_sent = []
  sent.split(" ").each do |word|
    chars = word.split("")
    vowel_i = []
    word.each_char.with_index { |char, i| vowel_i << i if "aeiou".include?(char) }
    if vowel_i.length >= 2
      new_sent << word[vowel_i[0]..vowel_i[-1]]
    else
      new_sent << word
    end
  end
  return new_sent.join(" ")
end

# p silly_syllables('properly precisely written code')
# p silly_syllables('properly and precisely written code')