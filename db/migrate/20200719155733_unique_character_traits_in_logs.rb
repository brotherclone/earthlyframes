class UniqueCharacterTraitsInLogs < ActiveRecord::Migration[5.2]

  def self.up
    add_reference :character_roles, :log, index:true
    add_reference :character_descriptors, :log, index:true

  end

  def self.down
    remove_reference :character_roles, :log
    remove_reference :character_descriptors, :log

  end

end
