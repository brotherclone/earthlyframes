class HomeController < InheritedResources::Base

  def index
    @rainbow_table_albums= Album.where('rainbow_table != 0 AND is_live').order(rainbow_table: :asc)
    rainbow_done_colors = []
    @rainbow_unfinished_colors = []
    @rainbow_table_albums.each do |r|
      rainbow_done_colors << r.rainbow_table
    end

    Album.rainbow_tables.each do |c|
      if c[1] != 0
        unless rainbow_done_colors.include? c[0]
          @rainbow_unfinished_colors << c[0]
        end
      end
    end

  end
end
