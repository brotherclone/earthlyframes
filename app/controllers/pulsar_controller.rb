class PulsarController < ApplicationController

  def index

    @no_ef_header = true
    @no_ef_footer = true

    if user_signed_in?
      @user_characters = Character.find_by id: current_user.id
      unless @user_characters.kind_of?(Array)
        @user_characters = [@user_characters]
      end
    end

    if params[:log_id]
      @log = Log.find_by id: params[:log_id]
      if @log
        @user_characters_in_log = Character.find_by id: current_user.id, log_id: @log.id
        unless  @user_characters_in_log .kind_of?(Array)
          @user_characters_in_log  = [ @user_characters_in_log ]
        end
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

    @descriptor = @descriptors.sample
    @background = @backgrounds.sample
    @setting = @settings.sample
    @role = @roles.sample

    if %w[a e i o u A E I O U].include? @descriptor[0]
      @article = 'an'
    else
      @article = 'a'
    end

  end

  def create_entry

    @no_ef_header = true
    @no_ef_footer = true

    @current_character = Character.find_by id: params[:character_id]

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