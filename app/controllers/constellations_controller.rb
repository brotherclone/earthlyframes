class ConstellationsController < ApplicationController

  before_action :set_constellation, only: %i[show edit update destroy]
  
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
  
  def edit
    
  end
  
  def new
    @constellation = Constellation.new
  end

  def create
    @constellation = Constellation.new(constellation_params)
    respond_to do |format|
      if @constellation.save
        format.html { redirect_to constellation_url(@constellation) }
        format.json { render :show, status: :created, location: @constellation}
      else
        format.html { render :index, status: :unprocessable_entity }
        format.json { render json: @constellation.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def update
    respond_to do |format|
      if @constellation.update(constellation_params)
        format.html { redirect_to constellation_url(@constellation) }
        format.json { render :show, status: :ok, location: @constellation }
      else
        format.html { render :index, status: :unprocessable_entity }
        format.json { render json: @constellation.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @constellation.destroy
    respond_to do |format|
      format.html { redirect_to constellations_url }
      format.json { head :no_content }
    end
  end
  
  private

  def set_constellation
    @constellation = Constellation.find(params[:id])
  end
  
  def constellation_params
    params.require(:constellation).permit(:name,
                                          :description,
                                          { song_constellations_attributes: [:id, :song_id, :sequence_number, :_destroy] })
  end

end
