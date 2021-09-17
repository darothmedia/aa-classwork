class Board
  
  attr_reader :size

  def initialize(n)
    @grid = Array.new(n) {Array.new(n, :N)}
    @size = n * n
    @length = n
  end

  def [](array)
    @grid[array[0]][array[1]]
  end

  def []=(pos, value)
    @grid[pos[0]][pos[1]] = value
  end

  def num_ships
    count = 0
    @grid.each do |row|
      row.each do |el|
        count += 1 if el == :S
      end
    end
    count
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
    while num_ships < quarter
      @grid[rand(0...@length)][rand(0...@length)] = :S
    end
  end

  def hidden_ships_grid
    hidden = Array.new(@length) {Array.new(@length, :N)}
    hidden.each.with_index do |row, i|
      row.each.with_index do |el, i2|
        if @grid[i][i2] == :X
          hidden[i][i2] = :X
        end
      end
    end
    hidden
  end

  def self.print_grid(array)
    printed = ""
    array.each do |row|
      str = row.join(" ")
      str += "\n"
      printed += str
    end
    puts printed
  end

  def cheat
    Board.print_grid(@grid)
  end

  def print
    Board.print_grid(hidden_ships_grid)
  end


end
