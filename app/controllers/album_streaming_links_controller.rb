class AlbumStreamingLinksController < ApplicationController
  add_breadcrumb "Home", :root_path
  before_action :set_album
  before_action :set_album_streaming_link, only: %i[show edit update destroy]

  def index
    add_breadcrumb "Streaming Links", :album_streaming_links
    @album_streaming_links = @album.album_streaming_links
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

  def new
    @album_streaming_link = @album.album_streaming_links.build
  end

  def edit; end

  def create
    @album_streaming_link =  @album.album_streaming_links.build(album_streaming_link_params)
    respond_to do |format|
      if @album_streaming_link.save
        format.html { redirect_to album_album_streaming_link_path(@album_streaming_link) }
        format.json { render :show, status: :created, location: @album_streaming_link }
      else
        format.html { render :index, status: :unprocessable_entity }
        format.json { render json: @album_streaming_link.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @album.album_streaming_links(album_streaming_link_params)
        format.html { redirect_to album_album_streaming_link_path(@album_streaming_link) }
        format.json { render :show, status: :ok, location: @album_streaming_link }
      else
        format.html { render :index, status: :unprocessable_entity }
        format.json { render json: @album_streaming_link.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @album_streaming_link.destroy
    respond_to do |format|
      format.html { redirect_to album_album_streaming_link_path }
      format.json { head :no_content }
    end
  end

  private

  def set_album
    @album = Album.find(params[:album_id])
  end

  def set_album_streaming_link
    @album_streaming_link = AlbumStreamingLink.find(params[:id])
  end

  def album_streaming_link_params
    params.require(:album_streaming_link).permit(:album_id, :streaming_service_id, :link)
  end

end
