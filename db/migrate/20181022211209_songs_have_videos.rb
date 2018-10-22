class SongsHaveVideos < ActiveRecord::Migration

  def up
    add_reference :videos, :song, index:true
  end

  def down
    remove_reference :videos, :song
  end

end
