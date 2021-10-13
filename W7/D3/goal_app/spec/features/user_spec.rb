require 'spec_helper'
require 'rails_helper'

feature 'the signup process', type: :feature do

  background :each do
      visit new_user_url
  end

  scenario 'has a new user page' do
    # expect(new_user_url).to have_content('GOOOOOOAL')
    expect(page).to have_button("CREATE USER")
  end

  feature 'signing up a user' do
  
    background :each do
      fill_in('username', with: 'sam_i_am')
      fill_in('password', with: 'password')

      click_button('CREATE USER')
    end

    scenario "can create a new user" do # this is like an "it" block

      expect(current_path).to eq(user_path(User.last.id))
      expect(page).to have_button('Log Out!')
    end

    scenario 'shows username on the homepage after signup' do

      expect(page).to have_content('Hello, sam_i_am')
    end
  end

  
end

feature 'logging in' do

  background :each do
    create(:user)
  end

  scenario 'shows username on the homepage after login' do
    login_user(User.last)
    expect(page).to have_content(User.last.username)
  end

end

feature 'logging out' do
  scenario 'begins with a logged out state'

  scenario 'doesn\'t show username on the homepage after logout'

end