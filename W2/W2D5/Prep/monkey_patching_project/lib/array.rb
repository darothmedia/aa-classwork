# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span
    if self.all? {|el| el.is_a? Integer} && self.length != 0
      self.max - self.min
    elsif self == []
      return nil
    end
  end

  def average
    if self.all? {|el| el.is_a? Integer} && self.length != 0
      return (self.sum * 1.0) / self.length
    elsif self == []
      return nil
    end
  end

  def median
    sort = self.sort
    half = self.length / 2
    if self.length % 2 != 0 && self.length != 0
      self.sort[self.length / 2]
    elsif self.length % 2 == 0 && self.length != 0
      (sort[half] + sort[half - 1]) / 2.0
    elsif self == []
      return nil
    end
  end

  def counts
    hash = Hash.new(0)
    self.each {|el| hash[el] += 1}
    hash
  end

  def my_count(value)
    counts[value]
  end

  def my_index(value)
    self.each.with_index do |el, i|
      return i if el == value
    end
    return nil
  end

  def my_uniq
    counts.keys
  end

  def my_transpose
    new_arr = Array.new(self.length) {Array.new(0)}
    self.each_with_index do |arr, i|
      arr.each_with_index do |el, i2|
        new_arr[i2] << el
      end
    end
    new_arr
  end


end
