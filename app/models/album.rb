class Album < ApplicationRecord
  mount_uploader :cover, PhotosUploader
  mount_uploader :rainbow_portrait, PhotosUploader
  validates :title, presence: true
  validates :rainbow_table, presence: true
  has_many :songs, -> { order(song_order: :asc) }
  has_many :album_streaming_links, dependent: :destroy
  enum :rainbow_table, {
    not_associated: 0,
    black: 1,
    red: 2,
    orange: 3,
    yellow: 4,
    green: 5,
    blue: 6,
    indigo: 7,
    violet: 8,
    white: 9
  }
  has_many :release_formats, dependent: :destroy
  has_many :music_formats, :through => :release_formats
  accepts_nested_attributes_for :release_formats, :allow_destroy => true
  accepts_nested_attributes_for :album_streaming_links, :allow_destroy => true

  def self.ransackable_associations(auth_objects = nil)
    %w[
    album_streaming_links
    music_formats
    release_formats
    songs
    ]
  end

  def self.ransackable_attributes(auth_object = nil)
    %w[
      brief_description
      buy_link
      cover
      created_at
      description
      id
      is_live
      price
      rainbow_portrait
      rainbow_table
      released
      title
      updated_at
    ]
  end


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
