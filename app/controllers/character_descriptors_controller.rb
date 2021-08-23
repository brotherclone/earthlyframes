class CharacterDescriptorsController < ApplicationController
  before_action :set_character_descriptor, only: [:show, :edit, :update, :destroy]

  def index
    @character_descriptors = CharacterDescriptor.all
    @no_ef_header = true
    @no_ef_footer = true
    respond_to do |format|
      format.html { render :index}
      format.json { render :json => @character_descriptors}
    end
  end

  def show
    @no_ef_header = true
    @no_ef_footer = true
    respond_to do |format|
      format.html { render :show}
      format.json { render :json => @character_descriptor}
    end
  end

  def new
    @character_descriptor = CharacterDescriptor.new
  end

  def edit
  end

  def create
    @character_descriptor = CharacterDescriptor.new(character_descriptor_params)

    respond_to do |format|
      if @character_descriptor.save
        format.html { redirect_to @character_descriptor, notice: 'CharacterDescriptor was successfully created.' }
        format.json { render :show, status: :created, location: @character_descriptor }
      else
        format.html { render :new }
        format.json { render json: @character_descriptor.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @character_descriptor.update(character_descriptor_params)
        format.html { redirect_to @character_descriptor, notice: 'CharacterDescriptor was successfully updated.' }
        format.json { render :show, status: :ok, location: @character_descriptor }
      else
        format.html { render :edit }
        format.json { render json: @character_descriptor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /character_descriptors/1
  # DELETE /character_descriptors/1.json
  def destroy
    @character_descriptor.destroy
    respond_to do |format|
      format.html { redirect_to character_descriptors_url, notice: 'CharacterDescriptor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_character_descriptor
    @character_descriptor = CharacterDescriptor.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def character_descriptor_params
    params.require(:character_descriptor).permit(:descriptor)
  end
end
