require_relative "board"
require_relative "human_player"

class Game
  def initialize(mark1, mark2)
    @player_1 = HumanPlayer.new(mark1)
    @player_2 = HumanPlayer.new(mark2)
    @board = Board.new
    @current_player = @player_1
  end

  def switch_turn
    if @current_player == @player_1
      @current_player = @player_2
    else
      @current_player = @player_1
    end
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