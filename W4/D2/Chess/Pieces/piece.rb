# require_relative "knight_king"
# require_relative "null_piece"
# require_relative "pawn"
# require_relative "rook_bishop_queen"

class Piece
  attr_reader :color, :board, :pos
  def initialize(color, board, pos)
    @color = color
    @pos = pos
    @board = board
  end
end