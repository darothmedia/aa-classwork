class Dog
  
  attr_reader :name, :breed, :favorite_foods
  attr_accessor :age
  
  def initialize(name, breed, age, bark, favorite_foods)
    @name = name
    @breed = breed
    @age = age
    @bark = bark
    @favorite_foods = favorite_foods
  end

  def bark
    return @bark.upcase if @age > 3
    return @bark.downcase if @age <= 3
  end

  def favorite_food?(food)
    @favorite_foods.include?(food.capitalize)
  end


end
