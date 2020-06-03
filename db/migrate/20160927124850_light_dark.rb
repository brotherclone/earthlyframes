class LightDark < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :overlay_bright, :boolean
  end
end
