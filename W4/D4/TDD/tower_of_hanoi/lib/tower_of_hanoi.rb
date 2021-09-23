class Board

  attr_reader :grid

  def initialize
    @grid = Array.new(3) {[]}
    @grid[0] += [4,3,2,1]
  end

end