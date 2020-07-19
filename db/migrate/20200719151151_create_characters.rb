class CreateCharacters < ActiveRecord::Migration[5.2]
  def self.up

    create_table :characters do |t|
      t.string :name
      t.string :additional_bio
      t.timestamps
    end

    add_reference :characters, :character_role, index:true
    add_reference :characters, :character_descriptor, index:true
    add_reference :characters, :character_background, index:true
    add_reference :characters, :character_setting, index:true
    add_reference :characters, :user, index:true
  end

  def self.down
    remove_reference :characters, :character_role
    remove_reference :characters, :character_descriptor
    remove_reference :characters, :character_background
    remove_reference :characters, :character_setting
    remove_reference :characters, :user
    drop_table :characters
  end

end
