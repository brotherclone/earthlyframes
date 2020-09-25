class CharacterBackgroundsController < ApplicationController

  before_action :set_character_background, only: [:show, :edit, :update, :destroy]

  def index
    @character_backgrounds = CharacterBackground.all
    @no_ef_header = true
    @no_ef_footer = true
    respond_to do |format|
      format.html { render :index}
      format.json { render :json => @character_backgrounds}
    end
  end

  def show
    @no_ef_header = true
    @no_ef_footer = true
    respond_to do |format|
      format.html { render :show}
      format.json { render :json => @character_background}
    end
  end

  def new
    @character_background = CharacterBackground.new
  end

  def edit
  end

  def create
    @character_background = CharacterBackground.new(character_background_params)

    respond_to do |format|
      if @character_background.save
        format.html { redirect_to @character_background, notice: 'CharacterBackground was successfully created.' }
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
        format.html { redirect_to @character_background, notice: 'CharacterBackground was successfully updated.' }
        format.json { render :show, status: :ok, location: @character_background }
      else
        format.html { render :edit }
        format.json { render json: @character_background.errors, status: :unprocessable_entity }
      end
    end
  end
  
  
  def destroy
    @character_background.destroy
    respond_to do |format|
      format.html { redirect_to character_backgrounds_url, notice: 'CharacterBackground was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_character_background
    @character_background = CharacterBackground.find(params[:id])
  end

  def character_background_params
    params.require(:character_background).permit(:background)
  end
end
