require "byebug"

require_relative "card"
require_relative "board"
require_relative "human_player"
require_relative "computer_player"

class Game
  def initialize(size)
    @board = Board.new(size)
    @prev_guess = ""
    @guess_count = 0
    @human = HumanPlayer.new("human")
    @current_player = @human
    @computer = ComputerPlayer.new(@board)
  end

  def switch_player
    if @current_player == @human
      @current_player = @computer
    else
      @current_player = @human
    end
  end

  def play
    @board.populate
    until over
      p "#{@guess_count} guesses made"
      @board.render
      pos = @current_player.get_first_input
      puts pos
      val_1 = @board.reveal(pos)
      @board.render
      pos_2 = @current_player.get_second_input
      puts pos_2
      val_2 = @board.reveal(pos_2)
      @board.render
      if @board[pos] != @board[pos_2]
        @board[pos].hide
        @board[pos_2].hide
        p "Not a match"
        @computer.add_memory(pos, val_1)
        @computer.add_memory(pos_2, val_2)
      else
        p "It's a match!"
        @computer.remove_memory(pos, val_1)
        @computer.remove_memory(pos, val_2)
      end
      switch_player
      @guess_count += 1
    end
    p "You win!"
  end

  def over
    @board.won?
  end
end