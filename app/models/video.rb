class Video < ActiveRecord::Base
  validates :video_service_id, presence: true
  belongs_to :song
  accepts_nested_attributes_for :song

  def services
    {:you_tube => "YouTube", :vimeo => "Vimeo"}
  end

  def video_embed_url
    video_services = services
    if video_type == video_services[:vimeo]
      "https://player.vimeo.com/video/" + video_service_id
    elsif video_type == video_services[:you_tube]
      "https://www.youtube.com/watch?v=" + video_service_id
    else
      "#"
    end
  end

  def as_json(options={})
    super(:only => [:title, :video_type], :methods=> [:video_embed_url], :include => {:song=> {:only =>[:title], :include=> {:album=>{:only=>[:title]}}}})
  end

  end
