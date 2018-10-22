class Video < ActiveRecord::Base
  validates :video_service_id, presence: true
  belongs_to :song
  accepts_nested_attributes_for :song
end
