def partition(arr, num)
    twodee = Array.new(2) {Array.new(0)}
    arr.each do |el|
        if el < num
            twodee[0] << el
        else
            twodee[1] << el
        end
    end
    twodee
end

def merge(hash_1, hash_2)
    hash_3 = Hash.new(0)
    hash_1.each {|k, v| hash_3[k] = v if !hash_2.has_key?(k) }
    hash_2.each {|k, v| hash_3[k] = v }
    hash_3
end

def censor(str, arr)
    words = str.split(" ")
    words.each do |word|
        if arr.include?(word.downcase)
            word.each_char {|char| word[char] = "*" if "aeiou".include?(char.downcase) }
        end
    end
    return words.join(" ")
end

def power_of_two?(num)
    factors = []
    (2..num).each { |factor| factors << factor if num % factor == 0 }
    factors.all? { |factor| factor % 2 == 0 }
end


