module SongsHelper

  def title_track(song)
    if song.title === song.album.title
      song.album.title
    else
      song.title +  " from " + song.album.title
    end
  end

  def pluralize_for_song(song, sub_item)
    case sub_item
      when "streaming_service"
        if song.streaming_links > 1
          "streaming services"
        else
          "streaming service"
        end
    else
      "unknown song association"
    end
  end

  def check_for_details(song)
    detail = false
    if song.lyrics.length > 1 || song.notes.length > 1
      detail = true
    end
    if song.embeds.length >= 1 || song.streaming_links.length > 0
      detail = true
    end
    detail
  end

  def order_streaming_links_for_song(song)
    song.streaming_links.joins(:streaming_service).order('streaming_services.name')
  end

end

