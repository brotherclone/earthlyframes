class AlbumtypesController < ApplicationController
  before_action :set_albumtype, only: [:show, :edit, :update, :destroy]

  # GET /albumtypes
  # GET /albumtypes.json
  def index
    @albumtypes = Albumtype.all
  end

  # GET /albumtypes/1
  # GET /albumtypes/1.json
  def show
  end

  # GET /albumtypes/new
  def new
    @albumtype = Albumtype.new
  end

  # GET /albumtypes/1/edit
  def edit
  end

  # POST /albumtypes
  # POST /albumtypes.json
  def create
    @albumtype = Albumtype.new(albumtype_params)

    respond_to do |format|
      if @albumtype.save
        format.html { redirect_to @albumtype, notice: 'Albumtype was successfully created.' }
        format.json { render :show, status: :created, location: @albumtype }
      else
        format.html { render :new }
        format.json { render json: @albumtype.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /albumtypes/1
  # PATCH/PUT /albumtypes/1.json
  def update
    respond_to do |format|
      if @albumtype.update(albumtype_params)
        format.html { redirect_to @albumtype, notice: 'Albumtype was successfully updated.' }
        format.json { render :show, status: :ok, location: @albumtype }
      else
        format.html { render :edit }
        format.json { render json: @albumtype.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /albumtypes/1
  # DELETE /albumtypes/1.json
  def destroy
    @albumtype.destroy
    respond_to do |format|
      format.html { redirect_to albumtypes_url, notice: 'Albumtype was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_albumtype
      @albumtype = Albumtype.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def albumtype_params
      params[:albumtype]
    end
end
