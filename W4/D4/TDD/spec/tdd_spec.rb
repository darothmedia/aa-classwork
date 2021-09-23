require "tdd"

describe "#my_uniq" do

  subject(:array) { [1,2,1,3,3] }

  it "removes duplicates" do
    expect(array.my_uniq.count(1)).to be < 2
    expect(array.my_uniq.count(2)).to be < 2
    expect(array.my_uniq.count(3)).to be < 2    
  end

  it "return a new array" do
    expect(array.my_uniq).to_not be(array)
  end

end

describe "Array#two_sum" do

  subject(:array) { [-1,0,2,-2,1] }

  it "returns an array" do
    expect(array.two_sum).to be_an(Array)
  end

  it "contains elements that sum to zero" do
    expect(array.two_sum.all? {|arr| array[arr[0]] + array[arr[1]] == 0} ).to be(true)
  end

  it "does not contain duplicates" do
    expect(array.two_sum.my_uniq).to eq(array.two_sum)
  end

  it "contains pairs sorted dictionary-wise" do
    expect(array.two_sum[0]).to eq([0,4])
    expect(array.two_sum[0][0]).to be < array.two_sum[1][0]
  end
end

describe "#my_transpose" do
  
  it "should transpose a square matrix" do
    rows = [[0, 1, 2], [3, 4, 5], [6, 7, 8]]
    cols = [[0, 3, 6], [1, 4, 7], [2, 5, 8]]
    expect(rows.my_transpose).to eq(cols)
  end

  it "raises error if array is not a square matrix" do
    rows = [[0, 1, 2], [3, 4, 5]]
    cols = [[0, 3], [1, 4], [2, 5]]
    expect(rows.my_transpose).to_not eq(cols)
  end
end

describe "#stock_picker" do

  subject(:stock_prices) { [1, 4, 245, 66, 13, 7779] }

  it "should return an array containing the lowest price day at index 0" do
    # result = [stock_prices.index(stock_prices.max), stock_prices.index(stock.prices.min)]
    expect(stock_prices.stock_picker[0]).to eq(0)
  end

  it "should return an array containing the highest price day at index 1" do
    # result = [stock_prices.index(stock_prices.max), stock_prices.index(stock.prices.min)]
    expect(stock_prices.stock_picker[1]).to eq(5)
  end

end