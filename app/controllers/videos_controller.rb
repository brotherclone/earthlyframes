class VideosController < ApplicationController

  add_breadcrumb "Home", :root_path
  before_action :get_album
  before_action :get_song
  before_action :set_video, only: %i[show edit update destroy]

  def index
    @videos = @song.videos
    respond_to do |format|
      format.html { render :index}
      format.json { render :json => @video}
    end
  end

  def show
    respond_to do |format|
      format.html { render :show}
      format.json { render :json => @video}
    end
  end

  def new
    @video = @song.videos.build
  end

  def edit; end

  def create
    @video = @song.videos.build(video_params)
    respond_to do |format|
      if @video.save
        format.html { redirect_to album_song_video_path(@video) }
        format.json { render :show, status: :created, location: @video }
      else
        format.html { render :index, status: :unprocessable_entity }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @song.videos.update(video_params)
        format.html { redirect_to @video }
        format.json { render :show, status: :ok, location: @video }
      else
        format.html { render :index, status: :unprocessable_entity }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @video.destroy
    respond_to do |format|
      format.html { redirect_to album_song_videos_url }
      format.json { head :no_content }
    end
  end

  private

  def get_album
    @album = Album.find(params[:album_id])
  end

  def get_song
    @song = Song.find(params[:song_id])
  end

  def set_video
    @video = @song.videos.find(params[:id])
  end

  def video_params
    params.require(:video).permit(:title, :description, :video_service_id, :video_type, :song_id, :album_id)
  end
end

