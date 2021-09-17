# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span
    if self == [] || !self.all? {|el| el.is_a? Integer}
      return nil
    else
      return self.max - self.min
    end
  end

  def average
     if self == [] || !self.all? {|el| el.is_a? Integer}
      return nil
    else
      return ((self.sum * 1.0) / self.length)
    end
  end

  def median
    return nil if self == []
    half = self.length / 2
    if self.length % 2 != 0
      return self.sort[half]
    else
      return (self.sort[half] + self.sort[half - 1]) / 2.0
    end
  end

  def counts
    hash = Hash.new(0)
    self.each {|el| hash[el] += 1}
    hash
  end

  def my_count(value)
    hash = Hash.new(0)
    self.each {|el| hash[el] += 1}
    hash[value]
  end

  def my_index(value)
    ind = []
    self.each.with_index do |el, i|
      ind << i if el == value
    end
    return ind[0]
  end

  def my_uniq
    new_arr = []
    self.each { |el| new_arr << el if !new_arr.include?(el) }
    new_arr
  end

  def my_transpose
    new_arr = Array.new(self.length) {Array.new(self[0].length)}
    self.each.with_index do |arr, i|
      arr.each.with_index do |el, ind|
        new_arr[ind][i] = el
      end
    end
    new_arr
  end
end


arr_1 = [
          ["a", "b", "c"],
          ["d", "e", "f"],
          ["g", "h", "i"]
        ]

p arr_1.my_transpose