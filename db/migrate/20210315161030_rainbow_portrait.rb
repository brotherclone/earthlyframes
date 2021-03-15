class RainbowPortrait < ActiveRecord::Migration[5.2]

  def self.up
    add_column :albums, :rainbow_portrait, :string, :null => true
  end

  def self.down
    remove_column :albums, :rainbow_portrait
  end

end
