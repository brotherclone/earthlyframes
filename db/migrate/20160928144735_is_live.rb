class IsLive < ActiveRecord::Migration[5.2]
  def change
    add_column :shows, :is_live, :boolean, :null => false, :default => false
    add_column :albums, :is_live, :boolean, :null => false, :default => false
    add_column :posts, :is_live, :boolean, :null => false, :default => false
  end
end
