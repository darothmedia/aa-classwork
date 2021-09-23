require_relative "piece"
require_relative "slideable"

class Queen < Piece
  include Slidable
  attr_reader :color, :board, :pos
  def initialize(color, grid, pos)
    # @color = color
    # @board = board
    # @pos = pos
    super(color, grid, pos)
  end

   def move_dirs
    vertical + horizontal + diagonal
  end
end