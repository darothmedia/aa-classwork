require 'spec_helper'
require 'rails_helper'

feature 'the signup process', type: :feature do



  scenario 'has a new user page' do
    # expect(new_user_url).to have_content('GOOOOOOAL')
    expect(new_user_url).to have_button('CREATE USER')
  end

  feature 'signing up a user' do

    scenario 'shows username on the homepage after signup'

  end
end

feature 'logging in' do
  scenario 'shows username on the homepage after login'

end

feature 'logging out' do
  scenario 'begins with a logged out state'

  scenario 'doesn\'t show username on the homepage after logout'

end