class StreamingLink < ApplicationRecord
  belongs_to :streaming_service
  belongs_to :song
  validates :link, presence: true

  def self.ransackable_attributes(auth_object = nil)
    %w[created_at id link song_id streaming_service_id updated_at]
  end

  def as_json(options = {})
    super(:only => [:link],
          :include => {
            :streaming_service => {
              :only => [:name]
            },
            :song =>{
              :only => [:title, :album_id],
            }
          }
        )
  end

end
