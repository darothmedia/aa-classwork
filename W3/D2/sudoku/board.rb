require_relative "tile"

class Board
  def initialize(grid)
    @grid = grid
  end

  def self.from_file(filename)
    file = File.open(filename)
    rows = file.readlines.map(&:chomp)
    new_grid = Array.new(rows.length) {Array.new(rows.length)}
    rows.each.with_index do |row, i|
      row.split("").map(&:to_i).each.with_index do |num, j|
        new_grid[i][j] = Tile.new(num)
      end
    end
    new_grid
  end

  def update_tile_value(pos, value)
    @grid[pos[0]][pos[1]] = value
  end

  def render
    @grid.each do |row|
      row_vals = []
      row.each do |el|
        row_vals << el.value
      end
      puts row_vals.join(" ")
    end
  end

  def row_solved?
    @grid.each do |row|
      row_vals = []
      row.each do |el|
        row_vals << el.value
      end
      return false if row_vals.sort != (1..9).to_a
    end
    return true
  end

  def col_solved?
    @grid.transpose.each do |col|
      col_vals = []
      col.each do |el|
        col_vals << el.value
      end
      return false if col_vals.sort != (1..9).to_a
    end
    return true
  end

  def square_solved?
    @grid.each do |row|
      

    end
  end

  def solved?
  end
end