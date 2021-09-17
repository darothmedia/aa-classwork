# Write a method, all_vowel_pairs, that takes in an array of words and returns all pairs of words
# that contain every vowel. Vowels are the letters a, e, i, o, u. A pair should have its two words
# in the same order as the original array. 
#
# Example:
#

def all_vowel_pairs(words)
    pairs = []
    i = 0
    words.each do |word_1|
        words.each do |word_2|
            pairs << [word_1, word_2] if !pairs.include?([word_1, word_2]) && !pairs.include?([word_2, word_1])
        end
    end
    vow_pairs = []
    pairs.each do |pair|
        vowels = []
        pair.join(" ").each_char do |char|
            vowels << char if ("aeiou".include?(char) && !vowels.include?(char))
        end
        vow_pairs << pair.join(" ") if vowels.sort.join("") == "aeiou"
    end

    vow_pairs
end

# p all_vowel_pairs(["goat", "action", "tear", "impromptu", "tired", "europe"])   # => ["action europe", "tear impromptu"]


# Write a method, composite?, that takes in a number and returns a boolean indicating if the number
# has factors besides 1 and itself
#
# Example:
#

def composite?(num)
    (2...num).any? {|factor| num % factor == 0}
end

# p composite?(9)     # => true
# p composite?(13)    # => false


# A bigram is a string containing two letters.
# Write a method, find_bigrams, that takes in a string and an array of bigrams.
# The method should return an array containing all bigrams found in the string.
# The found bigrams should be returned in the the order they appear in the original array.
#
# Examples:
#

def find_bigrams(str, bigrams)
    big = []
    str.each_char.with_index do |char, i|
        two = str[i..(i+1)]
        big << two if bigrams.include?(two)
    end

    big.sort_by {|x| bigrams.index(x)}
end

# p find_bigrams("the theater is empty", ["cy", "em", "ty", "ea", "oo"])  # => ["em", "ty", "ea"]
# p find_bigrams("to the moon and back", ["ck", "oo", "ha", "at"])        # => ["ck", "oo"]

class Hash
    # Write a method, Hash#my_select, that takes in an optional proc argument
    # The method should return a new hash containing the key-value pairs that return
    # true when passed into the proc.
    # If no proc is given, then return a new hash containing the pairs where the key is equal to the value.
    #
    # Examples:
    #

    def my_select(&prc)
        select = Hash.new(0)
        self.each do |k, v|
            if prc == nil
                select[k] = v if k == v
            elsif prc.call(k, v) == true
                select[k] = v
            end
        end
        select
    end
end

hash_1 = {x: 7, y: 1, z: 8}
p hash_1.my_select { |k, v| v.odd? }          # => {x: 7, y: 1}
    
hash_2 = {4=>4, 10=>11, 12=>3, 5=>6, 7=>8}
p hash_2.my_select { |k, v| k + 1 == v }      # => {10=>11, 5=>6, 7=>8})
p hash_2.my_select                            # => {4=>4}

class String
    # Write a method, String#substrings, that takes in a optional length argument
    # The method should return an array of the substrings that have the given length.
    # If no length is given, return all substrings.
    #
    # Examples:
    #
    # "cats".substrings     # => ["c", "ca", "cat", "cats", "a", "at", "ats", "t", "ts", "s"]
    # "cats".substrings(2)  # => ["ca", "at", "ts"]
    def substrings(length = nil)
        substrings = []
        self.each_char.with_index do |char, i|
            self.each_char.with_index do |char2, i2|
                substrings << self[i..i2] if i2 >= i
            end
        end
        return substrings if length == nil
        substrings.select {|string| string.length == length}
    end

    # p "cats".substrings     # => ["c", "ca", "cat", "cats", "a", "at", "ats", "t", "ts", "s"]
    # p "cats".substrings(2)  # => ["ca", "at", "ts"]


    # Write a method, String#caesar_cipher, that takes in an a number.
    # The method should return a new string where each char of the original string is shifted
    # the given number of times in the alphabet.
    #
    # Examples:
    #
    # "apple".caesar_cipher(1)    #=> "bqqmf"
    # "bootcamp".caesar_cipher(2) #=> "dqqvecor"
    # "zebra".caesar_cipher(4)    #=> "difve"
    def caesar_cipher(num)
        new_str = ""
        alphabet = "abcdefghijklmnopqrstuvwxyz"
        self.each_char do |char|
            chari = alphabet.index(char)
            new_str += alphabet[(chari + num) % 26]
        end
        new_str
    end
end

# p "apple".caesar_cipher(1)    #=> "bqqmf"
# p "bootcamp".caesar_cipher(2) #=> "dqqvecor"
# p "zebra".caesar_cipher(4)    #=> "difve"
