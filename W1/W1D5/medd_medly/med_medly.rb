def duos(str)
  count = 0
  str.split("").each_index {|i| count += 1 if i < str.length && str[i] == str[i + 1]}
  count
end

# p duos('bootcamp')      # 1
# p duos('wxxyzz')        # 2
# p duos('hoooraay')      # 3
# p duos('dinosaurs')     # 0
# p duos('e')             # 0

def sentence_swap(sent, hash)
  sent.split(" ").map! {|word| sent[word] = hash[word] if hash.has_key?(word)}
  sent
end

# p sentence_swap('anything you can do I can do',
#     'anything'=>'nothing', 'do'=>'drink', 'can'=>'shall'
# ) # 'nothing you shall drink I shall drink'

# p sentence_swap('what a sad ad',
#     'cat'=>'dog', 'sad'=>'happy', 'what'=>'make'
# ) # 'make a happy ad'

# p sentence_swap('keep coding okay',
#     'coding'=>'running', 'kay'=>'pen'
# ) # 'keep running okay'

def hash_mapped(hash, proc, &block)
  new_hash = Hash.new(0)
  hash.each do |k, v|
    new_hash[block.call(k)] = proc.call(v)
  end
  new_hash
end

# double = Proc.new { |n| n * 2 }
# p hash_mapped({'a'=>4, 'x'=>7, 'c'=>-3}, double) { |k| k.upcase + '!!' }
# # {"A!!"=>8, "X!!"=>14, "C!!"=>-6}

# first = Proc.new { |a| a[0] }
# p hash_mapped({-5=>['q', 'r', 's'], 6=>['w', 'x']}, first) { |n| n * n }
# # {25=>"q", 36=>"w"}

def counted_characters(str)
  chars = []
  more = []
  str.each_char do |char|
    if chars.count(char) < 2
      chars << char
    elsif chars.count(char) >= 2 && !more.include?(char)
      chars << char
      more << char
    else
      chars << char
    end
  end
more
end


# p counted_characters("that's alright folks") # ["t"]
# p counted_characters("mississippi") # ["i", "s"]
# p counted_characters("hot potato soup please") # ["o", "t", " ", "p"]
# p counted_characters("runtime") # []

def triplet_true(str)
  if str.length < 3
    return false
  else
    str.each_char.with_index do |char, i|
      if char == str[i+1] && char == str[i+2]
        return true
      end
    end
    return false
  end
end

# p triplet_true('caaabb')        # true
# p triplet_true('terrrrrible')   # true
# p triplet_true('runninggg')     # true
# p triplet_true('bootcamp')      # false
# p triplet_true('e')             # false

def energetic_encoding(str, hash)
  new_str = []
  str.split(" ").each do |word|
    new_word = ""
    word.each_char do |char|
      if hash.has_key?(char)
        new_word += hash[char]
      else
        new_word += "?"
      end
    end
    new_str << new_word
  end
  new_str.join(" ")
end

# p energetic_encoding('sent sea',
#     'e'=>'i', 's'=>'z', 'n'=>'m', 't'=>'p', 'a'=>'u'
# ) # 'zimp ziu'

# p energetic_encoding('cat',
#     'a'=>'o', 'c'=>'k'
# ) # 'ko?'

# p energetic_encoding('hello world',
#     'o'=>'i', 'l'=>'r', 'e'=>'a'
# ) # '?arri ?i?r?'

# p energetic_encoding('bike', {}) # '????'

def uncompress(str)
  uc = ""
  i = 0
  while i < str.length
    num = str[i + 1].to_i
    num.times do
      uc += str[i]
    end
    i += 2
  end
  uc
end

# p uncompress('a2b4c1') # 'aabbbbc'
# p uncompress('b1o2t1') # 'boot'
# p uncompress('x3y1x2z4') # 'xxxyxxzzzz'

def conjunct_select(arr, *procs)
  i = 0
  new_arr = []
  arr.each do |num|
    new_arr << num if procs.all? {|proc| proc.call(num) == true}
  end
  new_arr
end

# is_positive = Proc.new { |n| n > 0 }
# is_odd = Proc.new { |n| n.odd? }
# less_than_ten = Proc.new { |n| n < 10 }

# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive) # [4, 8, 11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd) # [11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd, less_than_ten) # [7]

def convert_pig_latin(sent)
  new_sent = []
  sent.split(" ").each do |word|
    if word.length < 3
      new_sent << word
    elsif "aeiou".include?(word[0].downcase)
      new_sent << word + "yay"
    else
      i = 1
      while i < word.length
        if "aeiou".include?(word[i])
          new_sent << word[i...word.length] + word[0...i].downcase + "ay" 
          i = word.length
        else
          i += 1
        end
      end
    end
  end
  new_sent.join(" ").capitalize
end

# p convert_pig_latin('We like to eat bananas') # "We ikelay to eatyay ananasbay"
# p convert_pig_latin('I cannot find the trash') # "I annotcay indfay ethay ashtray"
# p convert_pig_latin('What an interesting problem') # "Atwhay an interestingyay oblempray"
# p convert_pig_latin('Her family flew to France') # "Erhay amilyfay ewflay to Ancefray"
# p convert_pig_latin('Our family flew to France') # "Ouryay amilyfay ewflay to Ancefray"

def reverberate(sent)
  new_sent = []
  sent.split(" ").each do |word|
    if word.length < 3
      new_sent << word
    elsif "aeiou".include?(word[-1])
      new_sent << word + word.downcase
    else
      indexes = []
      word.each_char.with_index do |char, i|
        indexes << i if "aeiou".include?(char.downcase)
      end
      new_sent << word + word[indexes[-1]...word.length].downcase
    end
  end
  return new_sent.join(" ")
end

# p reverberate('We like to go running fast') # "We likelike to go runninging fastast"
# p reverberate('He cannot find the trash') # "He cannotot findind thethe trashash"
# p reverberate('Pasta is my favorite dish') # "Pastapasta is my favoritefavorite dishish"
# p reverberate('Her family flew to France') # "Herer familyily flewew to Francefrance"

def disjunct_select(arr, *procs)
  new_arr = []
  arr.each do |el|
    i = 0
    while i < procs.length
      new_arr << el if procs[i].call(el) == true && !new_arr.include?(el)
      i += 1
    end
  end
  new_arr
end

longer_four = Proc.new { |s| s.length > 4 }
contains_o = Proc.new { |s| s.include?('o') }
starts_a = Proc.new { |s| s[0] == 'a' }

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
# ) # ["apple", "teeming"]

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
#     contains_o
# ) # ["dog", "apple", "teeming", "boot"]

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
#     contains_o,
#     starts_a
# ) # ["ace", "dog", "apple", "teeming", "boot"]


def alternating_vowel(sent)
  new_sent = []
  sent.split(" ").each.with_index do |word, i|
    if i % 2 != 0
      ind = word.length - 1
      while ind > 0
        if "aeiou".include?(word[ind])
          new_sent << word[0...ind] + word[(ind + 1)...word.length]
          ind = 0
        elsif ind == 1 && !("aeiou".include?(word[ind]) || "aeiou".include?(word[0]))
          new_sent << word
          ind = 0
        else
          ind -= 1
        end
      end
    else
      ind = 0
      while ind < word.length
        if "aeiou".include?(word[ind])
          new_sent << word[0...ind] + word[(ind + 1)...word.length]
          ind = word.length
        elsif ind == (word.length - 1) && !"aeiou".include?(word[ind])
          new_sent << word
          ind = word.length
        else
          ind += 1
        end
      end
    end
  end
  return new_sent.join(" ")
end

# p alternating_vowel('panthers are great animals') # "pnthers ar grat animls"
# p alternating_vowel('running panthers are epic') # "rnning panthrs re epc"
# p alternating_vowel('code properly please') # "cde proprly plase"
# p alternating_vowel('my forecast predicts rain today') # "my forecst prdicts ran tday"

def silly_talk(sent)
  new_sent = []
  sent.split(" ").each do |word|
    if "aeiou".include?(word[-1])
      new_sent << word + word[-1]
    else
      i = 0
      new_word = ""
      while i < word.length
        if "aeiou".include?(word[i].downcase)
          new_word += word[i] + "b" + word[i].downcase
        else
          new_word += word[i]
        end
        i += 1
      end
      new_sent << new_word
    end
  end
  return new_sent.join(" ")
end

# p silly_talk('Kids like cats and dogs') # "Kibids likee cabats aband dobogs"
# p silly_talk('Stop that scooter') # "Stobop thabat scobooboteber"
# p silly_talk('They can code') # "Thebey caban codee"
# p silly_talk('He flew to Italy') # "Hee flebew too Ibitabaly"

def compress(str)
  comp = ""
  i = 0
  count = 1
  while i < str.length
    if str[i] == str[i + 1]
      count += 1
    elsif count > 1
      comp += str[i] + count.to_s
      count = 1
    else
      comp += str[i]
    end
    i += 1
  end
  return comp
end

# p compress('aabbbbc')   # "a2b4c"
# p compress('boot')      # "bo2t"
# p compress('xxxyxxzzzz')# "x3yx2z4"
