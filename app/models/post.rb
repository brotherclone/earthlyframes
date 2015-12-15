class Post < ActiveRecord::Base
  mount_uploader :main_image, PhotosUploader
  mount_uploader :inline_image, PhotosUploader
  validates :title, presence: true
end
