require_relative "board"

class HumanPlayer
  
  attr_reader :mark

  def initialize(mark)
    @mark = mark
  end

  def get_position
    puts 'Enter a valid position'
    input = gets.chomp.split(" ")
    arr = []
    input.each {|el| arr << el.to_i}
    arr
  end

end