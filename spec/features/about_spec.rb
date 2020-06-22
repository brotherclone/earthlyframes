Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

describe 'About display correctly', :type => :feature do

  it 'checks for a breadcrumb', :js => true do
    visit about_path
    expect(page).to have_css('ul.breadcrumbs')
  end

  it 'checks the about index page', :js => true  do
    visit about_path
    expect(page).to have_content('About')
  end

end
