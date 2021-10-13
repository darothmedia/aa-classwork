require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:username)}
  it { should validate_presence_of(:password_digest)}
  it { should validate_presence_of(:session_token)}
  it { should validate_length_of(:password).is_at_least(6)}
  it { should have_many(:goals)}

  describe "Uniqueness" do
    before :each do
      create(:user)
    end
    it { should validate_uniqueness_of(:username)}
    it { should validate_uniqueness_of(:session_token)}
  end

  describe "is_valid_password?" do
    let!(:user) { create(:user) }

    context "with a valid password" do
      it "should return true" do
        expect(user.is_valid_password?('password')).to be true
      end
    end

    context "with an invalid password" do
      it "should return false" do
        expect(user.is_valid_password?('capybara')).to be false
      end
    end
  end

  describe "password encryption" do
    it 'does not save passwords to the database' do
      FactoryBot.create(:user, username: 'Harry Potter')
      # FactoryBot.create(:harry_potter) <-- this also works

      user = User.find_by(username: 'Harry Potter')
      expect(user.password).not_to eq('password')
    end

    it 'encrypts password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('abcdef')

      FactoryBot.build(:user, password: 'abcdef')
    end
  end
end