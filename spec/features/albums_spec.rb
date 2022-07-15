require 'rails_helper'

describe 'Albums displays correctly', :type => :feature do

  before(:each) do
    visit albums_path
  end

  it 'checks for breadcrumbs', :js => true do
    expect(page).to have_css('ul.breadcrumbs')
  end

  it 'checks for page heading', :js => true do
    expect(page).to have_css('div.page-heading')
  end

end