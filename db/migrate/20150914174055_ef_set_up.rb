class EfSetUp < ActiveRecord::Migration
  def change
    add_reference :songs, :album, index: true
    add_column :songs, :title, :string
    add_column :songs, :sequence, :integer
    add_column :songs, :notes, :text
    add_column :songs, :lyrics, :text

    add_column :images, :imageable_id, :integer
    add_column :images, :imageable_type, :string
    add_index :images, :imageable_id
    add_column :images, :img, :string

    add_column :albums, :title, :string
    add_column :albums, :release, :date
    add_column :albums, :type, :string
    add_column :albums, :description, :text

    add_column :posts, :title, :string
    add_column :posts, :post, :text
    add_column :posts, :published, :datetime

  end
end


