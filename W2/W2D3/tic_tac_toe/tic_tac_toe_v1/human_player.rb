require_relative "board"

class HumanPlayer
  attr_reader :mark

  def initialize(mark)
    @mark = mark
  end

  def get_position
    p "It's #{@mark}'s turn. Enter a coordinate as follows: '0 1'"
    pos = []
    input = gets.chomp.split(" ").each do |el|
      pos << el.to_i if el != " "
    end
    pos
  end


end