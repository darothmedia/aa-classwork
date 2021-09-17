class Passenger
  attr_reader :name
  
  def initialize(name)
    @name = name
    @flight_numbers = []
  end

  def has_flight?(flight_num)
    flight_num.each_char.map {|char| flight_num[char] = char.upcase if !char.is_a? Integer}
    @flight_numbers.include?(flight_num)
  end

  def add_flight(flight_num)
    flight_num.each_char.map {|char| flight_num[char] = char.upcase if !char.is_a? Integer}
    @flight_numbers << flight_num if !has_flight?(flight_num)
  end

end