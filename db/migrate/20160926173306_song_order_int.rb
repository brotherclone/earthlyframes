class SongOrderInt < ActiveRecord::Migration
  def change
    change_column :songs, :song_order, 'integer USING CAST(song_order AS integer)'
  end
end
