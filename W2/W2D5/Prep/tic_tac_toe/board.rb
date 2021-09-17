class Board

  def initialize
    @width = 3
    @grid = Array.new(@width) {Array.new(@width, "_")}
  end

  def valid?(pos)
    pos.each {|el| return false if el < 0 || el > 2 }
    return true
  end

  def empty?(pos)
    @grid[pos[0]][pos[1]] == "_"
  end

  def place_mark(pos, mark)
    raise "Not empty!" if !valid?(pos)
    @grid[pos[0]][pos[1]] = mark
  end

  def print
    printed = ""
    @grid.each do |row|
      row_p = []
      row.each {|el| row_p << el}
      printed += row_p.join(' ') + "\n"
    end
    puts printed
  end

  def win_row?(mark)
    @grid.each do |row|
      return true if row.all? {|el| el == mark}
    end
    return false
  end

  def win_col?(mark)
    hash = Hash.new(0)
    @grid.each do |row|
      row.each.with_index do |el, i|
        hash[i] += 1 if el == mark
      end
    end
    hash.has_value?(@width)
  end

  def win_diagonal?(mark)
    count = 0
    count += 1 if @grid[1][1] == mark
    count += 2 if @grid[0][0] == mark && @grid[2][2] == mark
    count += 2 if @grid[2][0] == mark && @grid[0][2] == mark
    count == 3
  end

  def win?(mark)
    return true if win_row?(mark)
    return true if win_col?(mark)
    return true if win_diagonal?(mark)
    return false
  end

  def empty_positions?
    @grid.each { |row| return true if row.include?("_") }
    return false
  end

end