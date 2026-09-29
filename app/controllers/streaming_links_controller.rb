class StreamingLinksController < ApplicationController

  add_breadcrumb "Home", :root_path
  before_action :get_album
  before_action :get_song
  before_action :set_streaming_link, only: %i[show]

  def index
    @streaming_links = @song.streaming_links
    respond_to do |format|
      format.html { render :index}
      format.json { render :json => @streaming_links}
    end
  end

  def show
    respond_to do |format|
      format.html { render :show}
      format.json { render :json => @streaming_link}
    end
  end

  private

  def get_album
    @album = Album.find(params[:album_id])
  end

  def get_song
    @song = @album.songs.find(params[:song_id])
  end

  def set_streaming_link
    @streaming_link = @song.streaming_links.find(params[:id])
  end

end
