class Deck
  VALID_VALUES = [2,3,4,5,6,7,8,9,10,:J,:Q,:K,:A]
  VALID_SUITS = [:hearts, :diamonds, :spades, :clubs]

  attr_reader :stack

  def initialize
    @stack = []
    VALID_SUITS.each do |suit|
      VALID_VALUES.each do |value|
        @stack << Card.new(value, suit)
      end
    end
  end


end