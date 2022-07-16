class EmbedsController < ApplicationController

  add_breadcrumb "Home", :root_path
  before_action :get_album
  before_action :get_song
  before_action :set_embed, only: %i[show edit update destroy ]

  def index
    @embeds = @song.embeds
    respond_to do |format|
      format.html { render :index}
      format.json { render :json => @embeds}
    end
  end

  def show
    respond_to do |format|
      format.html { render :show}
      format.json { render :json => @embed}
    end
  end

  def new
    @embed = @song.embeds.build
  end

  def edit; end

  def create
    @embed = @song.embeds.build(embed_params)
    respond_to do |format|
      if @embed.save
        format.html { redirect_to album_song_embed_path(@embed) }
        format.json { render :show, status: :created, location: @embed }
      else
        format.html { render :index, status: :unprocessable_entity }
        format.json { render json: @embed.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @song.embeds.update(embed_params)
        format.html { redirect_to @embed }
        format.json { render :show, status: :ok, location: @embed }
      else
        format.html { render :index, status: :unprocessable_entity }
        format.json { render json: @embed.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @embed.destroy
    respond_to do |format|
      format.html { redirect_to album_song_embeds_path}
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

  def set_embed
    @embed = @song.embeds.find(params[:id])
  end

  def embed_params
    params.require(:embed).permit(:player_identifier, :artist_link, :color, :text_color, :streaming_service_id, :song_id, :album_id, :embed_code)
  end

end
