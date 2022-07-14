class Video < ApplicationRecord
  validates :video_service_id, presence: true
  belongs_to :song
end
