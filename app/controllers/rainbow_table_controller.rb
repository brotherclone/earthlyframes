class RainbowTableController < ApplicationController

  def index
    add_breadcrumb "Home", :root_path
    add_breadcrumb "Albums", :albums_path
    add_breadcrumb "The Rainbow Table", :rainbow_path
    @rainbow_albums = Album.where.not(:rainbow_table => 'not_associated').order(:rainbow_table)
  end

end