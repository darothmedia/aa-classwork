require_relative "piece"
class RookBishopQueen < Piece
  attr_reader :color, :board, :pos
  def initialize(color, board, pos)
    # @color = color
    # @board = board
    # @pos = pos
    super(color, board, pos)
  end
end