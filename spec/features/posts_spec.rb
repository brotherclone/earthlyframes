describe 'Posts display correctly', :type => :feature do

  it 'checks the posts index page', :js => true  do
    visit posts_path
    expect(page).to have_css('h1')
    expect(page).to have_content('Posts')
  end

  it 'checks for a breadcrumb', :js => true do
    visit about_path
    expect(page).to have_css('ul.breadcrumbs')
  end

end
