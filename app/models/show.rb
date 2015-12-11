class Show < ActiveRecord::Base
  mount_uploader :flyer, PhotosUploader
  validates :title, :showdate, presence: true
end
