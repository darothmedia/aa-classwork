require_relative "piece"
class Pawn < Piece
  def initialize(color, board, pos)
    super(color, board, pos)
  end
end