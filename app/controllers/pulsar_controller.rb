class PulsarController < ApplicationController
  def index
    @no_ef_header = true
    @no_ef_footer = true
  end

  def create_character
    @no_ef_header = true
    @no_ef_footer = true

    character_background_offset = rand(CharacterBackground.count)
    @character_background = CharacterBackground.offset(character_background_offset).first

    character_descriptor_offset = rand(CharacterDescriptor.count)
    @character_descriptor = CharacterDescriptor.offset(character_descriptor_offset).first

    character_role_offset = rand(CharacterRole.count)
    @character_role = CharacterRole.offset(character_role_offset).first

    character_setting_offset = rand(CharacterSetting.count)
    @character_setting = CharacterSetting.offset(character_setting_offset).first
  end

  def create_entry
    @no_ef_header = true
    @no_ef_footer = true
    @current_character = Character.find(params[:character_id])
  end

end
