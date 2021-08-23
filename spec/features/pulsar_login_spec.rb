require 'rails_helper'


describe 'Checks the log in functionality for Pulsar Palace', :type => :feature do

  it 'registers a user with a character', :js => true do
    user = FactoryBot.create(:user_with_character)
    visit new_user_registration_path
    login_as(user, :scope=> :user)
    visit pulsar_path
    expect(page).to have_text(user.characters[0].name)
    Warden.test_reset!
  end



end
