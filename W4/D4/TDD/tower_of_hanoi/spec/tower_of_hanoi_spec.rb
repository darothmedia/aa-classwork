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

  describe "#[]" do
    it "returns the pile of the grid at index given" do
      expect(board[0]).to eq(board.grid[0])
    end

    it "raises an error if index given is invalid" do
      expect{board[4]}.to raise_error(RuntimeError, 'Invalid pile')
    end
  end

  describe "#pick" do
    # it "should take in a pile as an argument" do
    #   expect(board.pick).to receive(Integer)
    # end

    it "returns the top disc of the pile picked" do
      expect(board.pick(0)).to be(1)
    end

    it "raises an error if the pile picked is empty" do
      expect{board.pick(1)}.to raise_error(RuntimeError, 'Empty pile')
    end

    it "removes the top disc of the pile picked" do
      board.pick(0)
      expect(board[0]).to eq([4,3,2])
    end
  end

  describe "#place" do

    it "places the result of #pick on a new pile" do
      board.place(1,2)
      expect(board[2]).to eq([1])
    end

    it "places the element at the top of the pile" do
      board.place(1,2)
      board.place(2,2)
      expect(board[2]).to eq([1,2])
    end
  end

  describe "#win?" do

    it "returns true if the elements have been positioned correctly" do
      board[2] = [4,3,2,1]
      board[0] = []
      board[1] = []
      expect(board.win?).to be(true)
    end

    it "returns false if elements have not been positioned correctly" do
      board[2] = [3,2,1]
      board[0] = [4]
      board[1] = []
      expect(board.win?).to be(false)
    end

  end



end