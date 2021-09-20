require_relative "00_tree_node"

class KnightPathFinder
  attr_reader :root_node

  def initialize(pos)
    @grid = Array.new(8){Array.new(8)}
    @root_node = pos #[0,1]
    @move_tree = PolyTreeNode.new(@root_node)
    @considered_positions = [pos]
  end

  def self.valid_moves(pos)
    # return false if pos[0] > @grid.length || pos[0] < 0
    # return false if pos[1] > @grid.length || pos[1] < 0
    #last_pos = @considered_positions[-1]
    last_pos = pos
    possible_pos = [
      [(last_pos[0] - 2), (last_pos[1] - 1)], 
      [(last_pos[0] - 1), (last_pos[1] - 2)], 
      [(last_pos[0] + 2), (last_pos[1] - 1)], 
      [(last_pos[0] + 1), (last_pos[1] - 2)], 
      [(last_pos[0] + 2), (last_pos[1] + 1)],
      [(last_pos[0] - 2), (last_pos[1] + 1)],
      [(last_pos[0] - 1), (last_pos[1] + 2)],
      [(last_pos[0] + 1), (last_pos[1] + 2)]
    ]
    valid_pos = []
    possible_pos.each do |pospos|
      next if pospos[0] > @grid.length || pospos[0] < 0
      next if pospos[1] > @grid.length || pospos[1] < 0
      valid_pos << pospos
    end
    
    return valid_pos
  end

  def new_move_positions(pos)
    all_moves = KnightPathFinder.valid_moves(pos)
    all_moves.select{|move| !@considered_positions.include?(move)}
  end
  
end