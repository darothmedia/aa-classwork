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
    debugger
    if node != nil
      @parent = node 
      node.children << self unless node.children.include?(self)
    elsif self.parent != nil
      parent_node = self.parent
      parent_node.children.delete(self) if parent_node.children.include?(self)
      @parent = nil
    end 
  end

  def inspect
    @parent
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

  
end

node1 = PolyTreeNode.new('root') 
node2 = PolyTreeNode.new('child1') 
node3 = PolyTreeNode.new('child2')

node2.parent = nil
p node2