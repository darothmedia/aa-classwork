class Player
  def get_move
    p "enter a position with coordinates separated with a space like `4 7`"
    input = gets.chomp.split(" ")
    arr = []
    input.each {|el| arr << el.to_i}
    arr
  end
end
