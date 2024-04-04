class AlbumStreamingLink < ApplicationRecord
  belongs_to :streaming_service
  belongs_to :album
  validates :link, presence: true

  def self.ransackable_attributes(auth_object = nil)
    %w[
      album_id
      created_at
      id
      link
      streaming_service_id
      updated_at
    ]
  end

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
