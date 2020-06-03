class AddDescriptionToShows < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :brief_description, :string
  end
end
