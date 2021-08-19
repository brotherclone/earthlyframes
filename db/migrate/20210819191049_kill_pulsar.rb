class KillPulsar < ActiveRecord::Migration[5.2]
  def change
    drop_table :users
    drop_table :characters
    drop_table :character_backgrounds
    drop_table :character_descriptors
    drop_table :character_roles
    drop_table :character_settings
    drop_table :entries
    drop_table :logs
    drop_table :prompts
    drop_table :tags
  end
end
