class SongsController < ApplicationController

  before_action :set_album, except: %i[just_titles]
  before_action :set_song, only: %i[show]

  def index
    @songs = @album.songs.includes(streaming_links: :streaming_service)
    respond_to do |format|
      format.html { render :index}
      format.json { render :json => @songs}
    end
  end

  def just_titles
    @song_titles = if params[:rainbow_only]
      Song.joins(:album).where.not(albums: { rainbow_table: 0 }).pluck(:title)
    else
      Song.pluck(:title)
    end
    respond_to do |format|
      format.html { render :just_titles}
      format.json { render :json => @song_titles}
    end
  end

  def show
    fresh_when @song, public: true
    respond_to do |format|
      format.html { render :show}
      format.json { render :json => @song}
    end
  end

  private

  def set_song
    @song = @album.songs.find(params[:id])
  end

  def set_album
    @album = Album.find(params[:album_id])
  end
end
