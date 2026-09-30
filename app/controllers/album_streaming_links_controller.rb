class AlbumStreamingLinksController < ApplicationController
  add_breadcrumb "Home", :root_path
  before_action :set_album
  before_action :set_album_streaming_link, only: %i[show]

  def index
    add_breadcrumb "Streaming Links", :album_streaming_links
    @album_streaming_links = @album.album_streaming_links.includes(:streaming_service)
    respond_to do |format|
      format.html { render :index}
      format.json { render :json => @album_streaming_links}
    end
  end

  def show
    add_breadcrumb "Streaming Link", :album_streaming_link
    respond_to do |format|
      format.html { render :show}
      format.json { render :json => @album_streaming_link}
    end
  end

  private

  def set_album
    @album = Album.find(params[:album_id])
  end

  def set_album_streaming_link
    @album_streaming_link = @album.album_streaming_links.find(params[:id])
  end

end
