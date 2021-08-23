require 'rails_helper'

describe 'Rainbow Table display correctly', :type => :feature do

  it 'checks the shows index page', :js => true  do
    visit rainbow_path
    expect(page).to have_css('.rainbow-cards')
    expect(page).to have_content('The Rainbow Table')
  end

  it 'checks for a breadcrumb', :js => true do
    visit rainbow_path
    expect(page).to have_css('ul.breadcrumbs')
  end

end
