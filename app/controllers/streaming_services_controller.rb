class StreamingServicesController < ApplicationController
  add_breadcrumb "Home", :root_path
  before_action :set_streaming_service, only: %i[show]

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

  private

    def set_streaming_service
      @streaming_service = StreamingService.find(params[:id])
    end

end
