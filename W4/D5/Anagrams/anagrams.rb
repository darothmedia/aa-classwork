require "Benchmark"


def first_anagram?(word_1, word_2)

  new_arr = word_1.split("").permutation.to_a 

  new_arr.map!(&:join)

  new_arr.include?(word_2)

end

# p first_anagram?("dog", "god")
# p first_anagram?("elvis", "lives")

def second_anagram?(word_1, word_2)
  word_2_arr = word_2.split("")
  word_1.each_char do |char|
    target = word_2_arr.find_index(char)
    word_2_arr.delete_at(target)
  end

  word_2_arr.empty?
end

# p second_anagram?("dog", "god")
# p second_anagram?("elvis", "lives")

def third_anagram?(word_1, word_2)
  word_1.split("").sort == word_2.split("").sort
end

# p third_anagram?("dog", "god")
# p third_anagram?("elvis", "lives")


def fourth_anagram?(word_1, word_2)
  hash_1 = Hash.new(0)

  word_1.each_char do |char|
    hash_1[char] += 1
  end
  
  word_2.each_char do |c|
    hash_1[c] -= 1
  end

  hash_1.values.all?(0)
end

# p fourth_anagram?("dog", "god")
# p fourth_anagram?("elvis", "lives")

word1 = "elvis"
word2 = "lives"

Benchmark.bm do |b|
  b.report("First:   ") { first_anagram?(word1, word2) }
  b.report("Second:  ") { second_anagram?(word1, word2) }
  b.report("Third:   ") { third_anagram?(word1, word2) }
  b.report("Fourth:   ") { fourth_anagram?(word1, word2) }
end
