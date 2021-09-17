def matrix_addition(matrix_1, matrix_2) # [[2,5], [4,7]], [9,1], [3,0]]
  # final_arr = []
  # iterate over the 1st matrix
  # push subarrays into the final_arr
  # iterate again, gain access elements

  final_arr = []

  matrix_1.each_with_index do |arr, i|
    final_arr.push([]) # [[], []]
    p final_arr
    arr.each_with_index do |el, j|
      sum = matrix_1[i][j] + matrix_2[i][j]
      final_arr[i].push(sum)
    end
  end
  final_arr
end

matrix_a = [[2,5], [4,7]]
matrix_b = [[9,1], [3,0]]
matrix_c = [[-1,0], [0,-1]]
matrix_d = [[2, -5], [7, 10], [0, 1]]
matrix_e = [[0 , 0], [12, 4], [6,  3]]

# p matrix_addition(matrix_a, matrix_b) # [[11, 6], [7, 7]]
# p matrix_addition(matrix_a, matrix_c) # [[1, 5], [4, 6]]
# p matrix_addition(matrix_b, matrix_c) # [[8, 1], [3, -1]]
# p matrix_addition(matrix_d, matrix_e) # [[2, -5], [19, 14], [6, 4]]

def tribonacci_number(n)
  trib = [1, 1, 2]

  (0..n).each do |i| # ... vs ..
    trib.push(trib[-1] + trib[-2] + trib[-3])
  end

  trib[n - 1] # the length of trib array doesn't coincide with nth number so we need to index in on [num - 1]
end

# p tribonacci_number(1)  # 1
# p tribonacci_number(2)  # 1
# p tribonacci_number(3)  # 2
# p tribonacci_number(4)  # 4
# p tribonacci_number(5)  # 7
# p tribonacci_number(6)  # 13
# p tribonacci_number(7)  # 24
# p tribonacci_number(11) # 274

def matrix_addition_reloaded(arr_1, *arrays)
  # accepting an unknown number of arguments, splat
  # return nil when matrices.length =!

  arrays.each do |array|
    # we want to compare the length of arr_1 with array.length
    if arr_1.length != array.length
      return nil
    end
  end

  final_arr = []
  arr_1.each_with_index do |sub_arr, i|
    sub_arr_final = []
    arr_1[i].each_with_index do |num, j| 
      sum_nums = 0
      arrays.each { |arr| sum_nums += arr[i][j] }
      sub_arr_final << sum_nums + num
    end

    final_arr << sub_arr_final
  end

    return final_arr
end

matrix_a = [[2,5], [4,7]]
matrix_b = [[9,1], [3,0]]
matrix_c = [[-1,0], [0,-1]]
matrix_d = [[2, -5], [7, 10], [0, 1]]
matrix_e = [[0 , 0], [12, 4], [6,  3]]

p matrix_addition_reloaded(matrix_a, matrix_b)              # [[11, 6], [7, 7]]
p matrix_addition_reloaded(matrix_a, matrix_b, matrix_c)    # [[10, 6], [7, 6]]
p matrix_addition_reloaded(matrix_e)                        # [[0, 0], [12, 4], [6, 3]]
p matrix_addition_reloaded(matrix_d, matrix_e)              # [[2, -5], [19, 14], [6, 4]]
p matrix_addition_reloaded(matrix_a, matrix_b, matrix_e)    # nil
p matrix_addition_reloaded(matrix_d, matrix_e, matrix_c)    # nil