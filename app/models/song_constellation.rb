class SongConstellation < ApplicationRecord
  validates :sequence_number, presence: true
  belongs_to :song
  belongs_to :constellation
end
