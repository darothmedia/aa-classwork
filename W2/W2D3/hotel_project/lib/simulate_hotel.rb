# No need to change or write any code in this file.
#
# After you complete all specs, you can simulate your hotel by
# running this file with `ruby lib/simulate_hotel.rb` in your terminal!

require_relative "hotel"
require_relative "room"

print "Enter a name for the hotel: "
name = gets.chomp
print "Enter first room name:"
room_1 = gets.chomp
print "Enter second room name:"
room_2 = gets.chomp
print "Enter third room name:"
room_3 = gets.chomp
hotel = Hotel.new("#{name}", "#{room_1}"=> 2, "#{room_2}"=> 2, "#{room_3}"=>1)

puts "\nWelcome to #{hotel.name}!"

while hotel.has_vacancy?
  print "\nEnter a new guest to check in: "
  entered_guest = gets.chomp

  puts "\n---Rooms and Remaining Spaces---"
  hotel.list_rooms
  puts "--------------------------------"

  print "\nEnter a room name to check into: "
  entered_room = gets.chomp
  until hotel.room_exists?(entered_room)
    puts "That room doesn't exist."
    print "Enter another a room name: "
    entered_room = gets.chomp
  end

  hotel.check_in(entered_guest, entered_room)

  puts "\n---Rooms and Current Occupants--"
  hotel.rooms.each { |name, room| puts "#{name} : #{room.occupants}" }
  puts "--------------------------------"
end

puts "\nAll rooms are full! #{hotel.name} is now closed."
