class AddImagesToCharacterFeatures < ActiveRecord::Migration[5.2]

  def self.up

    add_column :character_descriptors, :image_url, :string
    add_column :character_roles, :image_url, :string
    add_column :character_settings, :image_url, :string

  end

  def self.down

    remove_column :character_descriptors, :image_url
    remove_column :character_roles, :image_url
    remove_column :character_settings, :image_url

  end

end
