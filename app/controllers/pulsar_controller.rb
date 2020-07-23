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