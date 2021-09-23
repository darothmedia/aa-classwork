require_relative "piece"
require_relative "steppable"

class King < Piece
  include Steppable
  def initialize(color, board, pos)
    super(color, board, pos)
  end

  def move_dirs
    king
  end

end