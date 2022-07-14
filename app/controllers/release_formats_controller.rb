class ReleaseFormatsController < ApplicationController

  add_breadcrumb "Home", :root_path

  before_action :get_album
  before_action :set_release_format, only: [:show, :edit, :update, :destroy]

  def index
    @release_formats = @album.release_formats
    respond_to do |format|
      format.html { render :index}
      format.json { render :json => @release_formats}
    end
  end

  def show
    respond_to do |format|
      format.html { render :show}
      format.json { render :json => @release_format}
    end
  end

  def new
    @release_format = @album.release_formats.build
  end

  def edit

  end

  def create
    @release_format = @album.release_formats.build(release_format_params)
    respond_to do |format|
      if @release_format.save
        format.html { redirect_to album_release_formats_path(@album) }
        format.json { render :show, status: :created, location: @release_format }
      else
        format.html { render :new }
        format.json { render json: @release_format.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @release_format.update(release_format_params)
        format.html { redirect_to @release_format }
        format.json { render :show, status: :ok, location: @release_format }
      else
        format.json { render json: @release_format.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @release_format.destroy
    respond_to do |format|
      format.html { redirect_to album_release_formats_path }
      format.json { head :no_content }
    end
  end

  private

  def set_release_format
    @release_format = @album.release_formats.find(params[:id])
  end

  def get_album
    @album = Album.find(params[:album_id])
  end

  def release_format_params
    params.require(:release_format).permit(:album_id, :music_format_id)
  end

end
