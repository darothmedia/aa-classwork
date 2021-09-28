require_relative "p01_int_set"

class HashSet < ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  #needs work 
  def insert(key)
    super(key.hash)
  end

  def include?(key)
    super(key.hash)
  end

  #needs work 
  def remove(key)
    hashed_key = key.hash
    if include?(key)
      self[hashed_key].delete(hashed_key)
      @count -= 1
    else
      return nil
    end
    @count
    # @count = super(key.hash) if !@count.nil?
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
    super
  end
end
