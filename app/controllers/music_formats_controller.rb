class MusicFormatsController < ApplicationController
  add_breadcrumb "Home", :root_path
  before_action :set_music_format, only: %i[show]

  def index
    @music_formats = MusicFormat.includes(release_formats: :album)
    respond_to do |format|
      format.html { render :index}
      format.json { render :json => @music_formats}
    end
  end

  def show
    respond_to do |format|
      format.html { render :show}
      format.json { render :json => @music_format}
    end
  end

  private

  def set_music_format
    @music_format = MusicFormat.find(params[:id])
  end

end
