module Slidable
  def horizontal
    hor = []
    row = self.pos[0]
    
    until @board.grid[row] >= 7
      if space.is_a?(NullPiece)
        hor << space
      elsif self.color != space.color
        hor << space
        @board.grid[row] = 7
      elsif self.color == space.color
         @board.grid[row] = 7
      end
      @board.grid[row] += 1
    end

    until @board.grid[row] <= 0
      if space.is_a?(NullPiece)
        hor << space
      elsif self.color != space.color
        hor << space
        @board.grid[row] = 0
      elsif self.color == space.color
         @board.grid[row] = 0
      end
      @board.grid[row] -= 1
    end
    hor
  end

  def vertical 
    vert = []
    trans = @board.transpose
    col = self.pos[1]
    until trans.grid[1] >= 7
      if space.is_a?(NullPiece) 
        vert << space
      elsif  self.color != space.color
        vert << space
        trans.grid[1] = 7
      elsif  self.color == space.color
         trans.grid[1] = 7
      end
      trans.grid[1] += 1
    end

    until trans.grid[1] <= 0
      if space.is_a?(NullPiece) 
        vert << space
      elsif  self.color != space.color
        vert << space
        trans.grid[1] = 0
      elsif  self.color == space.color
         trans.grid[1] = 0
      end
      trans.grid[1] -= 1
    end
    vert
  end

  def diagonal 
    diag = []
    row_idx = self.pos[0]
    col_idx = self.pos[1]
    until row_idx >= 7 || col_idx >= 7
      if @board.grid[row_idx][col_idx].is_a?(NullPiece) 
        diag << [row_idx, col_idx]
      elsif  self.color != @board.grid[row_idx][col_idx].color
        diag << [row_idx, col_idx]
        row_idx = 7
      elsif   self.color == @board.grid[row_idx][col_idx].color
        row_idx = 7
      end
      row_idx += 1
      col_idx += 1
    end

    until row_idx <= 0 || col_idx <= 0
      if @board.grid[row_idx][col_idx].is_a?(NullPiece) 
        diag << [row_idx, col_idx]
      elsif  self.color != @board.grid[row_idx][col_idx].color
        diag << [row_idx, col_idx]
        row_idx = 0
      elsif  self.color == @board.grid[row_idx][col_idx].color
        row_idx = 0
      end
      row_idx -= 1
      col_idx -= 1
    end

    until row_idx >= 7 || col_idx <= 0
      if @board.grid[row_idx][col_idx].is_a?(NullPiece) 
        diag << [row_idx, col_idx]
      elsif  self.color != @board.grid[row_idx][col_idx].color
        diag << [row_idx, col_idx]
        row_idx = 7
     elsif  self.color == @board.grid[row_idx][col_idx].color
      row_idx = 7
      end
      row_idx += 1
      col_idx -= 1
    end

    until row_idx <= 0 || col_idx >= 7
      if @board.grid[row_idx][col_idx].is_a?(NullPiece) 
        diag << [row_idx, col_idx]
      elsif  self.color != @board.grid[row_idx][col_idx].color
        diag << [row_idx, col_idx]
        row_idx = 0
       elsif  self.color == @board.grid[row_idx][col_idx].color
        row_idx = 0
      end
      row_idx -= 1
      col_idx += 1
    end
    diag
  end

  # def valid_diag(diag)
  #   valid = []
  #   row_idx = self.pos[0]
  #   col_idx = self.pos[1]
    
  # end

  def move_dirs
    raise "Don't call me here"
  end
end