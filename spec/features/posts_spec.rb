describe 'Posts display correctly', :type => :feature do

  it 'checks the posts index page', :js => true  do
    visit posts_path
    expect(page).to have_css('h1.page-header')
    expect(page).to have_content('Posts')
  end

  it 'checks for contrast of the main image title', :js => true do
    post = FactoryBot.create(:post)
    visit post_path(post.id.to_s)
    expect(page).to_not have_css('h1.bright-title')
  end

  it 'checks for contrast of the main image title with a dark background', :js => true do
    post = FactoryBot.create(:post, :dark_bg)
    visit post_path(post.id.to_s)
    expect(page).to have_css('h1.bright-title')
  end

end
