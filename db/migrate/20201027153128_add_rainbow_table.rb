class AddRainbowTable < ActiveRecord::Migration[5.2]

  def self.up
    add_column :albums, :rainbow_table, :integer
  end

  def self.down
    remove_column :albums, :rainbow_table
  end

end
