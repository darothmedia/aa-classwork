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
    # last_pos = pos
    possible_pos = [
      [(pos[0] - 2), (pos[1] - 1)], 
      [(pos[0] - 1), (pos[1] - 2)], 
      [(pos[0] + 2), (pos[1] - 1)], 
      [(pos[0] + 1), (pos[1] - 2)], 
      [(pos[0] + 2), (pos[1] + 1)],
      [(pos[0] - 2), (pos[1] + 1)],
      [(pos[0] - 1), (pos[1] + 2)],
      [(pos[0] + 1), (pos[1] + 2)]
    ]
    valid_pos = []
    possible_pos.each do |pospos|
      next if pospos[0] > 7 || pospos[0] < 0
      next if pospos[1] > 7 || pospos[1] < 0
      valid_pos << pospos
    end
    
    return valid_pos
  end

  def new_move_positions(pos)
    all_moves = KnightPathFinder.valid_moves(pos)
    all_moves.select{|move| !@considered_positions.include?(move)}
  end

  #   def bfs(target)
  #   queue = []
  #   queue << self
  #   while !queue.empty?
  #     queue_first = queue.shift
  #     return queue_first if queue_first.value == target
  #     queue += queue_first.children if !queue_first.children.empty?
  #   end
  #   return nil
  # end

  
    # queue = []
    # queue << @root_node
   
    # path = [@root_node]
    # while !queue.empty?
    #   valid_moves = KnightPathFinder.valid_moves(queue.shift)
    #   path << end_pos if valid_moves.include?(end_pos)
    #   valid_moves.each do |move|
    #     if KnightPathFinder.valid_moves(move).include?(end_pos)
    #       path << [move, end_pos]
    #       return path
    #     end
    #   end
    # end
    # return nil
  def find_path(end_pos)
    path = [@root_node]
    valid_moves = KnightPathFinder.valid_moves(@root_node)
    valid_moves.each do |move|
      @move_tree.add_child(move)
    end
    
    if @move_tree.bfs(end_pos) == end_pos
      path << end_pos
    else 
    end

  end
  
end

p KnightPathFinder.valid_moves([0,0])