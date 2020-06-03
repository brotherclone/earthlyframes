class SongRefCorrection <ActiveRecord::Migration[5.2]
  def change
    remove_reference :songs, :albums
    add_reference :songs, :album, index:true
  end
end
