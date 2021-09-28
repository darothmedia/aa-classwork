require_relative 'p04_linked_list'
require "byebug"

class HashMap
  attr_accessor :count, :store

  include Enumerable

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    @store[bucket(key)].include?(key)
  end

  def set(key, val)
    if !include?(key)
      @store[bucket(key)].append(key, val)
      @count += 1
      if @count == num_buckets
        resize!
      end
    else 
      @store[bucket(key)].update(key, val)
    end
  end

  def get(key)
    @store[bucket(key)].each do |node|
      return node.val if node.key == key 
    end
    nil
  end

  def delete(key)
    @store[bucket(key)].remove(key)
    @count -= 1
  end

  def each
    @store.each do |bucket| 
      bucket.each do |ele|
        yield ele.key, ele.val 
      end
    end
  end

  # uncomment when you have Enumerable included
  # def to_s
  #   pairs = inject([]) do |strs, (k, v)|
  #     strs << "#{k.to_s} => #{v.to_s}"
  #   end
  #   "{\n" + pairs.join(",\n") + "\n}"
  # end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    new_map = HashMap.new(num_buckets * 2)
    @count = 0 

    @store.each do |bucket|
      bucket.each do |node|
        new_map.store[node.key.hash % (num_buckets * 2)].append(node.key, node.val)
        new_map.count += 1
      end
    end

    @store = new_map.store
    @count = new_map.count

    # p self


    # new_int_set = ResizingIntSet.new(num_buckets * 2)
    # @count = 0
    # @store.each do |bucket|
    #   bucket.each do |ele|
    #     new_int_set.store[ele % (num_buckets * 2)] << ele
    #     @count += 1
    #   end
    # end
    # @store = new_int_set.store
  end

  def bucket(key)
    # optional but useful; return the bucket corresponding to `key`
    hashed_key = key.hash
    hashed_key % num_buckets
  end
end
