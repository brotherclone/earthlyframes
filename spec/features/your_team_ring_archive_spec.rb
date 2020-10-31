require 'rails_helper'

describe 'Your Team Ring Archive correctly', :type => :feature do

  it 'checks the shows index page', :js => true  do
    visit yourteamring_path
    expect(page).to have_css('.your-team-ring')
    expect(page).to have_content('Your Team Ring')
  end

  it 'checks for a breadcrumb', :js => true do
    visit yourteamring_path
    expect(page).to have_css('ul.breadcrumbs')
  end

end
