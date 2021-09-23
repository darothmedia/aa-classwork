class Card
  VALID_VALUES = [2,3,4,5,6,7,8,9,10,:J,:Q,:K,:A]
  VALID_SUITS = [:hearts, :diamonds, :spades, :clubs]

  attr_reader :value, :suit, :face_down

  def initialize(value, suit)
    @value = value
    @suit = suit
    @face_down = true
  end
end