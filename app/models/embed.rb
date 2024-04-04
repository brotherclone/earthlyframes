class Embed < ApplicationRecord
  validates :player_identifier, presence: true
  belongs_to :song
  belongs_to :streaming_service

  def self.ransackable_attributes(auth_object = nil)
    %w[artist_link color created_at embed_code id player_identifier song_id streaming_service_id text_color updated_at]
  end

end
