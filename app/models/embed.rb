class Embed < ApplicationRecord
  validates :player_identifier, presence: true
  belongs_to :song
  belongs_to :streaming_service
end
