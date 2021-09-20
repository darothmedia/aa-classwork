require_relative "00_tree_node"

class KnightPathFinder
  attr_reader :root_node

  def initialize(pos)
    @grid = Array.new(8){Array.new(8)}
    @root_node = pos
    @move_tree = PolyTreeNode.new(@root_node)
    @considered_positions = [pos]
  end

  def self.valid_moves(pos)
    
    pos.each do |value|
      @considered_positions << 

    if pos[0] + 2 > @grid.length
      ## [-1]



    


end