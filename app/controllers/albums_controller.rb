class AlbumsController < ApplicationController

  add_breadcrumb "Home", :root_path
  add_breadcrumb "Albums", :albums_path

  before_action :set_album, only: [:show, :edit, :update, :destroy]

  def index
    @albums = Album.all.order(released: :desc).where(is_live: true)
    respond_to do |format|
      format.html { render :index}
      format.json { render :json => @albums}
    end
  end

  def show
    gon.album_songs = @album.songs
    add_breadcrumb @album.title.to_s, album_path
    respond_to do |format|
      format.html { render :show}
      format.json { render :json => @album}
    end
  end

  def new
    @album = Album.new
  end

  def edit
  end

  def create
    @album = Album.new(album_params)
    respond_to do |format|
      if @album.save
        format.html { redirect_to @album, notice: 'Album was successfully created.' }
        format.json { render :show, status: :created, location: @album }
      else
        format.html { render :new }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @album.update(album_params)
        format.html { redirect_to @album, notice: 'Album was successfully updated.' }
        format.json { render :show, status: :ok, location: @album }
      else
        format.html { render :edit }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @album.destroy
    respond_to do |format|
      format.html { redirect_to albums_url, notice: 'Album was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_album
      @album = Album.find(params[:id])
    end

    def album_params
      params.require(:album).permit(:title, :cover, :rainbow_table, :rainbow_portrait, :description, :price, :released, :buylink, :format, :brief_description, :is_live, :streaming_links_attributes[:link, :streaming_service_id])
    end
end
