def range_rec(start, last)
  return [] if last < start
  return [start] if start == last

  [start] + range_rec((start + 1), last)
end

# p range_rec(1, 5)
# p range_rec(2, 2)
# p range_rec(3, 14)
# p range_rec(14, 3)

def range_itr(start, last)
  (start..last).to_a
end

# p range_itr(1, 5)
# p range_itr(2, 2)
# p range_itr(3, 14)
# p range_itr(14, 3)

def exp_1(num, exp)
  return 1 if exp == 0
  return num if exp == 1

  num * exp_1(num, exp - 1)
end

def exp_2(num, exp)
  return 1 if exp == 0
  return num if exp == 1

  if num.even?
    exp_2(num, exp / 2) * exp_2(num, exp / 2)
  else
    num * (exp_2(num, (exp - 1) / 2) * exp_2(num, (exp - 1) / 2)) 
  end
end

# p exp_2(1, 0)
# p exp_2(1, 1)
# p exp_2(1, 2)
# p exp_2(2, 0)
# p exp_2(2, 1)
# p exp_2(2, 2)

def deep_dup(arr)
  return [arr].dup if !arr.is_a?(Array)
  new_arr = []

  arr.each do |ele|
    if ele.is_a?(Array)
      new_arr << deep_dup(ele)
    else
      new_arr << ele
    end
  end

  new_arr
end

# p deep_dup([1, [2], [3, [4]]])

def fibonacci_rec(n)
  return [1,1].take(n) if n <= 2

  prev_fib = fibonacci_rec(n - 1)
  prev_fib << (prev_fib[-1] + prev_fib[-2])
end

def fibonacci_itr(n)
  return [] if n < 1
  return [1] if n == 1
  fib = [1, 1]

  i = 2
  while i < n
    fib << (fib[-1] + fib[-2])
    i += 1
  end

  fib
end

# p fibonacci_itr(2)
# p fibonacci_itr(0)
# p fibonacci_itr(5)
# p fibonacci_itr(1)
# p fibonacci_itr(14)
# p fibonacci_itr(7)

def bsearch(arr, target)
  middle = arr.length / 2
  
  return middle if target == arr[middle]
  return nil if arr.empty?

  if target < arr[middle]
    left = bsearch(arr[0...middle], target)
  elsif bsearch(arr[middle+1..-1], target) != nil
    right = (middle + 1) + bsearch(arr[middle+1..-1], target)
  else
    return nil
  end

end

# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil

def merge_sort(arr)
  return arr if arr.length <= 1

  middle = arr.length / 2
  left = merge_sort(arr[0...middle])
  right = merge_sort(arr[middle..-1])

  merge_arr(left, right)

end


def merge_arr(left_arr, right_arr)
  new_arr = []

  until left_arr.length == 0 || right_arr.length == 0
    if left_arr[0] > right_arr[0]
      new_arr << right_arr.shift
    else
      new_arr << left_arr.shift
    end
  end
  
  if left_arr.length > 0
    new_arr += left_arr
  elsif right_arr.length > 0
    new_arr += right_arr
  end

  new_arr
end

# p merge_sort([])
# p merge_sort([3])
# p merge_sort([3, 1])
# p merge_sort([5, 2, 10, 3, 5, 6, 1, 0, 4])
# p merge_sort([10, 3, -5, 6, -1])

# def subsets(arr)
#   new_arr = []
#   return arr if arr == []
#   return arr if arr.length == 1

#   arr.each_index do |i|
#     arr.each_index do |j|
#       new_arr << (arr[i..j]) if !new_arr.include?(arr[i..j])
#     end
#     sliced = arr.dup
#     sliced.delete_at(i)
#     new_arr << subsets(sliced)
#   end

  
#   # sliced.delete(2)
#   # p sliced
#   # arr

#   # new_arr
# end


def subsets_itr(arr)
  new_arr = []
  arr.each.with_index do |ele, i|
    arr.each_index do |j|
      sub_arr = arr.drop(i + 1)
    end
  end
end


# # p subsets([]) # => [[]]
# # p subsets([1]) # => [[], [1]]
# # p subsets([1, 2]) # => [[], [1], [2], [1, 2]]
# p subsets([1, 2, 3]) # => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]

def permutations(arr)
  new_arr = []

  
end


