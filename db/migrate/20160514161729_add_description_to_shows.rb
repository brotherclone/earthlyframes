class AddDescriptionToShows < ActiveRecord::Migration
  def change
    add_column :posts, :brief_description, :string
  end
end
