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