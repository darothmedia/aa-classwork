class Card
  
  attr_reader :face_value
  
  def initialize(face_value)
    @face_value = face_value
    @face_up = false
    @face_down = true
  end

  def hide
    @face_up = false
    @face_down = true
  end

  def reveal
    @face_up = true
    @face_down = false
  end

  def revealed?
    @face_up
  end

  def to_s
    @face_value.to_s
  end

  def ==(card)
    @face_value == card.face_value
  end

  def display_info
    @face_up ? to_s : "_"
  end
end