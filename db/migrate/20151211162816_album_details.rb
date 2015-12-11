class AlbumDetails < ActiveRecord::Migration
  def change
    add_column :albums, :price, :float
    add_column :albums, :released, :date
    add_column :albums, :buylink, :string
    add_column :albums, :format, :text
  end
end
