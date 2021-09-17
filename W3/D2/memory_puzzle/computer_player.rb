class ComputerPlayer
  def initialize(grid)
    @memory = Hash.new {|h,k| h[k] = []}
    @grid = grid
  end

  def add_memory(pos, value)
    @memory[value] << pos
  end

  def remove_memory(pos, value)
    @memory[value] = []
  end

  def valid_move?(pos)
    !@grid[pos].revealed?
  end

  def get_first_input
    @memory.each do |key, value|
      if @memory[key].length >= 2
        return value[0]
      end
    end
    pos = []
    until valid_move?(pos = [rand(0...@grid.size), rand(0...@grid.size)])
    end
    return pos
  end

  def get_second_input
    @memory.each do |key, value|
      if @memory[key].length >= 2
        return value[1]
      end
    end
    pos = [0,1]
    until valid_move?(pos = [rand(0...@grid.size), rand(0...@grid.size)])
    end
    return pos
  end

end