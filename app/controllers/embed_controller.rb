class EmbedsController < ApplicationController

  before_action :set_embed, only: %i[ show edit update destroy ]

  def index
    @embeds = Embed.all
  end

  def show
  end

  def new
    @embed = Embed.new
  end

  def edit
  end

  def create
    @embed = Embed.new(embed_params)
    respond_to do |format|
      if @embed.save
        format.html { redirect_to embed_url(@embed) }
        format.json { render :show, status: :created, location: @embed }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @embed.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @embed.update(embed_params)
        format.html { redirect_to embed_url(@embed) }
        format.json { render :show, status: :ok, location: @embed }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @embed.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @embed.destroy
    respond_to do |format|
      format.html { redirect_to embeds_url}
      format.json { head :no_content }
    end
  end

  private

  def set_embed
    @embed = Embed.find(params[:id])
  end

  def embed_params
    params.require(:embed).permit(:player_identifier, :artist_link, :color, :text_color, :streaming_service_id, :song_id, :embed_code)
  end
end
