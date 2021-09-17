def no_dupes?(arr)
  hash = Hash.new(0)
  arr.each {|el| hash[el] += 1}
  new_arr = []
  hash.each {|k, v| new_arr << k if hash[k] == 1}
  new_arr
end

# p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
# p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
# p no_dupes?([true, true, true])            # => []

def no_consecutive_repeats?(arr)
  arr.each.with_index do |el, i|
    return false if el == arr[i + 1]
  end
  return true
end

# p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
# p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
# p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
# p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
# p no_consecutive_repeats?(['x'])                              # => true

def char_indices(str)
  hash = Hash.new {|k, v| k[v] = []}
  str.each_char.with_index do |char, i|
    hash[char] << i
  end
  hash
end

# p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
# p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}

def longest_streak(str)
  return str[0] if str.length == 0
  count = 0
  str_count = 0
  str_char = ""
  str.each_char.with_index do |char, i|
    if char == str[i + 1]
      str_count += 1
    elsif char == str[i - 1]
      str_count += 1
      if str_count >= count
        count = str_count
        str_char = char
      end
      str_count = 0
    end
  end

  streak = ""
  if str_char == ""
    return str[-1]
  else
    count.times {streak += str_char}
    return streak
  end

end

# p longest_streak('a')           # => 'a'
# p longest_streak('accccbbb')    # => 'cccc'
# p longest_streak('aaaxyyyyyzz') # => 'yyyyy
# p longest_streak('aaabbb')      # => 'bbb'
# p longest_streak('abc')         # => 'c'

def prime?(num)
  return false if num < 2 
  (2...num).each {|factor| return false if num % factor == 0}
  return true
end

def bi_prime?(num)
  prime_factors = []
  if !prime?(num)
    (2...num).each do |factor|
      prime_factors << factor if num % factor == 0 && prime?(factor)
    end
  else
    return false
  end

  prime_factors.each do |factor1|
    prime_factors.each do |factor2|
      if factor1 * factor2 == num
        return true
      end
    end
  end
  return false
end

# p bi_prime?(14)   # => true
# p bi_prime?(22)   # => true
# p bi_prime?(25)   # => true
# p bi_prime?(94)   # => true
# p bi_prime?(24)   # => false
# p bi_prime?(64)   # => false

def vigenere_cipher(message, keys)
  alphabet = "abcdefghijklmnopqrstuvwxyz"
  i = 0
  message.each_char.with_index do |char, index|
    if i < keys.length - 1
      message[index] = alphabet[(alphabet.index(char) + keys[i]) % 26]
      i += 1
    else
      message[index] = alphabet[(alphabet.index(char) + keys[i]) % 26]
      i = 0
    end
  end
  message
end

# p vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
# p vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
# p vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
# p vigenere_cipher("zebra", [3, 0])            # => "ceerd"
# p vigenere_cipher("yawn", [5, 1])             # => "dbbo"

def vowel_rotate(str)
  vowel_i = []
  new_str = ""
  str.each_char.with_index do |char, i|
    if "aeiou".include?(char.downcase)
      vowel_i << i
      new_str += char
    else
      new_str += char
    end
  end
  
  vowel_i.each.with_index do |index, i2|
    if i2 == 0
      new_str[index] = str[vowel_i[-1]]
    elsif i2 < vowel_i.length
      new_str[index] = str[vowel_i[i2 - 1]]
    end
  end
  new_str
end

# p vowel_rotate('computer')      # => "cempotur"
# p vowel_rotate('oranges')       # => "erongas"
# p vowel_rotate('headphones')    # => "heedphanos"
# p vowel_rotate('bootcamp')      # => "baotcomp"
# p vowel_rotate('awesome')       # => "ewasemo"

class String
  def select(&proc)
    new_str = ""
    return new_str if proc == nil
    self.each_char.with_index do |char, i|
      new_str += char if proc.call(char)
    end
    new_str
  end

  def map!(&proc)
    self.each_char.with_index {|char, i| self[i] = proc.call(char, i)}
  end

end

def even?(num)
  if num == 0 || num == nil
    return true
  elsif num % 2 == 0
    return true
  end
  return false

end

# p "app academy".select { |ch| !"aeiou".include?(ch) }   # => "pp cdmy"
# p "HELLOworld".select { |ch| ch == ch.upcase }          # => "HELLO"
# p "HELLOworld".select          # => ""

# word_1 = "Lovelace"
# word_1.map! do |ch| 
#     if ch == 'e'
#         '3'
#     elsif ch == 'a'
#         '4'
#     else
#         ch
#     end
# end
# p word_1        # => "Lov3l4c3"

# word_2 = "Dijkstra"
# word_2.map! do |ch, i|
#     if i.even?
#         ch.upcase
#     else
#         ch.downcase
#     end
# end
# p word_2        # => "DiJkStRa"

def multiply(a, b)
  if b >= 0
    return b if b == 0
    a + multiply(a, b - 1)
  else
    return b if b == 0
    a + multiply(a, b + 1)
  end
end

# p multiply(3, 5)        # => 15
# p multiply(5, 3)        # => 15
# p multiply(2, 4)        # => 8
# p multiply(0, 10)       # => 0
# p multiply(-3, -6)      # => 18
# p multiply(3, -6)       # => -18
# p multiply(-3, 6)       # => -18

