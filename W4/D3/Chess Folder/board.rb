require_relative "./Pieces/piece.rb"
require_relative "./Pieces/knight.rb"
require_relative "./Pieces/king.rb"
require_relative "./Pieces/null_piece.rb"
require_relative "./Pieces/pawn.rb"
require_relative "./Pieces/rook.rb"
require_relative "./Pieces/bishop.rb"
require_relative "./Pieces/queen.rb"

class Board
  attr_reader :grid

  def initialize 
    @grid = Array.new(8) {Array.new(8)}
  end

  # def inspect
  # end

  # (white, @board, [0,0])
  
  def board_setup
    @grid[0][0] = Rook.new("white", self, [0, 0])
    @grid[0][1] = Knight.new("white", self, [[0, 1]])
    @grid[0][2] = Bishop.new("white", self, [0, 2])
    @grid[0][3] = Queen.new("white", self, [0, 3])
    @grid[0][4] = King.new("white", self, [0, 4])
    @grid[0][5] = Bishop.new("white", self, [0, 5])
    @grid[0][6] = Knight.new("white", self, [0, 6])
    @grid[0][7] = Rook.new("white", self, [0, 7])

    @grid[7][0] = Rook.new("black", self, [7, 0])
    @grid[7][1] = Knight.new("black", self, [7, 1])
    @grid[7][2] = Bishop.new("black", self, [7, 2])
    @grid[7][3] = King.new("black", self, [7, 3])
    @grid[7][4] = Queen.new("black", self, [7, 4])
    @grid[7][5] = Bishop.new("black", self, [7, 5])
    @grid[7][6] = Knight.new("black", self, [7, 6])
    @grid[7][7] = Rook.new("black", self, [7, 7])

    @grid[1][0] = Pawn.new("white", self, [1, 0])
    @grid[1][1] = Pawn.new("white", self, [1, 1])
    @grid[1][2] = Pawn.new("white", self, [1, 2])
    @grid[1][3] = Pawn.new("white", self, [1, 3])
    @grid[1][4] = Pawn.new("white", self, [1, 4])
    @grid[1][5] = Pawn.new("white", self, [1, 5])
    @grid[1][6] = Pawn.new("white", self, [1, 6])
    @grid[1][7] = Pawn.new("white", self, [1, 7])

    @grid[6][0] = Pawn.new("black", self, [6, 0])
    @grid[6][1] = Pawn.new("black", self, [6, 1])
    @grid[6][2] = Pawn.new("black", self, [6, 2])
    @grid[6][3] = Pawn.new("black", self, [6, 3])
    @grid[6][4] = Pawn.new("black", self, [6, 4])
    @grid[6][5] = Pawn.new("black", self, [6, 5])
    @grid[6][6] = Pawn.new("black", self, [6, 6])
    @grid[6][7] = Pawn.new("black", self, [6, 7])
   

    # @grid[1].each_with_index.map! {|space, idx| space = Pawn.new("white", @grid, [1, idx])}
    # @grid[6].each_with_index.map! {|space, idx| space = Pawn.new("black", @grid, [6, idx])}

    @grid[2].map! {|space| space = NullPiece.new}
    @grid[3].map! {|space| space = NullPiece.new}
    @grid[4].map! {|space| space = NullPiece.new}
    @grid[5].map! {|space| space = NullPiece.new}
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, val)
    row, col = pos
    @grid[row][col] = val
  end

  def valid_pos?(pos)
    row, col = pos
    if row > 7 || row < 0
      return false
    elsif col > 7 || col < 0
      return false
    end
    return true
  end

  # def add_pawn(row)
  #   # row, col = pos
  #   # @grid[row][col]

  #   @grid[row].each.with_index do |space, idx|
  #     if row == 1
  #       @grid[row][idx] = Pawn.new("white", @grid, [row, idx])
  #     elsif row == 6
  #       @grid[row][idx] = Pawn.new("black", @grid, [row, idx])
  #     end
  #   end
    
  #   # if valid_pos?(pos)
  #   #   self[pos] = piece
  #   # else
  #   #   raise "Not a valid position"
  #   # end
  # end

  def move_piece!(start_pos, end_pos)
    if self[start_pos].is_a?(NullPiece)
      raise "Cannot move that piece."
    # elsif !self.valid_pos?([end_pos])
    #   raise "Cannot move here."
    # elsif !self.valid_pos?([start_pos])
    #   raise "Cannot start here."
    end
    self[end_pos] = self[start_pos]
    self[start_pos] = NullPiece.new
    self[end_pos].pos = end_pos
  end

  def checkmate?(color)

  end

  
end