class Array
  # Write an `Array#my_inject` method. If my_inject receives no argument, then
  # use the first element of the array as the default accumulator.
  # **Do NOT use the built-in `Array#inject` or `Array#reduce` methods in your 
  # implementation.**

  def my_inject(accumulator = nil, &prc)
    accumulator ||= self[0]
    prc.call(accumulator)
    

  end
end

# Define a method `primes(num)` that returns an array of the first "num" primes.
# You may wish to use an `is_prime?` helper method.

def is_prime?(num)
  return false if num < 2
  (2...num).each {|factor| return false if num % factor == 0}
  return true
end

def primes(num)
  primes = []
  i = 2
  while primes.length < num
    primes << i if is_prime?(i)
    i += 1
  end
  primes
end

# Write a recursive method that returns the first "num" factorial numbers.
# Note that the 1st factorial number is 0!, which equals 1. The 2nd factorial
# is 1!, the 3rd factorial is 2!, etc.

def factorials_rec(num)
  factorials = []
  return [1] if num == 1
  return [1] if num == 2
  
  ((num - 1) * factorials_rec(num - 1))
end

class Array
  # Write an `Array#dups` method that will return a hash containing the indices 
  # of all duplicate elements. The keys are the duplicate elements; the values 
  # are arrays of their indices in ascending order, e.g.
  # [1, 3, 4, 3, 0, 3, 0].dups => { 3 => [1, 3, 5], 0 => [4, 6] }

  def dups
    hash = Hash.new {|h,v| h[v] = []}
    self.each.with_index do |el, i|
      hash[el] << i
    end
    hash.reject {|k,v| v.length < 2}
  end
  hash
end

class String
  # Write a `String#symmetric_substrings` method that returns an array of 
  # substrings that are palindromes, e.g. "cool".symmetric_substrings => ["oo"]
  # Only include substrings of length > 1.

  def symmetric_substrings
    substrings = []
    self.each_char.with_index do |char, i|
      self.each_char.with_index do |char2, i2|
        substrings << self[i..i2] if !substrings.include?(self[i..i2])
      end
    end
    substrings.select! {|el| el == el.reverse && el.length > 1}
  end
end

class Array
  # Write an `Array#merge_sort` method; it should not modify the original array.
  # **Do NOT use the built in `Array#sort` or `Array#sort_by` methods in your 
  # implementation.**
  
  def merge_sort(&prc)
    middle = self.length / 2
    return self if self.length < 2

    left = self[0...middle].merge_sort
    right = self[middle..-1].merge_sort

    self.merge(left,right,prc)
  end

  private
  def self.merge(left, right, &prc)

    merged = []
    until left.length == 0 || right.length == 0
      if left[0] > right[0]
        merged << right.shift
      else
        merged << left.shift
      end
    end

    return merged + left + right

  end
end
