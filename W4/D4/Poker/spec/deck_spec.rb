require "deck"

describe Deck do

  subject(:deck) { Deck.new }

  describe "#initialize" do
    it "creates a stack of 52 cards" do
      expect(deck.stack.length).to eq(52)
    end

    it "contains unique cards" do
      uniques = []
      deck.stack.each {|card| uniques << [card.value, card.suit]}
      expect(uniques.uniq.length).to eq(52)
    end

  end


end