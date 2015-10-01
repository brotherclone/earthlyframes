class Album < ActiveRecord::Base
  validates :releasedate, :title, presence: true
  has_many :releases
  has_many :songs
end
