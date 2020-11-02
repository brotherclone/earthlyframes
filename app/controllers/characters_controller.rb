class CharactersController < ApplicationController

  before_action :set_character, only: [:show, :update, :destroy, :archive]
  skip_before_action :verify_authenticity_token, only: [:create, :archive, :update, :destroy]

  def index
    @characters = Character.all
    @no_ef_header = true
    @no_ef_footer = true
    respond_to do |format|
      format.html { render :index}
      format.json { render :json => @characters }
    end
  end

  def show
    @no_ef_header = true
    @no_ef_footer = true
    respond_to do |format|
      format.html { render :show}
      format.json { render :json => @character}
    end
  end

  def create
    @character = Character.new(character_params)
    respond_to do |format|
      if @character.save
        format.html { redirect_to @character, notice: 'Character was successfully created.' }
        format.json { render json: @character }
      else
        format.html { render :new }
        format.json { render json: @character.errors, status: :unprocessable_entity }
      end
    end
  end

  def archive
    @character.archived = true
    @character.save
    respond_to do |format|
    format.json { render :json => @character }
      format.html { redirect_to @character, notice: 'Character was successfully archived.' }
      format.json { render :json => @character }
    end
  end


  def update
    respond_to do |format|
      if @character.update(character_params)
        format.html { redirect_to @character, notice: 'Character was successfully updated.' }
        format.json { render json: @character }
      else
        format.html { render :edit }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @character.destroy
    respond_to do |format|
      format.json { render json: {:message=> "success" }}
    end
  end

  private

  def set_character
    @character = Character.find(params[:id])
  end

  def character_params
    params.require(:character).permit(:user_id, :name, :additional_bio, :character_setting_id,
                                      :character_background_id, :character_role_id,
                                      :character_descriptor_id, :current_health, :max_health, :log_id, :archived)
  end
end
