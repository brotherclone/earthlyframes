class MusicFormatsController < InheritedResources::Base
  add_breadcrumb "Home", :root_path
  before_action :set_music_format, only: %i[show edit update destroy]

  def index
    @music_formats = MusicFormat.all
    respond_to do |format|
      format.html { render :index}
      format.json { render :json => @music_formats}
    end
  end

  def show
    respond_to do |format|
      format.html { render :show}
      format.json { render :json => @music_format}
    end
  end

  def new
    @music_format = MusicFormat.new
  end

  def edit; end

  def create
    @music_format = MusicFormat.new(music_format_params)
    respond_to do |format|
      if @music_format.save
        format.html { redirect_to music_format_url(@music_format) }
        format.json { render :show, status: :created, location: @music_format }
      else
        format.html { render :index, status: :unprocessable_entity }
        format.json { render json: @music_format.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @music_format.update(music_format_params)
        format.html { redirect_to music_format_url(@music_format) }
        format.json { render :show, status: :ok, location: @music_format }
      else
        format.html { render :index, status: :unprocessable_entity }
        format.json { render json: @music_format.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_music_format
    @music_format = MusicFormat.find(params[:id])
  end

  def music_format_params
    params.require(:music_format).permit(:name)
  end

end
