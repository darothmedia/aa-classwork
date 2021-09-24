require "card"

describe Card do
  subject(:card) {Card.new(10, :hearts)}
  describe "#initialize" do
    it "has a value" do
      expect(card.value).to_not be(nil)
    end

    it "has a valid value" do
      VALID_VALUES = [2,3,4,5,6,7,8,9,10,:J,:Q,:K,:A]
      expect(VALID_VALUES.include?(card.value)).to be(true)
    end

    it "has a valid suit" do
      VALID_SUITS = [:hearts, :diamonds, :spades, :clubs]
      expect(VALID_SUITS.include?(card.suit)).to be(true)
    end

    it "has a face down variable default to true" do
      expect(card.face_down).to be(true)
    end
  end

  describe "#flip" do
    it "changes the face_down value to false if true" do
      card.flip
      expect(card.face_down).to eq(false)
    end

    it "changes the face_down value to true if false" do
      card.flip
      card.flip
      expect(card.face_down).to eq(true)
    end
  end

end