require "tower_of_hanoi"

describe Board do
  subject(:board) { Board.new }

  describe "#initialize" do
    it "create a new board of size 3" do
      expect(board.grid.length).to eq(3)
    end

    it "places four pieces in position zero" do
      expect(board.grid[0].length).to eq(4)
    end

    it "keeps positions 1 and 2 empty" do
      expect(board.grid[1].length).to eq(0)
      expect(board.grid[2].length).to eq(0)
    end

    it "places pieces in descending order" do
      expect(board.grid[0]).to eq([4,3,2,1])
    end
  end

end