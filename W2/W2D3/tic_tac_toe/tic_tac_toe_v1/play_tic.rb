require_relative "game"

puts "Let's Play Tic Tac Toe! Enter a mark for each player, separated by a space, like this 'a b'"
input = gets.chomp.split(" ")
game = Game.new(input[0], input[1])
puts "-------------------------"
game.play

until game.game_over? do
  puts "-------------------------"
  game.play
end