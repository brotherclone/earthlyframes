require 'rails_helper'

describe 'Albums display correctly', :type => :feature do

  it 'checks the albums index page', :js => true  do
    visit albums_path
    expect(page).to have_css('h1')
    expect(page).to have_content('Albums')
  end

  it 'checks for a breadcrumb', :js => true do
    visit about_path
    expect(page).to have_css('ul.breadcrumbs')
  end

end
