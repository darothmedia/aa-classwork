require_relative "board"
require_relative "human_player"

class Game
  attr_reader :pos, :mark
  def initialize(mark1, mark2)
    @player_1 = HumanPlayer.new(mark1)
    @player_2 = HumanPlayer.new(mark2)
    @current_player = @player_1
    @board = Board.new
    @pos = pos
    @mark = mark
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
      puts "\n"
      puts "-------------------------"
      @pos = @current_player.get_position
      @mark = @current_player.mark
      @board.place_mark(pos, mark)
      if @board.win?(mark)
        p "YEAH BUDDY, #{mark} won"
        puts "-------------------------"
        @board.print
      else
        self.switch_turn
      end
    else
      p "draw"
    end
  end

  def game_over?
    if @board.win?(mark)
      return true
    else
      return false
    end
  end


end