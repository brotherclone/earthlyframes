class SongConstellation < ApplicationRecord
  validates :sequence_number, presence: true
  belongs_to :song
  belongs_to :constellation

  def self.ransackable_attributes(auth_object = nil)
    %w[constellation_id created_at id sequence_number song_id updated_at]
  end

end
