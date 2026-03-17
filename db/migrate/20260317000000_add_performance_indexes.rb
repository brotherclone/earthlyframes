class AddPerformanceIndexes < ActiveRecord::Migration[7.0]
  def change
    add_index :albums, :is_live
    add_index :albums, :rainbow_table
    add_index :albums, [:is_live, :rainbow_table]
    add_index :posts, :is_live
  end
end
