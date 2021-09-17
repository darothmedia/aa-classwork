class Tile
  attr_reader :value
  
  def initialize(value)
    @given_var = value == 0 ? false : true
    @value = value
  end

  def =(value)
    if !@given_var
      @value = value
    else
      raise "Invalid move"
    end
  end
end