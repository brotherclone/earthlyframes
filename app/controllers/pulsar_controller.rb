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

    unless @current_character.entries
      @prompt = Prompt.where(encounter_type = '0')
    end

    case @current_character.health

    when 4
      puts "full health - do start"
    when 3
      puts "1 damage - do any normal"
    when 2
      puts "2 damage do penultimate"
    when 1
      puts "3 damage do final"
    when 0
      puts "dead show last"
    else
      puts "something wrong"
    end

    @entry = Entry.create( :prompt_id => @prompt.id, :character_id => @current_character.id )

  end

end