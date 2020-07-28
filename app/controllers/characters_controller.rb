class CharactersController < ApplicationController
  before_action :set_character, only: [:show, :edit, :update, :destroy]

  def index
    @characters = Character.all
  end

  def show

  end

  def new
    @character = Character.new
  end

  def edit
  end

  def create
    @character = Character.new(character_params)
    respond_to do |format|
      if @character.save
        format.html { redirect_to pulsar_entry_path(character_id: @character.id), notice: 'Character was successfully created.' }
        format.json { render :show, status: :created, location: @character }
      else
        format.html { render :new }
        format.json { render json: @character.errors, status: :unprocessable_entity }
      end
    end
  end


  def update

  end

  def destroy
    @character.destroy
    respond_to do |format|
      format.html { redirect_to characters_url, notice: 'Character was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_character
    @character = Character.find(params[:id])
  end

  def character_params
    params.require(:character).permit(:user_id, :name, :additional_bio, :character_setting_id,
                                      :character_background_id, :character_role_id,
                                      :character_descriptor_id, :current_health, :maximum_health, :log_id)
  end
end
