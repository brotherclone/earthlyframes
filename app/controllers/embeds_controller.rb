class EmbedsController < ApplicationController

  add_breadcrumb "Home", :root_path
  before_action :get_album
  before_action :get_song
  before_action :set_embed, only: %i[show]

  def index
    @embeds = @song.embeds
    respond_to do |format|
      format.html { render :index}
      format.json { render :json => @embeds}
    end
  end

  def show
    respond_to do |format|
      format.html { render :show}
      format.json { render :json => @embed}
    end
  end

  private

  def get_album
    @album = Album.find(params[:album_id])
  end

  def get_song
    @song = Song.find(params[:song_id])
  end

  def set_embed
    @embed = @song.embeds.find(params[:id])
  end

end
