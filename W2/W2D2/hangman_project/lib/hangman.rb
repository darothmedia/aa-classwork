class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  attr_accessor :guess_word, :attempted_chars, :remaining_incorrect_guesses

  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length) {|ele| ele = "_"}
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def already_attempted?(char)
    if @attempted_chars.include?(char)
      return true
    else
      return false
    end
  end

  def get_matching_indices(char)
    new_arr = []
    @secret_word.each_char.with_index do |el, i|
      new_arr << i if char == el
    end
    new_arr
  end

  def fill_indices(char, arr)
    arr.each do |i|
      @guess_word[i] = char
    end
  end

  def try_guess(char)
    if already_attempted?(char)
      p "that has already been attempted"
      return false
    else
      @attempted_chars << char
      ind = get_matching_indices(char)
      if ind != []
        fill_indices(char, ind)
      else
        @remaining_incorrect_guesses -= 1
      end
      return true
    end
  end

  def ask_user_for_guess
    p "Enter a char:"
    char = gets.chomp
    return try_guess(char)
  end

  def win?
    if @guess_word.join("") == @secret_word
      p "WIN"
      return true
    else
      return false
    end
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      p "LOSE"
      return true
    else
      return false
    end
  end

  def game_over?
    if win? || lose?
      p @secret_word
      return true
    else
      return false
    end

  end





end
