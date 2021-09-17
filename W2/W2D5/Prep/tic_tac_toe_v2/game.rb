require_relative "board"
require_relative "human_player"

class Game
  def initialize(width, *marks)
    @players = marks.map { |mark| HumanPlayer.new(mark) }
    @board = Board.new(width)
    @current_player = @players.first
  end

  def switch_turn
    @current_player = @players.rotate!.first
  end

  def play
    if @board.empty_positions?
      @board.print
      pos = @current_player.get_position
      @board.place_mark(pos, @current_player.mark)
      if @board.win?(@current_player.mark)
        puts "#{@current_player.mark} won!!!"
      else
        switch_turn
      end
    else
      puts "It's a draw"
    end
  end

end