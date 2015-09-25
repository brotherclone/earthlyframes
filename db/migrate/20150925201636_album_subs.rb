class AlbumSubs < ActiveRecord::Migration
  def change
    create_table :albumtypes do |a|
      a.string :name
    end

    create_table :albumformats do |f|
      f.string :name
    end
    remove_column :albums, :album_format
    remove_column :albums, :album_type
  end
end
