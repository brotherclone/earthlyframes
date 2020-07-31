class PulsarController < ApplicationController

  def index

    @no_ef_header = true
    @no_ef_footer = true

    if user_signed_in?
      @user_characters = Character.where({:user_id=> current_user.id})
    end

    if params[:log_id]
      @log = Log.find_by id: params[:log_id]
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
    else
      log_title = "The Pulsar Palace"
      @new_log = Log.create(title: log_title)
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

    case @current_character.current_health
    when 4
      @prompt = Prompt.where(encounter_type: 1).take
    when 1
      @prompt = Prompt.where(encounter_type: 2).take
    when 0
      @prompt = Prompt.where(encounter_type: 3).take
    else
      prompts = Prompt.where(encounter_type: 0)
      @prompt = prompts.sample
    end

  end



  def send_log

    @no_ef_header = true
    @no_ef_footer = true

    @current_character = Character.find_by id: params[:character_id]


  end

  def so_long

    @no_ef_header = true
    @no_ef_footer = true

    @current_character = Character.find_by id: params[:character_id]

  end

end