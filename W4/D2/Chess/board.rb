require_relative "./Pieces/piece.rb"
require_relative "./Pieces/knight_king.rb"
require_relative "./Pieces/null_piece.rb"
require_relative "./Pieces/pawn.rb"
require_relative "./Pieces/rook_bishop_queen.rb"

class Board
  def initialize 
    @board = Array.new(8) {Array.new(8)}
  end

  # def inspect
  # end

  # (white, @board, [0,0])

  def board_setup
    @board[0][0] = RookBishopQueen.new("white", @board, [0, 0])
    # @board[0][1] = KnightKing.new("white", @board, [[0, 1]])
    # @board[0][2] = RookBishopQueen.new("white", @board, [0, 2])
    # @board[0][3] = RookBishopQueen.new("white", @board, [0, 3])
    # @board[0][4] = KnightKing.new("white", @board, [0, 4])
    # @board[0][5] = RookBishopQueen.new("white", @board, [0, 5])
    # @board[0][6] = KnightKing.new("white", @board, [0, 6])
    # @board[0][7] = RookBishopQueen.new("white", @board, [0, 7])

    # @board[7][0] = RookBishopQueen.new("black", @board, [7, 0])
    # @board[7][1] = KnightKing.new("black", @board, [7, 1])
    # @board[7][2] = RookBishopQueen.new("black", @board, [7, 2])
    # @board[7][3] = KnightKing.new("black", @board, [7, 3])
    # @board[7][4] = RookBishopQueen.new("black", @board, [7, 4])
    # @board[7][5] = RookBishopQueen.new("black", @board, [7, 5])
    # @board[7][6] = KnightKing.new("black", @board, [7, 6])
    # @board[7][7] = RookBishopQueen.new("black", @board, [7, 7])

    # @board[1].each_with_index.map! {|space, idx| space = Pawn.new("white", @grid, [1, idx])}
    # @board[6].each_with_index.map! {|space, idx| space = Pawn.new("black", @grid, [6, idx])}
    # @board[2].map! {|space| space = NullPiece.new}
    # @board[3].map! {|space| space = NullPiece.new}
    # @board[4].map! {|space| space = NullPiece.new}
    # @board[5].map! {|space| space = NullPiece.new}
  end

  def [](pos)
    row, col = pos
    @board[row][col]
  end

  def []=(pos, val)
    row, col = pos
    @board[row][col] = val
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

  def add_piece(piece, pos)
    if valid_pos?(pos)
      self[pos] = piece
    else
      raise "Not a valid position"
    end
  end

  def move_piece(start_pos, end_pos)
    position = @grid[end_pos]
    position = self[start_pos]
    @grid[start_pos] = NullPiece.new
  end

  def checkmate?(color)

  end


end