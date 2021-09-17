require_relative "card"

class Board
  attr_reader :size
  
  def initialize(size)
    raise "Invalid size: must be even (#{size})" if size % 2 != 0
    @board = Array.new(size) { Array.new(size) }
    @size = size
  end

  def create_pairs
    new_arr = []
    card_value = (:A..:Z).to_a.sample
    2.times { new_arr << Card.new(card_value) }
    new_arr
  end

  def populate
    ((@size * @size) / 2).times do
      pair = create_pairs
      while pair.length > 0
        row = rand(0...@size)
        col = rand(0...@size)
        if !@board[row][col]
          @board[row][col] = pair.pop
        end
      end
    end
  end

  def render
    @board.each do |board_row|
      row = []
      board_row.each {|ele| row << ele.display_info}
      puts row.join(" ")
    end
    true
  end

  def won?
    @board.each do |board_row|
      return false if board_row.any?{|el| el.display_info == "_"}
    end
    return true
  end

  def reveal(pos)
    if !self[pos].revealed?
      self[pos].reveal
      self[pos].face_value
    end
  end

  def [](index)
    @board[index[0]][index[1]]
  end
end