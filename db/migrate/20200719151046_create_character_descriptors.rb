class CreateCharacterDescriptors < ActiveRecord::Migration[5.2]

  def self.up
    create_table :character_descriptors do |t|
      t.string :descriptor
      t.timestamps
    end
  end

  def self.down
    drop_table :character_descriptors
  end

end
