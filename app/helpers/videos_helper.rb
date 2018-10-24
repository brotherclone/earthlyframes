module VideosHelper
  def services
    {:you_tube => "YouTube", :vimeo => "Vimeo"}
  end
  def video_url(video)
    video_services = services
    if video.video_type == video_services[:vimeo]
      "https://player.vimeo.com/video/" + video.video_service_id
    elsif video.video_type == video_services[:you_tube]
      "https://www.youtube.com/watch?v=" + video.video_service_id
    else
      "#"
    end
  end
end
