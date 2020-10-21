class EntriesController < ApplicationController

  before_action :set_entry, only: [:show, :edit, :update, :destroy]
  after_action :update_character, on: :create

  def index
    @entries = Entry.all
    @no_ef_header = true
    @no_ef_footer = true
    respond_to do |format|
      format.html { render :index}
      format.json { render :json => @entries }
    end
  end

  def show
    @no_ef_header = true
    @no_ef_footer = true
    respond_to do |format|
      format.html { render :show}
      format.json { render :json => @entry }
    end
  end

  def new
    @entry = Entry.new
  end

  def edit
  end

  def create
    @entry = Entry.new(entry_params)
    respond_to do |format|
      character = Character.find_by id: @entry.character_id
      if @entry.save
        format.html { redirect_to character_path(character), notice: 'Entry was successfully created.' }
        format.json { render :show, status: :created, location: @entry }
      else
        format.html { render :new }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_character
    if @entry
      prompt = Prompt.find_by id: @entry.prompt_id
      if prompt.damage >= 1
        health =  @entry.character.current_health - prompt.damage
        @entry.character.update_attributes(current_health: health)
      end
    end
  end

  def update
    respond_to do |format|
      if @entry.update(entry_params)
        format.json { render :show, status: :ok, location: @entry }
      else
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entries/1
  # DELETE /entries/1.json
  def destroy
    @entry.destroy
    respond_to do |format|
      format.html { redirect_to entries_url, notice: 'Entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_entry
    @entry = Entry.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def entry_params
    params.require(:entry).permit(:log_id, :entry_text, :prompt_id, :character_id)
  end
end
