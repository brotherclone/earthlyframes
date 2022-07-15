class StreamingLinksController < ApplicationController

  add_breadcrumb "Home", :root_path
  before_action :get_album
  before_action :get_song
  before_action :set_streaming_link, only: %i[ show edit update destroy ]

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

  def new
    @streaming_link = @song.streaming_links.build
  end

  def edit
  end

  def create
    @streaming_link = @song.streaming_links.build(streaming_link_params)
    respond_to do |format|
      if @streaming_link.save
        format.html { redirect_to album_song_streaming_link_url(@streaming_link) }
        format.json { render :show, status: :created, location: @streaming_link }
      else
        format.html { render :index, status: :unprocessable_entity }
        format.json { render json: @streaming_link.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @song.streaming_links.update(streaming_link_params)
        format.html { redirect_to @streaming_link }
        format.json { render :show, status: :ok, location: @streaming_link }
      else
        format.html { render :index, status: :unprocessable_entity }
        format.json { render json: @streaming_link.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @streaming_link.destroy
    respond_to do |format|
      format.html { redirect_to album_song_streaming_links_url}
      format.json { head :no_content }
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

  def streaming_link_params
    params.require(:streaming_link).permit(:album_id, :song_id, :streaming_service_id, :link)
  end
end
