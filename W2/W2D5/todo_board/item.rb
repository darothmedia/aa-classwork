class Item
  def self.valid_date?(date)
    arr = date.split("-")
    if arr.length != 3
      return false
    elsif arr[0].length != 4
      return false
    elsif arr[1].to_i > 12 || arr[2].to_i > 31
      return false
    else
      return true
    end
  end

  attr_reader :deadline
  attr_accessor :title, :desc
  def initialize(title, deadline, desc)
    @title = title
    @deadline = deadline
    @desc = desc
  end

  def deadline=(deadline)
    if self.valid_date?(deadline)
      @deadline = deadline
    else
      raise "That is not a valid date. Enter dates in the format YYYY-MM-DD"
    end
  end
end

# p Item.valid_date?('2019-10-25') # true
# p Item.valid_date?('1912-06-23') # true
# p Item.valid_date?('2018-13-20') # false
# p Item.valid_date?('2018-12-32') # false
# p Item.valid_date?('10-25-2019') # false