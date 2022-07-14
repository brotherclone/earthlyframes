class CreateConstellations < ActiveRecord::Migration[7.0]
  def self.up
    create_table :constellations do |t|
      t.string :name
      t.text :description
      t.timestamps
    end
  end
  def self.down
    drop_table :constellations
  end
end
