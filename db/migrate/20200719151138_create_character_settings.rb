class CreateCharacterSettings < ActiveRecord::Migration[5.2]
  def self.up
    create_table :character_settings do |t|
      t.string :time
      t.string :place
      t.timestamps
    end
  end

  def self.down
    drop_table :character_settings
  end

end
