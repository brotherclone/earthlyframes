class CharacterSettingsController < ApplicationController

  before_action :set_character_setting, only: [:show, :edit, :update, :destroy]

  def index
    @character_settings = CharacterSetting.all
    @no_ef_header = true
    @no_ef_footer = true
    respond_to do |format|
      format.html { render :index}
      format.json { render :json => @character_settings }
    end
  end

  def show
    @no_ef_header = true
    @no_ef_footer = true
    respond_to do |format|
      format.html { render :show}
      format.json { render :json => @character_setting}
    end
  end

  def new
    @character_setting = CharacterSetting.new
  end

  def edit
  end

  def create
    @character_setting = CharacterSetting.new(character_setting_params)

    respond_to do |format|
      if @character_setting.save
        format.html { redirect_to @character_setting, notice: 'CharacterSetting was successfully created.' }
        format.json { render :show, status: :created, location: @character_setting }
      else
        format.html { render :new }
        format.json { render json: @character_setting.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @character_setting.update(character_setting_params)
        format.html { redirect_to @character_setting, notice: 'CharacterSetting was successfully updated.' }
        format.json { render :show, status: :ok, location: @character_setting }
      else
        format.html { render :edit }
        format.json { render json: @character_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /character_settings/1
  # DELETE /character_settings/1.json
  def destroy
    @character_setting.destroy
    respond_to do |format|
      format.html { redirect_to character_settings_url, notice: 'CharacterSetting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_character_setting
    @character_setting = CharacterSetting.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def character_setting_params
    params.require(:character_setting).permit(:time, :place)
  end
end
