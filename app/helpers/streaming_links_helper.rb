module StreamingLinksHelper
  def get_service_icon(streaming_service_name)
    case streaming_service_name
    when "Apple Music"
      "fab fa-apple"
    when "Apple"
      "fab fa-apple"
    when "Bandcamp"
      "fab fa-bandcamp"
    when "Spotify"
      "fab fa-spotify"
    when "Amazon Music"
      "fab fa-amazon"
    when "Amazon"
      "fab fa-amazon"
    else
      "fa-solid fa-music"
    end
  end
end