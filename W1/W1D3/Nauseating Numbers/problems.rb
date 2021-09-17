require "byebug"

def strange_sums(array)
    pairs = []
    array.each_index do |el|
        array.each_index do |i|
            pairs << array[el] + array[i] if i > el
        end
    end
    zero = pairs.select {|num| num == 0}
    return zero.length
end

def pair_product(array, prod)
    prods = []
    array.each_index do |el|
        array.each_index do |i|
            prods << array[el] * array[i] if i > el
        end
    end
    if prods.include?(prod)
        return true
    else
        return false
    end
end

def rampant_repeats(str, hash)
    new_str = ""
    str.each_char do |char|
        if hash.has_key?(char)
            hash[char].times do 
                new_str += char
            end
        else
            new_str += char
        end
    end
    new_str
end

def perfect_square(num)
    factors = []
    (1...num).each { |el| factors << el if num % el == 0 }
    factors.any? {|factor| num / factor == factor }
end

def anti_prime?(num)
    all_factors = []
    (1..num).each do |number|
        count = 0
        (2...number).each do |num|
            count += 1 if number % num == 0
        end
        all_factors << count
    end
    if all_factors.max == all_factors[-1]
        return true
    else
        return false
    end
end

# p anti_prime?(24)   # true
# p anti_prime?(36)   # true
# p anti_prime?(48)   # true
# p anti_prime?(360)  # true
# p anti_prime?(1260) # true
# p anti_prime?(27)   # false
# p anti_prime?(5)    # false
# p anti_prime?(100)  # false
# p anti_prime?(136)  # false
# p anti_prime?(1024) # false


def matrix_addition(matrix_1, matrix_2)
    addition = Array.new(matrix_1.length) {Array.new(matrix_1[0].length)}
    matrix_1.each_with_index do |array, i|
        array.each_with_index do |num, index|
            addition[i][index] = matrix_1[i][index] + matrix_2[i][index]
        end
    end
    addition
end

def mutual_factors(*nums)
    factors = Hash.new(0)
    nums.each do |num|
        (1..num).each { |el| factors[el] += 1 if num % el == 0 }
    end
    mutuals = factors.select {|factor| factors[factor] == nums.length}
    new_arr = []
    mutuals.each do |k, v|
        new_arr << k
    end
    new_arr
end

def tribonacci_number(num)
    if num < 3
        return 1
    elsif num == 3
        return 2
    elsif num > 3
        n = 4
        arr = [1, 1, 2]
        while n < num
            arr << arr.sum
            arr.shift
            n += 1
        end
    end
    arr.sum
end

# def matrix_addition_reloaded(*matricies)
#     matrix = matricies[0]
#     addition = Array.new(matricies.length) {[0] * matrix[0].length}
#     matricies.each_with_index do |m, i|
#         if i < matricies.length - 1 && m.length != matricies[i + 1].length
#             return nil
#         else
#             m.each_with_index do |el, ind|
#                 addition[0][0] += el
#             end
#         end
#     end
#     addition
# end

matrix_a = [[2,5], [4,7]]
matrix_b = [[9,1], [3,0]]
matrix_c = [[-1,0], [0,-1]]
matrix_d = [[2, -5], [7, 10], [0, 1]]
matrix_e = [[0 , 0], [12, 4], [6,  3]]

p matrix_addition_reloaded(matrix_a, matrix_b)              # [[11, 6], [7, 7]]
p matrix_addition_reloaded(matrix_a, matrix_b, matrix_c)    # [[10, 6], [7, 6]]
p matrix_addition_reloaded(matrix_e)                        # [[0, 0], [12, 4], [6, 3]]
p matrix_addition_reloaded(matrix_d, matrix_e)           # [[2, -5], [19, 14], [6, 4]]
p matrix_addition_reloaded(matrix_a, matrix_b, matrix_e)    # nil
p matrix_addition_reloaded(matrix_d, matrix_e, matrix_c)    # nil

def squarocol?(array)
    square = Array.new(array.length) {Array.new(array.length)}
    array.each_with_index do |subarr, i|
        subarr.each_with_index do |el, index|
            square[index][i] = el
            return true if subarr.count(el) == subarr.length
            return true if square[index].count(el) == subarr.length
        end
    end
    return false
end

def squaragonal?(array)
    diagonal_1 = []
    diagonal_2 = []
    array.each_with_index do |subarr, i|
        subarr.each_with_index do |el, index|
            diagonal_1 << el if i == index
            diagonal_2 << el if i == index
            diagonal_2 << el if i == 0 && index == 2
            diagonal_2 << el if i == 2 && index == 0
            if diagonal_1.count(el) == subarr.length
                return true
            elsif diagonal_2.count(el) == subarr.length
                return true
            end
        end
    end
    return false
end

# def pascals_triangle(n)
#     square = Array.new(n) {Array.new(0)}
#     square[0][0] = 1
#     (1...n).each do |num|
#         square[num][0] = 1
#         square[num][1] = num
#         while square[num].length < num
#             square[num] += 1
#         end
#     end 
#     square
# end

# p pascals_triangle(5)

def mersenne_prime(n)
    mprimes = []
    while mprimes.length < n
        (1..n).each do |f|
            mprimes << 2**f - 1 if !is_prime?(f)
        end
    end
    return mprimes
end

def is_prime?(f)
    (2...f).any? {|factor| f % factor == 0}
end

# p mersenne_prime(4) # 127