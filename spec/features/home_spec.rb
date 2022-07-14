require 'rails_helper'

describe 'Home displays correctly', :type => :feature do

  before(:each) do
    visit root_path
  end

  it 'checks for no breadcrumbs', :js => true do
    expect(page).not_to have_css('ul.breadcrumbs')
  end

  it 'checks for titles', :js => true do
    expect(page).to have_css('h1.and-yet-not-the-largest')
    expect(page).to have_css('h2.and-yet-so-very-large')
  end

  it 'ensures the rainbow table is the main content', :js=> true do
    expect(page).to have_text('The Rainbow Table')
  end

end