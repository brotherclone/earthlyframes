class Album < ApplicationRecord
  mount_uploader :cover, PhotosUploader
  mount_uploader :rainbow_portrait, PhotosUploader
  validates :title, presence: true
  has_many :songs, -> { order(song_order: :asc) }
  has_many :album_streaming_links, dependent: :destroy
  enum rainbow_table: %i[not_associated black red orange yellow green blue indigo violet white]
  has_many :release_formats, dependent: :destroy
  has_many :music_formats, :through => :release_formats
  accepts_nested_attributes_for :release_formats, :allow_destroy => true
  accepts_nested_attributes_for :album_streaming_links, :allow_destroy => true

  def as_json(options = {})
    super(:only => [:id, :title, :brief_description, :description, :cover, :rainbow_table],
          :include => {
            :songs => {
              :only => [:id, :song_order, :title, :trt]
            },
            :album_streaming_links => {
              :only => [:link],
              :include => {
                :streaming_service => {
                  :only => [:name]
                }
              }
            }
          }
    )
  end
end
