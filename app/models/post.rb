class Post < ApplicationRecord
  validates :title, presence: true
  mount_uploader :main_image, PhotosUploader
  def as_json(options = {})
    super(:only => [:id, :title, :body, :description, :main_image])
  end
end
