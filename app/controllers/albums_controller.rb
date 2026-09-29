class AlbumsController < ApplicationController
  add_breadcrumb "Home", :root_path
  before_action :set_album, only: %i[show]

  def index
    add_breadcrumb "Albums", :albums_path
    @albums = Album.where(is_live: true)
                   .with_page_associations
                   .order(released: :desc)
    expires_in 5.minutes, public: true
    respond_to do |format|
      format.html { render :index}
      format.json { render :json => @albums}
    end
  end

  def show
    add_breadcrumb "Albums", :albums_path
    add_breadcrumb @album.title, :album_path
    fresh_when @album, public: true
    respond_to do |format|
      format.html { render :show}
      format.json { render :json => @album}
    end
  end

  private

  def set_album
    @album = Album.with_page_associations.find(params[:id])
  end
end
