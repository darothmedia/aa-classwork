class Flight
  attr_reader :passengers
  def initialize(flight_num, cap)
    @flight_number = flight_num
    @capacity = cap
    @passengers = []
  end

  def full?
    @passengers.length == @capacity
  end

  def board_passenger(passenger)
    if !full?
      @passengers << passenger if passenger.has_flight?(@flight_number)
    end
  end

  def list_passengers
    arr = []
    @passengers.each {|passenger| arr << passenger.name }
    arr
  end

  def [](index)
    @passengers[index]
  end

  def <<(passenger)
    board_passenger(passenger)
  end
end