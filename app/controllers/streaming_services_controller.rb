class StreamingServicesController < ApplicationController
  add_breadcrumb "Home", :root_path
  before_action :set_streaming_service, only: %i[ show edit update destroy ]

  def index
    add_breadcrumb "Streaming Services", :streaming_services_path
    @streaming_services = StreamingService.all
    respond_to do |format|
      format.html { render :index}
      format.json { render :json => @streaming_services}
    end
  end

  def show
    respond_to do |format|
      format.html { render :show}
      format.json { render :json => @streaming_service}
    end
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
        format.html { redirect_to streaming_service_url(@streaming_service) }
        format.json { render :show, status: :created, location: @streaming_service }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @streaming_service.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @streaming_service.update(streaming_service_params)
        format.html { redirect_to streaming_service_url(@streaming_service) }
        format.json { render :show, status: :ok, location: @streaming_service }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @streaming_service.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @streaming_service.destroy
    respond_to do |format|
      format.html { redirect_to streaming_services_url }
      format.json { head :no_content }
    end
  end

  private

    def set_streaming_service
      @streaming_service = StreamingService.find(params[:id])
    end

    def streaming_service_params
      params.require(:streaming_service).permit([:name, :icon])
    end

end
