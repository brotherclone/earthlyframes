class Post < ApplicationRecord
  validates :title, presence: true
  mount_uploader :main_image, PhotosUploader

  def self.ransackable_attributes(auth_object = nil)
    %w[body created_at description id is_live main_image title updated_at]
  end

  def as_json(options = {})
    super(:only => [:id, :title, :body, :description, :main_image])
  end
end
