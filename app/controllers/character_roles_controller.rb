class CharacterRolesController < ApplicationController
  before_action :set_character_role, only: [:show, :edit, :update, :destroy]

  def index
    @character_roles = CharacterRole.all
  end

  def show
  end

  def new
    @character_role = CharacterRole.new
  end

  def edit
  end

  def create
    @character_role = CharacterRole.new(character_role_params)

    respond_to do |format|
      if @character_role.save
        format.html { redirect_to @character_role, notice: 'CharacterRole was successfully created.' }
        format.json { render :show, status: :created, location: @character_role }
      else
        format.html { render :new }
        format.json { render json: @character_role.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @character_role.update(character_role_params)
        format.html { redirect_to @character_role, notice: 'CharacterRole was successfully updated.' }
        format.json { render :show, status: :ok, location: @character_role }
      else
        format.html { render :edit }
        format.json { render json: @character_role.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /character_roles/1
  # DELETE /character_roles/1.json
  def destroy
    @character_role.destroy
    respond_to do |format|
      format.html { redirect_to character_roles_url, notice: 'CharacterRole was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_character_role
    @character_role = CharacterRole.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def character_role_params
    params.require(:character_role).permit(:character_role, :log_id)
  end
end
