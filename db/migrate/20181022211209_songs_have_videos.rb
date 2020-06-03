class SongsHaveVideos < ActiveRecord::Migration[5.2]

  def up
    add_reference :videos, :song, index:true
  end

  def down
    remove_reference :videos, :song
  end

end
