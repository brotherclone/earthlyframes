class LightDark < ActiveRecord::Migration
  def change
    add_column :posts, :overlay_bright, :boolean
  end
end
