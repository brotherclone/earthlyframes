require 'rails_helper'

describe 'Coming Soon display correctly', :type => :feature do

  it 'checks the shows index page', :js => true  do
    visit soon_path
    expect(page).to have_content('back shortly')
  end

  it 'checks for a breadcrumb', :js => true do
    visit about_path
    expect(page).to have_css('ul.breadcrumbs')
  end

end
