class ConstellationsController < ApplicationController

  before_action :set_constellation, only: %i[show]
  
  def index
    @constellations = Constellation.all
    respond_to do |format|
      format.html { render :index}
      format.json { render :json => @constellations}
    end
  end
  
  def show
    respond_to do |format|
      format.html { render :show}
      format.json { render :json => @constellation}
    end
  end
  
  private

  def set_constellation
    @constellation = Constellation.find(params[:id])
  end

end
