class RainbowTableController < ApplicationController

  def index
    add_breadcrumb "Home", :root_path
    add_breadcrumb "Albums", :albums_path
    add_breadcrumb "The Rainbow Table", :rainbow_path
    @rainbow_table_albums  = Album.where.not(:rainbow_table => 'not_associated').order(:rainbow_table)
    @unfinished_albums = []

    Album.rainbow_tables.each do |c|
      if c[1] != 0
        check = false
        @rainbow_table_albums.each do |album|
          if album.rainbow_table == c[0]
            check = true
          end
        end
        unless check
          @unfinished_albums << {:color => c[0], :color_id => c[1] }
        end
      end
    end
  end
end