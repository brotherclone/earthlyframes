class BigRefactor < ActiveRecord::Migration
  def change
      add_column :songs, :song_order, :string
      drop_table :images
      add_column :albums, :cover, :string
      remove_column :albums, :releasedate
      add_column :releases, :relasedate, :date
      add_column :releases, :product_image, :string
      add_column :posts, :main_image, :string
      add_column :posts, :inline_image, :string
  end
end
