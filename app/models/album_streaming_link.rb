class AlbumStreamingLink < ApplicationRecord
  belongs_to :streaming_service
  belongs_to :album
  validates :link, presence: true

  def as_json(options = {})
    super(:only => [:link],
          :include => {
            :album => {
              :only => [:title]
            },
            :streaming_service => {
              :only => [:name]
            }
          }
        )
  end

end
