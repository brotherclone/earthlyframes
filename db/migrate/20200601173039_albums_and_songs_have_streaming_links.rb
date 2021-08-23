class AlbumsAndSongsHaveStreamingLinks < ActiveRecord::Migration[5.2]

  def up
    add_reference :streaming_links, :song, index:true
    add_reference :streaming_links, :album, index:true
  end

  def down
    remove_reference :streaming_links, :song
    remove_reference :streaming_links, :album
  end

end
