
class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    hashed = 0 
    
    self.each_with_index do |ele, idx|
      if !ele.is_a?(Integer) 
        hashed += ele.hash + idx.hash
      else
        hashed += (ele + idx).hash
      end
    end

    hashed 
  end
end

class String
  def hash
    hashed = 0 
    alphabet = ('a'..'z').to_a 

    self.each_char.with_index do |char, idx|
      hashed += (alphabet.index(char.downcase) + idx).hash 
    end

    hashed 
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    hashed = 0
    alphabet = ('a'..'z').to_a 

    self.each do |k, v|
      hashed += (k.hash + v.hash)
    end

    hashed 
  end
end
