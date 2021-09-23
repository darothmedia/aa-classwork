require_relative "piece"
require_relative "steppable"
class Pawn < Piece
  include Steppable
  def initialize(color, grid, pos)
    super(color, grid, pos)
  end

  def move_dirs
   pawn
  end
end