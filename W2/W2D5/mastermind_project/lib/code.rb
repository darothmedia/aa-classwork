class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(arr)
    arr.all? {|el| POSSIBLE_PEGS.has_key?(el.upcase)}
  end

  attr_reader :pegs, :exacts

  def initialize(arr)
    @pegs = []
    if Code.valid_pegs?(arr)
      arr.each {|char| @pegs << char.upcase}
    else
      raise "Invalid Pegs!"
    end
    @exacts = 0
  end

  def self.random(length)
    secret = []
    while secret.length < length
      secret << POSSIBLE_PEGS.keys.sample
    end
    Code.new(secret)
  end

  def self.from_string(str)
    arr = str.split("")
    Code.new(arr)
  end

  def [](index)
    @pegs[index]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(code)
    count = 0
    code.pegs.each.with_index do |peg, i|
      if peg == @pegs[i]
        count += 1
      end
    end
    @exacts += count
    count
  end

  def num_near_matches(code)
    hash = Hash.new(0)
    @pegs.each { |peg| hash[peg] += 1 }
    matches = Hash.new(0)
    code.pegs.each.with_index do |peg, i|
      if matches[peg] < hash[peg]
        matches[peg] += 1 if @pegs.include?(peg)
      end
    end
    return matches.values.sum - num_exact_matches(code)
  end


  # #["R", "G", "R", "B"]
  # hash = R=>2, G=>1, B=>1
  # #["R", "G", "B", "B"]
  # hash= R=>1, G=>1, B=>1


  # Pegs = GBYB
  #       hash = {G => 2, Y => 1, B => 1}
  # Code = RBGG
  #       matches = {B => 1, G => 2}
  # code.each:
  #     R = miss
  #       no input to hash
  #     B = near match
  #        B => 1
  #     G = near match
  #        G => 1
  #     G = near match
  #        G => 2
  # 

  def ==(code)
    self.pegs == code.pegs
  end


end
