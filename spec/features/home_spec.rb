require 'rails_helper'

describe 'Home displays correctly', :type => :feature do

  before(:each) do
    visit root_path
  end

  it 'checks for no breadcrumbs', :js => true do
    expect(page).not_to have_css('ul.breadcrumbs')
  end

  it 'checks for page heading', :js => true do
    expect(page).to have_css('div.page-heading')
  end

  it 'ensures the rainbow table is the main content', :js=> true do
    expect(page).to have_text('The Rainbow Table')
  end

end