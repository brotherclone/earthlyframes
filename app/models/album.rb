class Album < ActiveRecord::Base
  mount_uploader :cover, PhotosUploader
  validates :title, presence: true
  has_many :songs, -> { order(song_order: :asc) }

  def as_json(options={})
    super(:only => [:title, :cover, :description, :price, :released, :buylink, :format, :brief_description],
          :include => {:songs => {:only =>[:title, :trt, :notes, :lyrics], :order => 'song_order desc'}}
    )
  end
end
