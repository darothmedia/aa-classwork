# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

require "byebug"

def largest_prime_factor(num)
    divisors = []
    (1...num).each do |factor|
        divisors << factor if num % factor == 0
    end
    prime_divisors = []
    divisors.each do |div|
        prime_divisors << div if prime?(div) == true
    end
    if prime_divisors == []
        return num
    else
        return prime_divisors[-1]
    end
end

def prime?(div)
    if div < 2
        return false
    elsif div == 2
        return true
    else
        (2...div).each do |factor|
        if div % factor == 0
            return false
        end
    end
    end
    return true
end

def unique_chars?(str)
    count = Hash.new(0)
    arr = str.split("")
    arr.each {|letter| count[letter] += 1}
    nonunique = count.select {|key, value| value > 1}
    nonunique.empty?
end

def dupe_indices(arr)
    hash = Hash.new { |k, v| k[v] = [] }
    arr.each_with_index {|ele, i| hash[ele] << i }
    hash.select {|k, v| v.length > 1 }
end


def ana_array(arr_1, arr_2)
    hash_1 = Hash.new(0)
    hash_2 = Hash.new(0)
    arr_1.each {|el| hash_1[el] += 1}
    arr_2.each {|el| hash_2[el] += 1}
    if hash_1 == hash_2
        return true
    else
        return false
    end
end
