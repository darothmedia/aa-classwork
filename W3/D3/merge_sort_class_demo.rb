class Array

  def merge_sort
    if self.length <= 1
      return self
    end
    
    middle = self.length / 2
    
    left = self[0...middle].merge_sort # [4]
    right = self[middle..-1].merge_sort # [9]
    
    left.merge(right)
  end


  def merge(other_arr) # [] and [43,87,112]
    merged = [] # [3,27,38]
    
    while self.length != 0 && other_arr.length != 0 # are both of the arrays nonempty?
      if self[0] <= other_arr[0]
        merged << self.shift
      elsif self[0] > other_arr[0]
        merged << other_arr.shift
      end
    end
    # at this point, one of the arrays is empty.
    
    merged + self + other_arr # [4] + [9]
  end

end

p [5,3,2,7,54,1,0,0,-34,-2,-15,35,13].merge_sort
p [8,7,6,5,4].merge_sort
p [].merge_sort
p [-6,-2,0,1,5,34].merge_sort
p [7].merge_sort
p [34,9].merge_sort
p [8,8,8,8,8,8,8].merge_sort