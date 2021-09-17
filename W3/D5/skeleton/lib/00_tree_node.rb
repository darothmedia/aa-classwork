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
    if node != nil
      @parent = node 
      node.children << self unless node.children.include?(self)
    else
      self.parent.children.delete(self)
      @parent = nil
    end 
  end

  # def inspect
  #   @value
  # end



end

node1 = PolyTreeNode.new('root') 
node2 = PolyTreeNode.new('child1') 
node3 = PolyTreeNode.new('child2')

node2.parent = nil
p node2