require "byebug"

class PolyTreeNode
  attr_reader :value, :parent
  attr_accessor :children

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(node)
    # debugger
    parent_node = self.parent
    parent_node.children.delete(self) if parent_node != nil && parent_node.children.include?(self) 
    
    if node != nil
      @parent = node 
      node.children << self unless node.children.include?(self)
    else
      @parent = nil
    end
  end

  def inspect
    @value
  end

  def add_child(node)
    node.parent = self
    @children << node if !@children.include?(node)
  end

  def remove_child(node)
    raise "not a child" if !@children.include?(node)
    node.parent = nil
    @children.delete(node)
  end

  def dfs(target)
    
    return self if @value == target
    #return nil if @children.empty?
      
    # elsif @children.length == 0
    #   return nil
    @children.each do |child|
      child_dfs = child.dfs(target)
      if child_dfs != nil
        return child_dfs
      end
    end
    return nil
  end

  def bfs(target)
    queue = []
    queue << self
    while !queue.empty?
      queue_first = queue.shift
      return queue_first if queue_first.value == target
      queue += queue_first.children if !queue_first.children.empty?
    end
    return nil
  end
 
end

# node1 = PolyTreeNode.new('root') 
# node2 = PolyTreeNode.new('child1') 
# node3 = PolyTreeNode.new('child2')

# node2.parent = node1
# #child1's parent = root
# node2.parent = node3
#child1's parent = child2, root's children = nil
# p node2.parent
# #child2
# p node1.children
#nil