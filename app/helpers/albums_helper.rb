module AlbumsHelper

  def rainbow_css(album)
    "rainbow-table-"+album.rainbow_table.to_s
  end

  def just_the_year(album)
    album.released.strftime('%Y')
  end

  def get_rainbow_colors(album)
    colors = []
    case album.rainbow_table
    when "black"
      colors[0] = "#000000"
      colors[1] = "#f6f6f6"
    when "red"
      colors[0] = "#AE0A33"
      colors[1] = "#000000"
    when "orange"
      colors[0] = "#EF7143"
      colors[1] = "#f6f6f6"
    when "yellow"
      colors[0]= "#FFFF00"
      colors[1] = "#383838"
    when "green"
      colors[0] = "#abd96d"
      colors[1] = "#383838"
    when "blue"
      colors[0] = "#042a7b"
      colors[1] = "#FFFF00"
    when "indigo"
      colors[0] = "#26294a"
      colors[1] = "#F4A78A"
    when "violet"
      colors[0] = "#AD85D6"
      colors[1] = "#000000"
    else
      colors[0] = "#f6f6f6"
      colors[1]= "#000000"
    end
    colors
  end
end
