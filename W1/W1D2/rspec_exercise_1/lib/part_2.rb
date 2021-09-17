def hipsterfy(word)
    arr = word.split("")
    vowels = "aeiou"
    vwl = []
    i = word.length - 1
    while i >= 0
        if vowels.include?(arr[i])
            arr.delete_at(i)
            return arr.join("")
        else
            i -= 1
        end
        
    end
    arr.join("")
end

def vowel_counts(str)
    vowels = Hash.new(0)
    vow = "aeiou"
    str.split("").each {|el| vowels[el.downcase] += 1 if vow.include?(el.downcase)}
    vowels
end

def caesar_cipher(str, n)
    alphabet = "abcdefghijklmnopqrstuvwxyz"
    msg = ""
    str.each_char do |char|
        if alphabet.include?(char.downcase)
            old_idx = alphabet.index(char)
            new_idx = old_idx + n
            new_char = alphabet[new_idx % 26]
            msg << new_char
        else
            msg << char
        end
    end
    msg
end
