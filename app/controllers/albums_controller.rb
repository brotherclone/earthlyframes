class AlbumsController < ApplicationController
  add_breadcrumb "Home", :root_path
  before_action :set_album, only: %i[show edit update destroy]

  def index
    add_breadcrumb "Albums", :albums_path
    @albums = Album.all.order(released: :desc)
    respond_to do |format|
      format.html { render :index}
      format.json { render :json => @albums}
    end
  end

  def show
    add_breadcrumb "Albums", :albums_path
    add_breadcrumb @album.title, :album_path
    respond_to do |format|
      format.html { render :show}
      format.json { render :json => @album}
    end
  end

  def new
    @album = Album.new
  end

  def edit; end

  def create
    @album = Album.new(album_params)
    respond_to do |format|
      if @album.save
        format.html { redirect_to album_url(@album)}
        format.json { render :show, status: :created, location: @album }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @album.update(album_params)
        format.html { redirect_to album_url(@album) }
        format.json { render :show, status: :ok, location: @album }
      else
        format.html { render :edit, status: :unprocessable_entity }
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
    params.require(:album).permit(:title,
                                    :cover,
                                    :description,
                                    :price,
                                    :released,
                                    :buy_link,
                                    :brief_description,
                                    :is_live,
                                    :rainbow_table,
                                    :rainbow_portrait,
                                    { album_streaming_links_attributes: [:id, :link, :streaming_service_id, :_destroy] },
                                    { release_formats_attributes: [:id, :name, :_destroy, :music_format_id] })
  end
end
