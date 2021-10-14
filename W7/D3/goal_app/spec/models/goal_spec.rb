require 'rails_helper'

RSpec.describe Goal, type: :model do
  it { should validate_presence_of(:title)}
  it { should validate_presence_of(:body)}
  it { should validate_presence_of(:user_id)}
  it { should belong_to(:user)}

  describe "#$^%*" do
    before :each do
      create(:goal)
    end

    it "shouldn't contain profanity" do
      expect(goal.body).not_to include("darnit", "gosh", "golly")
    end
  end
end