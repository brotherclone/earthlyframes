class AddDescriptionAlbums < ActiveRecord::Migration
  def change
    add_column :albums, :brief_description, :string
  end
end
