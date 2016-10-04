class Post < ActiveRecord::Base
  mount_uploader :main_image, PhotosUploader
  mount_uploader :inline_image, PhotosUploader
  validates :title, presence: true
  def next_post
    Post.where('post_date > ?', post_date).order(post_date: :asc).first
  end
  def prev_post
    Post.where('post_date < ?', post_date).order(post_date: :asc).first
  end
end
