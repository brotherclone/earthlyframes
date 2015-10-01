class CleanEf < ActiveRecord::Migration
  def change
    drop_table :albums
    drop_table :albumtypes
    drop_table :albumformats
    drop_table :songs
    drop_table :shows
    drop_table :images
    drop_table :posts
  end
end
