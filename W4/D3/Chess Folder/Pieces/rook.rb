require_relative "piece"
require_relative "slideable"

class Rook < Piece
  include Slidable
  attr_reader :color, :board, :pos
  def initialize(color, grid, pos)
    # @color = color
    # @board = board
    # @pos = pos
    super(color, grid, pos)
  end

  def move_dirs
    vertical + horizontal
  end
end