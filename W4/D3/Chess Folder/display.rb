require_relative "board"
require_relative "cursor"

class Display
  attr_reader :cursor_pos, :board
  def initialize
    @board = Array.new(3) {Array.new(3, "a")}
    @cursor_pos = Cursor.new([0,0], @board)
  end
end