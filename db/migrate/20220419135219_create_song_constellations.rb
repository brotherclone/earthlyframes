class CreateSongConstellations < ActiveRecord::Migration[7.0]
  def self.up
    create_table :song_constellations do |t|
      t.belongs_to :song
      t.belongs_to :constellation
      t.integer :sequence_number
      t.timestamps
    end
  end
  def self.down
    drop_table :song_constellations
  end
end
