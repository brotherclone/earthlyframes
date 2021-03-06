class VideosController < ApplicationController

  add_breadcrumb "Home", :root_path
  add_breadcrumb "Videos", :videos_path

  before_action :set_video, only: [:show, :edit, :update, :destroy]


  def index
    @videos = Video.all
    respond_to do |format|
      format.html { render :index}
      format.json { render :json => @videos}
    end
  end

  def show
    add_breadcrumb @video.title.to_s, :video_path
    respond_to do |format|
      format.html { render :show}
      format.json { render :json => @video}
    end
  end

  def new
    @video = Video.new
  end

  def edit
  end

  def create
    @video = Video.new(video_params)
    respond_to do |format|
      if @video.save
        format.html { redirect_to @video, notice: 'Video was successfully created.' }
        format.json { render :show, status: :created, location: @video }
      else
        format.html { render :new }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @video.update(video_params)
        format.html { redirect_to @video, notice: 'Video was successfully updated.' }
        format.json { render :show, status: :ok, location: @video }
      else
        format.html { render :edit }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /videos/1
  # DELETE /videos/1.json
  def destroy
    @video.destroy
    respond_to do |format|
      format.html { redirect_to videos_url, notice: 'Video was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_video
    @video = Video.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def video_params
    params.require(:video).permit(:title, :description, :video_type, :video_service_id, :song_id, :video_embed_url)
  end
end
