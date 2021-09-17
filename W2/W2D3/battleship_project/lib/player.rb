class Player
  def get_move
    p "enter a position with coordinates separated with a space like '4 7'"
    input = gets.chomp
    array = []
    input.each_char {|el| array << el.to_i if el != " "}
    array
  end
end
