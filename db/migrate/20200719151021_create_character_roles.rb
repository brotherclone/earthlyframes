class CreateCharacterRoles < ActiveRecord::Migration[5.2]
  def self.up
    create_table :character_roles do |t|
      t.string :character_role
      t.timestamps
    end
  end

  def self.down
    drop_table :character_roles
  end

end
