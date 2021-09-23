require "byebug"
module Steppable

  def king
    arr = [
      [[self.pos[0] + 1], self.pos[1]], 
      [self.pos[0], [self.pos[1] + 1]], 
      [[self.pos[0] + 1], [self.pos[1] + 1]], 
      [[self.pos[0] + 1], [self.pos[1] - 1]], 
      [self.pos[0], [self.pos[1] - 1]],
      [[self.pos[0] - 1], [self.pos[1] - 1]],
      [[self.pos[0] - 1], self.pos[1]],
      [[self.pos[0] - 1], [self.pos[1] + 1]],
    ]

    valid_moves = []

    arr.each do |space|
      if (@board.grid[space[0]][space[1]].is_a?(NullPiece)) && @board.grid.valid_pos?(space)
        valid_moves << space
      elsif self.color != @board.grid[space[0]][space[1]].color && @board.grid.valid_pos?(space)
        valid_moves << space
      end
    end
    valid_moves
  end

  def knight
    arr = [
      [[self.pos[0] + 2], [self.pos[1] + 1]], 
      [[self.pos[0] + 1], [self.pos[1] + 2]], 
      [[self.pos[0] + 1], [self.pos[1] - 2]], 
      [[self.pos[0] - 2], [self.pos[1] - 1]], 
      [[self.pos[0] - 2], [self.pos[1] + 1]],
      [[self.pos[0] - 1], [self.pos[1] + 2]],
      [[self.pos[0] - 1], [self.pos[1] - 2]],
      [[self.pos[0] + 2], [self.pos[1] - 1]],
    ]

    valid_moves = []

    arr.each do |space|
      if (@board.grid[space[0]][space[1]].is_a?(NullPiece)) && @board.grid.valid_pos?(space)
        valid_moves << space
      elsif self.color != @board.grid[space[0]][space[1]].color && @board.grid.valid_pos?(space)
        valid_moves << space
      end
    end
    valid_moves

  end

  def pawn
    arr_white = []
    arr_black = []
    first_move_white = [(self.pos[0] + 1), self.pos[1]]
    double_move_white = [(self.pos[0] + 2), self.pos[1]]
    if @board[first_move_white].is_a?(NullPiece)
      arr_white << [(self.pos[0] + 1), self.pos[1]]
      if (self.pos[0] == 1 && self.color == "white") && (@board[double_move_white].is_a?(NullPiece))
        arr_white << [(self.pos[0] + 2), self.pos[1]]
      end
    end

    first_move_black = [(self.pos[0] - 1), self.pos[1]]
    double_move_black = [(self.pos[0] - 2), self.pos[1]]

    if @board[first_move_black].is_a?(NullPiece)
      arr_black << [(self.pos[0] - 1), self.pos[1]]
      if (self.pos[0] == 6 && self.color == "black") && (@board[double_move_black].is_a?(NullPiece))
      arr_black << [(self.pos[0] - 2), self.pos[1]]
      end
    end
    attack_white_right = [(self.pos[0] + 1), self.pos[1] + 1]
    attack_white_left =  [(self.pos[0] + 1), self.pos[1] - 1]
      if (@board[attack_white_right].color != self.color) && !(@board[attack_white_right].is_a?(NullPiece))
        arr_white << attack_white_right
        if (@board[attack_white_left].color != self.color) && !(@board[attack_white_left].is_a?(NullPiece))
        arr_white << attack_white_left
        end
      elsif (@board[attack_white_left].color != self.color) && !(@board[attack_white_left].is_a?(NullPiece))
            arr_white << attack_white_left
      end
    
    attack_black_right = [(self.pos[0] - 1), self.pos[1] + 1]
    attack_black_left =  [(self.pos[0] - 1), self.pos[1] - 1]
      if (@board[attack_black_right].color != self.color) && !(@board[attack_black_right].is_a?(NullPiece))
        arr_black << attack_black_right
        if (@board[attack_black_left].color != self.color) && !(@board[attack_black_right].is_a?(NullPiece))
          arr_black << attack_black_left
        end
      elsif (@board[attack_black_left].color != self.color) && !(@board[attack_black_right].is_a?(NullPiece))
            arr_black << attack_black_left
      end
      if self.color == "white"
        arr_white
      else
        arr_black
      end
  end

  def move_dirs
    raise "Don't call me here"
  end
end