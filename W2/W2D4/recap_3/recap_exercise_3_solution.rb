# General Problems

def no_dupes?(arr)
    count = Hash.new(0)
    arr.each { |el| count[el] += 1 }
    count.keys.select { |el| count[el] == 1 }
end


def no_consecutive_repeats?(arr)
    (0...arr.length - 1).each do |idx|
        return false if arr[idx] == arr[idx + 1]
    end

    true
end


def char_indices(str)
    indices = Hash.new { |h, k| h[k] = [] }
    str.each_char.with_index { |char, idx| indices[char] << idx }
    indices
end


def longest_streak(str)
    current_streak = ''
    best_streak = ''

    (0...str.length).each do |idx|
        if str[idx] == str[idx - 1] || idx == 0
            current_streak += str[idx]
        else
            current_streak = str[idx]
        end

        best_streak = current_streak if current_streak.length >= best_streak.length
    end

    best_streak
end


def bi_prime?(num)
    prime_facts = prime_factors(num)

    prime_facts.any? do |a|
        b = num / a * 1.0
        prime_facts.include?(b)
    end
end

def prime?(num)
    return false if num < 2
    (2...num).none? { |i| num % i == 0}
end

def prime_factors(num)
    (2..num).select { |i| num % i == 0 && prime?(i) }
end


def vigenere_cipher(message, keys)
    alpha = ('a'..'z').to_a
    new_message = ''

    message.each_char.with_index do |char, idx|
        pos = alpha.index(char)
        key = keys[idx % keys.length]
        new_pos = (pos + key) % alpha.length
        new_message += alpha[new_pos]
    end

    new_message
end


def vowel_rotate(str)
    new_str = str[0..-1]
    vowels = 'aeiou'

    vowel_idxs = (0...str.length).select { |i| vowels.include?(str[i]) }
    rotated_vowel_idxs = vowel_idxs.rotate(-1)

    vowel_idxs.each_with_index do |vowel_idx, i|
        new_vowel = str[rotated_vowel_idxs[i]]
        new_str[vowel_idx] = new_vowel
    end

    new_str
end


# Proc Problems

class String
    def select(&prc)
        return '' if prc.nil?
        new_str = ''

        self.each_char do |char|
            new_str += char if prc.call(char)
        end

        new_str
    end

    def map!(&prc)
        self.each_char.with_index do |char, idx|
            self[idx] = prc.call(char, idx)
        end
    end
end

# Recursion Problems

def multiply(a, b)
    return 0 if b == 0

    if b < 0
        -(a + multiply(a, (-b) - 1))
    else
        a + multiply(a, b - 1)
    end
end


def lucas_sequence(n)
    return [] if n == 0
    return [2] if n == 1
    return [2, 1] if n == 2

    seq = lucas_sequence(n - 1)
    seq << seq[-1] + seq[-2]
    seq
end


def prime_factorization(num)
    (2...num).each do |fact|
        if (num % fact == 0)
            otherFact = num / fact
            return [ *prime_factorization(fact), *prime_factorization(otherFact) ]
        end
    end

    [num]
end
