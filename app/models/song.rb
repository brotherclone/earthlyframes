class Song < ApplicationRecord
  validates :title, presence: true
  belongs_to :album
  has_many :videos, dependent: :destroy
  has_many :streaming_links, dependent: :destroy
  has_many :song_constellations, dependent: :destroy
  has_many :constellations, :through => :song_constellations
  has_many :embeds, dependent: :destroy
  accepts_nested_attributes_for :streaming_links, :allow_destroy => true
  accepts_nested_attributes_for :embeds, :allow_destroy => true

  def self.ransackable_associations(auth_objects = nil)
    %w[
    constellations
    embeds
    song_constellations
    streaming_links
    ]
  end

  def self.ransackable_attributes(auth_object = nil)
    %w[
      album_id
      created_at
      id
      lyrics
      notes
      song_order
      title
      trt
      updated_at
      videos_id
    ]
  end


  def as_json(options = {})
    super(:only => [:album_id, :id, :title, :song_order, :trt, :notes, :lyrics],
          :include => {
            :streaming_links => {
              :only => [:link],
              :include => {
                :streaming_service => {
                  :only => [:name],
                  :include=> {
                    :embeds =>{
                      :only => [:embed_code]
                    }
                  }
                }
              },
            },
            :videos=>{
              :only => [:title, :description, :video_service_id, :video_type]
            }
          }
        )
  end

end
