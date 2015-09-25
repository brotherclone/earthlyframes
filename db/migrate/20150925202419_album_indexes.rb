class AlbumIndexes < ActiveRecord::Migration
  def change
    add_reference :albums, :albumtypes, index: true
    add_reference :albums, :albumformats, index: true
  end
end
