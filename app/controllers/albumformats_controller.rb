class AlbumformatsController < ApplicationController
  before_action :set_albumformat, only: [:show, :edit, :update, :destroy]

  # GET /albumformats
  # GET /albumformats.json
  def index
    @albumformats = Albumformat.all
  end

  # GET /albumformats/1
  # GET /albumformats/1.json
  def show
  end

  # GET /albumformats/new
  def new
    @albumformat = Albumformat.new
  end

  # GET /albumformats/1/edit
  def edit
  end

  # POST /albumformats
  # POST /albumformats.json
  def create
    @albumformat = Albumformat.new(albumformat_params)

    respond_to do |format|
      if @albumformat.save
        format.html { redirect_to @albumformat, notice: 'Albumformat was successfully created.' }
        format.json { render :show, status: :created, location: @albumformat }
      else
        format.html { render :new }
        format.json { render json: @albumformat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /albumformats/1
  # PATCH/PUT /albumformats/1.json
  def update
    respond_to do |format|
      if @albumformat.update(albumformat_params)
        format.html { redirect_to @albumformat, notice: 'Albumformat was successfully updated.' }
        format.json { render :show, status: :ok, location: @albumformat }
      else
        format.html { render :edit }
        format.json { render json: @albumformat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /albumformats/1
  # DELETE /albumformats/1.json
  def destroy
    @albumformat.destroy
    respond_to do |format|
      format.html { redirect_to albumformats_url, notice: 'Albumformat was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_albumformat
      @albumformat = Albumformat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def albumformat_params
      params[:albumformat]
    end
end
