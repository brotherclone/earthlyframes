class SongsController < ApplicationController

  before_action :set_album, except: %i[just_titles]
  before_action :set_song, only: %i[show edit update destroy ]

  def index
    @songs = @album.songs
    respond_to do |format|
      format.html { render :index}
      format.json { render :json => @songs}
    end
  end

  def just_titles
    songs = Song.all
    @song_titles = []
    rainbow_only = params[:rainbow_only]
    songs.each do |song|
      if rainbow_only
        if song.album.rainbow_table != 'not_associated'
          @song_titles << song.title
        end
      else
        @song_titles << song.title
      end
    end
    respond_to do |format|
      format.html { render :just_titles}
      format.json { render :json => @song_titles}
    end
  end

  def show
    respond_to do |format|
      format.html { render :show}
      format.json { render :json => @song}
    end
  end

  def new
    @song = @album.songs.build
  end

  def edit; end

  def create
    @song = @album.songs.build(song_params)
    respond_to do |format|
      if @song.save
        format.html { redirect_to album_songs_path(@album) }
        format.json { render :show, status: :created, location: @song }
      else
        format.html { render :index, status: :unprocessable_entity }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @album.song.update(song_params)
        format.html { redirect_to @song }
        format.json { render :show, status: :ok, location: @song }
      else
        format.html { render :index, status: :unprocessable_entity }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @song.destroy
    respond_to do |format|
      format.html { redirect_to album_songs_path }
      format.json { head :no_content }
    end
  end

  private

  def set_song
    @song = @album.songs.find(params[:id])
  end

  def set_album
    @album = Album.find(params[:album_id])
  end

  def song_params
    params.require(:song).permit(:album_id,
                                        :title,
                                        :trt,
                                        :notes,
                                        :lyrics,
                                        :song_order,
                                        { streaming_links_attributes: [:id, :link, :streaming_service_id, :_destroy] },
                                        { embeds_attributes: [:id, :player_identifier, :artist_link, :color, :text_color, :song_id, :streaming_service_id, :embed_code, :_destroy] })
  end
end
