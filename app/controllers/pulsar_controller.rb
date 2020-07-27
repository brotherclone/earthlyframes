class PulsarController < ApplicationController

  def index

    @no_ef_header = true
    @no_ef_footer = true

    if user_signed_in?
      @user_characters = Character.find_by id: current_user.id
    end

    if params[:log_id]
      @log = Log.find_by id: params[:log_id]
      if @log
        @user_characters_in_log = Character.find_by id: current_user.id, log_id: @log.id
      end
    end



  end

  def create_character

    @no_ef_header = true
    @no_ef_footer = true

    @log = Log.find_by id: params[:log_id]

    @descriptors = CharacterDescriptor.all
    @backgrounds = CharacterBackground.all
    @settings = CharacterSetting.all
    @roles = CharacterRole.all

    if @log
      @log.characters.each do |character|
        @descriptors.delete(character.character_descriptor)
        @backgrounds.delete(character.character_background)
        @settings.delete(character.character_setting)
        @roles.delete(character.character_role)
      end
    end

    gon.descriptors = @descriptors
    gon.backgrounds = @backgrounds
    gon.settings = @settings
    gon.roles = @roles

  end

  def create_entry

    @no_ef_header = true
    @no_ef_footer = true

  end

  def send_log

    @no_ef_header = true
    @no_ef_footer = true

  end

  def so_long

    @no_ef_header = true
    @no_ef_footer = true

  end

end