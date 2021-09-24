require "benchmark"
list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]

def my_min(list) #
  min = 0 #1

  list.each do |el| #n
    list.each do |compared_el| #n^2
      if el < compared_el && el < min #3 * n^2
        min = el #1 * 3 * n^2
      end
    end
  end

  min #1
end
# 1 + n + n^2 + 3 * n^2 + 1 + 1


def my_better_min(list)
  min = list[0] #1

  list.each_with_index do |ele_1, i| #n
    if ele_1 < min # 1 *n
      min = ele_1 #1 *n
    end
  end

  min #1
    # (i...list.length).each do |j|
      # if list[i] list[j]
end

# p my_min(list)
small = (1..1_000).to_a.shuffle
med = (1..5_000).to_a.shuffle
big = (1..10_000).to_a.shuffle

# puts "This is my_min"
# Benchmark.bm do |b|
#   b.report("1,000:   ") { my_min(small) }
#   b.report("5,000:  ") { my_min(med) }
#   b.report("10,000:   ") { my_min(big) }
# end

# puts "This is my_better_min"
# Benchmark.bm do |b|
#   b.report("1,000:   ") { my_better_min(small) }
#   b.report("5,000:  ") { my_better_min(med) }
#   b.report("10,000:   ") { my_better_min(big) }
# end

list = [5, 3, -7]

def largest_contiguous_subsum(list)
  #iterate through array
  #nested loop

  subarrs = []
    list.each_index do |i|
      (i..list.length - 1).each do |j|
        subarrs << list[i..j]
      end
    end
  inj = subarrs.inject do |acc, el|
    if acc.sum > el.sum
      acc
    else
      el
    end
  end

  inj.sum
end

p largest_contiguous_subsum(list)
largest = 0



def largest_better(list)
  # largest_sum = 0
  # i = 0
  # j = list.length - 1
  # while i < list.length && j > 0
  #   if i < j
  #     current_sum = list[i..j].sum
  #     largest_sum = current_sum if current_sum > largest_sum
  #     i += 1
  #   else
  #     j -= 1
  #     i = 0
  #   end
  # end
  # largest_sum
  largest_sum = 0
  current_sum = 0

  list.each do |ele|
    current_sum += ele
    if current_sum > largest_sum
      largest_sum = current_sum
    elsif current_sum < 0
      current_sum = 0
    end
  end

  largest_sum
end

p largest_better(list)

