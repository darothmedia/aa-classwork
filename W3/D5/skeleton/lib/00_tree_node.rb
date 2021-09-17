class PolyTreeNode
  attr_reader :value, :parent, :children

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(node)
    unless node == nil
      @parent = node 
      node.children << self unless node.children.include?(self)
    end 
  end


end