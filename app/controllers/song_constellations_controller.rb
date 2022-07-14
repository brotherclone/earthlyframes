class SongConstellationsController < ApplicationController

  before_action :set_song_constellation, only: %i[show edit update destroy]

  def index
    @song_constellations = SongConstellation.all
  end

  def show

  end

  def edit

  end

  def new
    @song_constellation = SongConstellation.new
  end

  def create
    @song_constellation = SongConstellation.new(song_constellation_params)
    respond_to do |format|
      if @song_constellation.save
        format.html { redirect_to song_constellation_url(@song_constellation) }
        format.json { render :show, status: :created, location: @song_constellation}
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @song_constellation.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @song_constellation.update(song_constellation_params)
        format.html { redirect_to song_constellation_url(@song_constellation) }
        format.json { render :show, status: :ok, location: @song_constellation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @song_constellation.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @song_constellation.destroy
    respond_to do |format|
      format.html { redirect_to song_constellation_url }
      format.json { head :no_content }
    end
  end

  private

  def set_song_constellation
    @song_constellation = SongConstellation.find(params[:id])
  end

  def song_constellation_params
    params.require(:song_constellation).permit(:sequence_number, :song_id, :constellation_id)
  end

end
