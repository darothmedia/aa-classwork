require_relative "room"

class Hotel
  attr_reader :name, :rooms

  def initialize(name, hash)
    @name = name
    @rooms = Hash.new(0)
    hash.each do |name, cap|
      @rooms[name] = Room.new(cap)
    end
  end

  def name
    cap = []
    arr = @name.split(" ")
    arr.each {|word| cap << word.capitalize}
    return cap.join(" ")
  end

  def room_exists?(room)
    if rooms.has_key?(room)
      return true
    else
      return false
    end
  end

  def check_in(person, room)
    if !room_exists?(room)
      p "sorry, room does not exist"
      return false
    else
      if @rooms[room].add_occupant(person) == true
        p "check in successful"
      else
        p "sorry, room is full"
      end
    end
  end
  
  def has_vacancy?
    rooms.each do |name, room|
      return true if !room.full?
    end
    return false
  end

  def list_rooms
    rooms.each do |name, room|
      puts "#{name} #{room.available_space}"
    end
  end

end

