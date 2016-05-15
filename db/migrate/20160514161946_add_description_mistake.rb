class AddDescriptionMistake < ActiveRecord::Migration
  def change
    remove_column :posts, :brief_description, :string
    add_column :shows, :brief_description, :string
  end
end
