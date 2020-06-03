class AddDescriptionAlbums < ActiveRecord::Migration[5.2]
  def change
    add_column :albums, :brief_description, :string
  end
end
