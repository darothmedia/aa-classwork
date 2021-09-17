class Board
  attr_reader :size, :width

  def initialize(n)
    @grid = Array.new(n) {Array.new(n, :N)}
    @size = n * n
    @width = n
  end

  def [](arr)
    return @grid[arr[0]][arr[1]]
  end

  def []=(pos, val)
    @grid[pos[0]][pos[1]] = val
  end

  def num_ships
    @grid.flatten.count(:S)
  end

  def attack(pos)
    if self[pos] == :S
      self[pos] = :H
      p "you sunk my battleship!"
      return true
    else
      self[pos] = :X
      return false
    end
  end

  def place_random_ships
    quarter = @size / 4
    while self.num_ships < quarter
      @grid[rand(@width)][rand(@width)] = :S
    end
  end

  def hidden_ships_grid
    hidden = Array.new(@width) {Array.new(@width, :N)}
    @grid.each.with_index do |arr, i|
      arr.each.with_index do |el, i2|
        if el == :S
          hidden[i][i2] = :N
        else
          hidden[i][i2] = el
        end
      end
    end
    hidden
  end

  def self.print_grid(grid)
    output = ""
    grid.each do |arr|
      line = []
      arr.each do |el|
        line << el.to_s
      end
      output += line.join(" ") + "\n"
    end
    print output
  end

  def cheat
    Board.print_grid(@grid)
  end

  def print
    Board.print_grid(hidden_ships_grid)
  end

end


