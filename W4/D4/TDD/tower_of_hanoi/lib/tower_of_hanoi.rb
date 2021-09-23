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

  def pick(pile)
    raise "Empty pile" if self[pile].empty?
    self[pile].pop
  end

end