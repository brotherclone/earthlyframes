class StreamingServicesController < ApplicationController
  before_action :set_streaming_service, only: [:show, :edit, :update, :destroy]

  def index
    @streaming_services = StreamingService.all
  end

  def show
  end

  def new
    @streaming_service = StreamingService.new
  end

  def edit
  end

  def create
    @streaming_service = StreamingService.new(streaming_service_params)

    respond_to do |format|
      if @streaming_service.save
        format.html { redirect_to @streaming_service, notice: 'StreamingService was successfully created.' }
        format.json { render :show, status: :created, location: @streaming_service }
      else
        format.html { render :new }
        format.json { render json: @streaming_service.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @streaming_service.update(streaming_service_params)
        format.html { redirect_to @streaming_service, notice: 'StreamingService was successfully updated.' }
        format.json { render :show, status: :ok, location: @streaming_service }
      else
        format.html { render :edit }
        format.json { render json: @streaming_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /streaming_services/1
  # DELETE /streaming_services/1.json
  def destroy
    @streaming_service.destroy
    respond_to do |format|
      format.html { redirect_to streaming_services_url, notice: 'StreamingService was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_streaming_service
    @streaming_service = StreamingService.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def streaming_service_params
    params.require(:streaming_service).permit(:name, :icon_url)
  end
end
