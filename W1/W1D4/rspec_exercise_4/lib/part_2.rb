def proper_factors(n)
    factors = []
    (1...n).each {|factor| factors.push(factor) if n % factor == 0}
    factors
end

def aliquot_sum(n)
    sum = proper_factors(n).sum
end

def perfect_number?(n)
    n == aliquot_sum(n)
end

def ideal_numbers(n)
    perfects = []
    num = 1
    while perfects.length < n
       perfects << num if perfect_number?(num)
       num += 1
    end
    perfects
end