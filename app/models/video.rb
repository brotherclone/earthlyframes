class Video < ApplicationRecord
  validates :video_service_id, presence: true
  belongs_to :song

  def self.ransackable_associations(auth_object = nil)
    ["song"]
  end

  def self.ransackable_attributes(auth_object = nil)
    %w[description id song_id title video_service_id video_type]
  end

end
