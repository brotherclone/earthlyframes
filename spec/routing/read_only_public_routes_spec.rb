require "rails_helper"

# The public site is read-only; content is edited through ActiveAdmin.
# Guard against write routes creeping back onto the public controllers.
RSpec.describe "Public read-only routes", type: :routing do
  collections = %w[
    /albums
    /posts
    /music_formats
    /streaming_services
    /constellations
    /constellations/1/song_constellations
    /albums/1/songs
    /albums/1/release_formats
    /albums/1/album_streaming_links
    /albums/1/songs/1/streaming_links
    /albums/1/songs/1/embeds
  ]

  collections.each do |collection|
    describe collection do
      it "does not route create" do
        expect(post: collection).not_to be_routable
      end

      it "does not route update" do
        expect(patch: "#{collection}/1").not_to be_routable
        expect(put: "#{collection}/1").not_to be_routable
      end

      it "does not route destroy" do
        expect(delete: "#{collection}/1").not_to be_routable
      end

      it "does not route new/edit" do
        # /new falls through to #show with id "new", which is fine (404s on lookup)
        expect(get: "#{collection}/1/edit").not_to be_routable
      end
    end
  end
end
