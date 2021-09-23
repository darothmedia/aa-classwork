
class Piece
  
  attr_reader :color, :grid
  attr_accessor :moves, :pos
  def initialize(color, board, pos)
    @color = color
    @pos = pos
    @board = board
    @moves = []
  end

  def moves

  end

end


#  idx = self.pos[1]
#     while idx < 7
#       if @grid[self.pos[0]][idx] is_a?(NullPiece)
#         hor << [self.pos[0], idx]
#       else
#         break
#       end
#       idx += 1
#     end