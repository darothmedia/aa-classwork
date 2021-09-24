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

  describe "#deal" do
    let(:player) {double("player")}
    it "hands out one card to a player" do
      deck.deal(player)
      expect(deck.stack.length).to eq(51)
    end

    it "player receives the card" do
      deck.deal(player)
    end

  end


end