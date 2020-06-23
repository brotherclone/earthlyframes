class Album < ActiveRecord::Base
  mount_uploader :cover, PhotosUploader
  validates :title, presence: true
  has_many :songs, -> { order(song_order: :asc) }
  has_many :streaming_links
  accepts_nested_attributes_for :streaming_links

  def as_json(options={})
    super(:only => [:title,
                    :cover,
                    :description,
                    :price,
                    :released,
                    :buylink,
                    :format,
                    :brief_description],
                      :include => {:songs => {:only =>[:title,
                                                       :trt,
                                                       :notes,
                                                       :lyrics], :order => 'song_order desc',
                                                        :include => [{:video => {:methods=> :video_embed_url, :only => [ :title, :description, :video_type]}},
                                                                     {:streaming_links => { :methods=> :streaming_service_name,:only=>[:link]}}]
            }
          }
    )
  end
end