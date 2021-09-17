class HumanPlayer
  def initialize(name)
    @name = name
  end

  def prompt
    p "It's #{@name}'s turn. Enter a position separated by a comma like this '1,2': "
  end

  def get_first_input
    prompt
    gets.chomp.split(",").map(&:to_i)
  end

  def get_second_input
    p "Enter a second position:"
    gets.chomp.split(",").map(&:to_i)
  end
end
