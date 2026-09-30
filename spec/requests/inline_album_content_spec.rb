require 'rails_helper'

# Album streaming links and song lists used to be lazy-loaded with one
# <turbo-frame src=...> request per link / per album. They now render inline
# from preloaded associations; these specs pin that down.
RSpec.describe 'Inline album content', type: :request do
  def create_album_with_content(links: 2, songs: 2)
    album = FactoryBot.create(:album)
    links.times { FactoryBot.create(:album_streaming_link, album: album) }
    songs.times do |i|
      song = FactoryBot.create(:song, album: album, song_order: i)
      FactoryBot.create(:streaming_link, song: song)
    end
    album
  end

  def sql_queries_during
    count = 0
    counter = lambda do |_name, _start, _finish, _id, payload|
      count += 1 unless payload[:name].in?(%w[SCHEMA TRANSACTION]) || payload[:cached]
    end
    ActiveSupport::Notifications.subscribed(counter, 'sql.active_record') { yield }
    count
  end

  shared_examples 'renders album content inline' do
    it 'renders streaming links inline instead of lazy frames' do
      get path
      album.album_streaming_links.each do |link|
        expect(response.body).to include(%(href="#{link.link}"))
      end
      expect(response.body).not_to include('album_streaming_links/')
      expect(response.body).not_to match(/<turbo-frame[^>]+src=/)
    end

    it 'renders song titles inside a frame unique to the album' do
      get path
      frame_id = ActionView::RecordIdentifier.dom_id(album, :songs)
      expect(response.body).to include(%(id="#{frame_id}"))
      album.songs.each { |song| expect(response.body).to include(song.title) }
    end
  end

  describe 'GET /' do
    let!(:album) { create_album_with_content }
    let(:path) { root_path }

    include_examples 'renders album content inline'

    it 'does not issue more queries as albums are added' do
      get root_path # warm up
      baseline = sql_queries_during { get root_path }
      2.times { create_album_with_content(links: 3, songs: 3) }
      expect(sql_queries_during { get root_path }).to eq(baseline)
    end
  end

  describe 'GET /albums' do
    let!(:album) { create_album_with_content }
    let(:path) { albums_path }

    include_examples 'renders album content inline'
  end

  describe 'GET /albums/:id' do
    let!(:album) { create_album_with_content }
    let(:path) { album_path(album) }

    include_examples 'renders album content inline'

    it 'returns fresh content after a song is added (ETag busts via touch)' do
      get path
      etag = response.headers['ETag']
      FactoryBot.create(:song, album: album, title: 'Brand New Song')
      get path, headers: { 'If-None-Match' => etag }
      expect(response).to have_http_status(:ok)
      expect(response.body).to include('Brand New Song')
    end
  end

  describe 'GET /albums/:album_id/songs/:id' do
    it 'renders the song streaming links inline in the album songs frame' do
      album = create_album_with_content(links: 0, songs: 1)
      song = album.songs.first
      get album_song_path(album, song)
      expect(response.body).to include(%(id="#{ActionView::RecordIdentifier.dom_id(album, :songs)}"))
      song.streaming_links.each { |link| expect(response.body).to include(%(href="#{link.link}")) }
      expect(response.body).not_to match(/<turbo-frame[^>]+src=/)
    end
  end
end
