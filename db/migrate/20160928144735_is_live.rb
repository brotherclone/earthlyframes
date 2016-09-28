class IsLive < ActiveRecord::Migration
  def change
    add_column :shows, :is_live, :boolean, :null => false, :default => false
    add_column :albums, :is_live, :boolean, :null => false, :default => false
    add_column :posts, :is_live, :boolean, :null => false, :default => false
  end
end
