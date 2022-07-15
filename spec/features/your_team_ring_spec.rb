require 'rails_helper'

describe 'Your Team Ring displays correctly', :type => :feature do

  before(:each) do
    visit your_team_ring_path
  end

  it 'checks for breadcrumbs', :js => true do
    expect(page).to have_css('ul.breadcrumbs')
  end

  it 'checks for page heading', :js => true do
    expect(page).to have_css('div.page-heading')
  end

  it 'ensures your team ring is the main content', :js=> true do
    expect(page).to have_text('Your Team Ring')
  end

end