module SongsHelper

  def get_streaming_link_for_embed(streaming_service_id, streaming_links)
    sound_cloud_link = ""
    streaming_links.each do |link|
      if link.streaming_service.id == streaming_service_id
        sound_cloud_link = link.link
      end
    end
    sound_cloud_link
  end

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
      when "video"
        if song.videos > 1
          "videos"
        else
          "video"
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
    if song.videos.length >=1 || song.embeds.length >= 1 || song.streaming_links.length > 0
      detail = true
    end
    detail
  end

end

