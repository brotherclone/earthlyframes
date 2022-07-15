require 'rails_helper'

describe 'Posts displays correctly', :type => :feature do

  before(:each) do
    visit posts_path
  end

  it 'checks for breadcrumbs', :js => true do
    expect(page).to have_css('ul.breadcrumbs')
  end

  it 'checks for page heading', :js => true do
    expect(page).to have_css('div.page-heading')
  end

  it 'ensures the about is the main content', :js=> true do
    expect(page).to have_text('Posts')
  end

end