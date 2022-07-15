require 'rails_helper'

describe 'Streaming Services displays correctly', :type => :feature do

  before(:each) do
    visit streaming_services_path
  end

  it 'checks for breadcrumbs', :js => true do
    expect(page).to have_css('ul.breadcrumbs')
  end

  it 'checks for page heading', :js => true do
    expect(page).to have_css('div.page-heading')
  end

  it 'ensures streaming services is the main content', :js=> true do
    expect(page).to have_text('Streaming Services')
  end

end