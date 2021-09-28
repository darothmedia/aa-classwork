require "byebug"

class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  include Enumerable

  attr_reader :head, :tail

  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
    @list = [@head, @tail]
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    self.head.next 
  end

  def last
    self.tail.prev
  end

  def empty?
    !(@list.length > 2)
  end

  def get(key)
    @list.each do |node|
      if node.key == key
        return node.val
      end
    end
    nil 
  end

  def include?(key)
    @list.each do |node|
      return true if node.key == key 
    end
    false 
  end

  def append(key, val)
    #Add a new node to the list
    node = Node.new(key, val)
    node.prev = @tail.prev 
    node.next = @tail 
    @list << node 
    @tail.prev.next = node 
    @tail.prev = node 
  end

  def update(key, val)
      @list.each do |node|
        if node.key == key 
          node.val = val
        end
      end
  end

  def remove(key)
    our_node = nil
    @list.each do |node|
      if node.key == key
        our_node = node
      end  
    end

    our_node.prev.next = our_node.next 
    our_node.next.prev = our_node.prev

   #our_node.prev = nil
   #our_node.next = nil
   
   @list.delete(our_node)

  end

  def each
    values = [@head]
    until values.last.next.nil?
      values << values.last.next
    end
    # new_arr = []
    values.each do |ele| 
      # debugger
      yield ele if !ele.val.nil?
    end

    # return new_arr
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
