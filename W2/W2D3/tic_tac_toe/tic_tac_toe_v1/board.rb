class Board
  def initialize
    @grid = Array.new(3) {Array.new(3, "_")}
  end

  # def valid?(pos)
  #   if pos.all? {|el| el >= 0 && el < 3}
  #     return true
  #   else
  #     return false
  #     raise "Out of bounds"
  #   end
  # end

  def empty?(pos)
    if @grid[pos[0]][pos[1]] == "_"
      return true
    else
      return false
      raise "Already selected"
    end
  end

  def place_mark(pos, mark)
    if !empty?(pos)
      raise "Error: space not empty!"
    else
      @grid[pos[0]][pos[1]] = mark
    end
  end

  def print
    board = ""
    @grid.each do |array|
      line = []
      array.each do |el|
        line << el
      end
      board += (line.join(" ") + "\n")
    end
    puts board
  end

  def win_row?(mark)
    @grid.any? {|row| row.all? {|el| el == mark}}
  end

  def win_col?(mark)
    (0...3).each do |col|
      count = 0
      count += 1 if @grid[0][col] == mark
      count += 1 if @grid[1][col] == mark
      count += 1 if @grid[2][col] == mark
      return true if count == 3
    end
    return false
  end

  def win_diagonal?(mark)
    hash = Hash.new(0)
    @grid.each.with_index do |row, i|
      row.each.with_index do |el, i2|
        if i == i2 && el == mark
          hash[i2] += 1
        # elsif (i == (row.length - 1) && (i2 == 0 || i2 == (row.length - 1))) && el == mark
        #   hash[i2] += 1
        # elsif (i == 0 && (i2 == 0 || i2 == (row.length - 1))) && el == mark
        #   hash[i2] += 1
        end
      end
    end
    if hash.has_value?(3)
      return true
    else
      return false
    end
  end

  def win?(mark)
    if win_row?(mark) == true
      return true
    elsif win_col?(mark) == true
      return true
    elsif win_diagonal?(mark) == true
      return true
    else
      return false
    end
  end

  def empty_positions?
    @grid.any? {|row| row.any? {|el| el == "_"}}
  end
end