class ReleaseFormatsController < ApplicationController

  add_breadcrumb "Home", :root_path

  before_action :get_album
  before_action :set_release_format, only: %i[show]

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

  private

  def set_release_format
    @release_format = @album.release_formats.find(params[:id])
  end

  def get_album
    @album = Album.find(params[:album_id])
  end

end
