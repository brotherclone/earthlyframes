class MusicVideosController < ApplicationController
  add_breadcrumb "Home", :root_path

  def index
    @songs_with_videos = Song.joins(:videos).where.not(videos: { id: nil } ).order('songs.created_at ASC').uniq
    respond_to do |format|
      format.html { render :index}
      format.json { render :json => @songs_with_videos}
    end
  end
end