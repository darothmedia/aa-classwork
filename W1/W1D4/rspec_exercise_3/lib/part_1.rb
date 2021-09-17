def is_prime?(num)
    if num < 2
        return false
    else
        (2...num).none? {|factor| num % factor == 0}
    end
end

def nth_prime(n)
    primes = []
    number = 2
    while primes.length < n
        primes << number if is_prime?(number) == true
        number += 1
    end
    primes[-1]
end

def prime_range(min, max)
    primes = []
    number = min
    while number <= max
        primes << number if is_prime?(number) == true
        number += 1
    end
    primes
end

