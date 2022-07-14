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

end

