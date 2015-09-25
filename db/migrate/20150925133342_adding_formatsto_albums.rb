class AddingFormatstoAlbums < ActiveRecord::Migration
  def change
    add_column :albums, :album_format, :string
  end
end
