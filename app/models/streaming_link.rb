class StreamingLink < ApplicationRecord
  belongs_to :streaming_service
  belongs_to :song
  validates :link, presence: true

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
