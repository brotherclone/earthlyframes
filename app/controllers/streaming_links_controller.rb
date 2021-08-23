class StreamingLinksController < ApplicationController
  before_action :set_streaming_link, only: [:show, :edit, :update, :destroy]

  def index
    @streaming_links = StreamingLink.all
  end

  def show
  end

  def new
    @streaming_link = StreamingLink.new
  end

  def edit
  end

  def create
    @streaming_link = StreamingLink.new(streaming_link_params)

    respond_to do |format|
      if @streaming_link.save
        format.html { redirect_to @streaming_link, notice: 'StreamingLink was successfully created.' }
        format.json { render :show, status: :created, location: @streaming_link }
      else
        format.html { render :new }
        format.json { render json: @streaming_link.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @streaming_link.update(streaming_link_params)
        format.html { redirect_to @streaming_link, notice: 'StreamingLink was successfully updated.' }
        format.json { render :show, status: :ok, location: @streaming_link }
      else
        format.html { render :edit }
        format.json { render json: @streaming_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /streaming_links/1
  # DELETE /streaming_links/1.json
  def destroy
    @streaming_link.destroy
    respond_to do |format|
      format.html { redirect_to streaming_links_url, notice: 'StreamingLink was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_streaming_link
    @streaming_link = StreamingLink.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def streaming_link_params
    params.require(:streaming_link).permit(:link, :album_id, :streaming_service_id, :song_id)
  end
end
