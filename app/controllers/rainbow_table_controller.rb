class RainbowTableController < ApplicationController
  def index
    @rainbow_albums = Album.where.not(:rainbow_table => 'not_associated').order(:rainbow_table)
  end
end