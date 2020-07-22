class CreateCharacterBackgrounds < ActiveRecord::Migration[5.2]
  def self.up
    create_table :character_backgrounds do |t|
      t.string :background
      t.timestamps
    end
  end

  def self.down
    drop_table :character_backgrounds
  end

end
