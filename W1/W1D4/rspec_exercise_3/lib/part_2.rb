def element_count(arr)
    count = Hash.new(0)
    arr.each { |el| count[el] += 1 }
    count
end

def char_replace!(str, hash)
    str.each_char {|char| str[char] = hash[char] if hash.has_key?(char)}
    str
end

def product_inject(arr)
    answer = arr.inject {|a, e| a * e}
    answer
end