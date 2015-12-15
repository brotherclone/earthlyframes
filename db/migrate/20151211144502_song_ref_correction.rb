class SongRefCorrection < ActiveRecord::Migration
  def change
    remove_reference :songs, :albums
    add_reference :songs, :album, index:true
  end
end
