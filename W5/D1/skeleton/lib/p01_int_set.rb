class MaxIntSet
  attr_reader :store
  def initialize(max)
    @store = Array.new(max, false)
  end

  def insert(num)
    if is_valid?(num)
      @store[num] = true
    end 
  end

  def remove(num)
    @store[num] = false 
  end

  def include?(num)
    @store[num] 
  end

  private

  def is_valid?(num)
   if num > @store.length || num < 0 
    raise "Out of bounds"
    return false
   end 
  true 
  end

  def validate!(num)
  end
end


class IntSet
  attr_reader :num_buckets
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @num_buckets = num_buckets
  end

  def insert(num)
    self[num] << num
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count, :store

  def initialize(num_buckets = 20)
    # @store.length has to be > @count
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    #puts num 
    if !include?(num)
      self[num] << num
      @count += 1
      if @count == num_buckets
        resize!
      end
    end
  end

  def remove(num)
    if include?(num)
      self[num].delete(num)
      @count -= 1
    else
      return nil
    end
    @count
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
     @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_int_set = ResizingIntSet.new(num_buckets * 2)
    @count = 0
    @store.each do |bucket|
      bucket.each do |ele|
        new_int_set.store[ele % (num_buckets * 2)] << ele
        @count += 1
      end
    end
    @store = new_int_set.store
  end
end
