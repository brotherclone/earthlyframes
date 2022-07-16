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
