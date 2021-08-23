class AddDescriptionMistake <ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :brief_description, :string
    add_column :shows, :brief_description, :string
  end
end
