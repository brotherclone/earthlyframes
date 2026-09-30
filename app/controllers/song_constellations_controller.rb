class SongConstellationsController < ApplicationController

  before_action :set_song_constellation, only: %i[show]

  def index
    @song_constellations = SongConstellation.all
  end

  def show

  end

  private

  def set_song_constellation
    @song_constellation = SongConstellation.find(params[:id])
  end

end
