require 'rails_helper'

describe 'Albums display correctly', :type => :feature do

  it 'checks the albums index page', :js => true  do
    visit albums_path
    expect(page).to have_content('Albums')
    expect(page).to have_css('div.albums')
  end

end
