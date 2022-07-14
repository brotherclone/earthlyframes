require 'rails_helper'

describe 'EULA displays correctly', :type => :feature do

  before(:each) do
    visit eula_path
  end

  it 'checks for navigation', :js => true do
    expect(page).to have_css('nav')
  end

  it 'checks for breadcrumbs', :js => true do
    expect(page).to have_css('ul.breadcrumbs')
  end

  it 'checks for a footer', :js => true do
    expect(page).to have_css('footer')
  end

  it 'checks for an article', :js => true do
    expect(page).to have_css('article.eula')
  end

  it 'checks for a title', :js => true do
    expect(page).to have_text('Web Site Terms and Conditions of Use')
  end

end