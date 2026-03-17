class MusicVideosController < ApplicationController
  add_breadcrumb "Home", :root_path

  def index
    @songs_with_videos = Song.joins(:videos).includes(:videos).order('songs.created_at ASC').distinct
    respond_to do |format|
      format.html { render :index}
      format.json { render :json => @songs_with_videos}
    end
  end
end