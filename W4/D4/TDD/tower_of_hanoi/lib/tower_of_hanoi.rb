class Board

  attr_reader :grid

  def initialize
    @grid = Array.new(3) {[]}
    @grid[0] += [4,3,2,1]
  end

  def [](pos)
    raise "Invalid pile" if !(0..2).to_a.include?(pos)
    @grid[pos]
  end

  def []=(pos,val)
    @grid[pos] = val
  end

  def pick(pile)
    raise "Empty pile" if self[pile].empty?
    self[pile].pop
  end

  def place(disk, pile)
    self[pile] << disk
  end

  def win?
    return false if @grid[0] != []
    return false if @grid[1] != []
    return false if @grid[2] != [4,3,2,1]
    true
  end

  def play
    until self.win?
      self.render
      puts "Enter a starting position and a destination separated by space:"
      user_input = gets.chomp.split(" ").map(&:to_i)
      place(pick(user_input[0]), user_input[1])
    end
    puts "You won!"
  end

  def render
    @grid.each {|row| p row}
  end

end

# toh = Board.new
# toh.play