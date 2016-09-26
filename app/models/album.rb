class Album < ActiveRecord::Base
  mount_uploader :cover, PhotosUploader
  validates :title, presence: true
  has_many :songs, -> { order(song_order: :asc) }
end
