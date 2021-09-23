class Array

  def my_uniq
    new_arr = []
    self.each do |ele|
      new_arr << ele if !new_arr.include?(ele)
    end
    new_arr
  end

  def two_sum
    sums = []
    self.each.with_index do |ele, jdx|
      idx = jdx + 1
      while idx < self.length
        if self[jdx] + self[idx] == 0
          sums << [jdx, idx]
        end
        idx += 1
      end
    end
    sums
  end

end