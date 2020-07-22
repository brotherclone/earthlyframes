class CharacterBackgroundsController < ApplicationController
  before_action :set_character_background, only: [:show, :edit, :update, :destroy]

  def index
    @character_backgrounds = ChracterBackground.all
  end

  def show
  end

  def new
    @character_background = ChracterBackground.new
  end

  def edit
  end

  def create
    @character_background = ChracterBackground.new(character_background_params)

    respond_to do |format|
      if @character_background.save
        format.html { redirect_to @character_background, notice: 'ChracterBackground was successfully created.' }
        format.json { render :show, status: :created, location: @character_background }
      else
        format.html { render :new }
        format.json { render json: @character_background.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @character_background.update(character_background_params)
        format.html { redirect_to @character_background, notice: 'ChracterBackground was successfully updated.' }
        format.json { render :show, status: :ok, location: @character_background }
      else
        format.html { render :edit }
        format.json { render json: @character_background.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /character_backgrounds/1
  # DELETE /character_backgrounds/1.json
  def destroy
    @character_background.destroy
    respond_to do |format|
      format.html { redirect_to character_backgrounds_url, notice: 'ChracterBackground was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_character_background
    @character_background = ChracterBackground.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def character_background_params
    params.require(:character_background).permit(:character_background)
  end
end
