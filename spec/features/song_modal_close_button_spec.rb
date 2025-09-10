require 'rails_helper'

describe 'Song Modal Close Button', :type => :feature do
  let!(:album) { FactoryBot.create(:album) }
  let!(:song) { FactoryBot.create(:song, album: album) }

  before(:each) do
    visit album_path(album)
  end

  it 'displays the close button with correct icon', :js => true do
    # Click on a song to open the modal
    click_link song.title

    # Wait for the turbo frame to load
    expect(page).to have_css('turbo-frame#songs')

    # Check that the close button is present with correct classes
    within 'turbo-frame#songs' do
      expect(page).to have_css('.close-song-info')
      expect(page).to have_css('a[href*="songs"]')
      expect(page).to have_css('i.fa-solid.fa-x[title="close"]')
    end
  end

  it 'closes the song modal when clicked', :js => true do
    # Click on a song to open the modal
    click_link song.title

    # Wait for the modal to open and verify song content is visible
    expect(page).to have_css('turbo-frame#songs')

    # Store the song title for verification
    song_title = song.title
    expect(page).to have_content(song_title)

    # Click the close button
    within 'turbo-frame#songs' do
      find('.close-song-info a').click
    end

    # Wait for navigation - the close button should navigate away from the song
    sleep(1.0)

    # Verify we're back at the album page and the song modal is closed
    # The specific song content should no longer be the main focus
    expect(page).to have_current_path(album_path(album))
  end

  it 'close button has proper accessibility attributes', :js => true do
    # Click on a song to open the modal
    click_link song.title

    # Check accessibility attributes
    within 'turbo-frame#songs' do
      close_icon = find('i.fa-solid.fa-x')
      expect(close_icon[:title]).to eq('close')
    end
  end

end
