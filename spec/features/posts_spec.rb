require 'rails_helper'

describe 'Posts displays correctly', :type => :feature do

  before(:each) do
    visit posts_path
  end

  it 'checks for breadcrumbs', :js => true do
    expect(page).to have_css('ul.breadcrumbs')
  end

  it 'checks for titles', :js => true do
    expect(page).to have_css('h1.and-yet-not-the-largest')
    expect(page).to have_css('h2.and-yet-so-very-large')
  end

  it 'ensures the about is the main content', :js=> true do
    expect(page).to have_text('Posts')
  end

end