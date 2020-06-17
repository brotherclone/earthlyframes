class Post < ActiveRecord::Base
  mount_uploader :main_image, PhotosUploader
  mount_uploader :inline_image, PhotosUploader
  validates :title, presence: true

  def next_post
    Post.where('post_date > ? AND is_live = ?', post_date, is_live).order(post_date: :asc).first
  end

  def prev_post
    Post.where('post_date < ? AND is_live = ?', post_date, is_live).order(post_date: :desc).first
  end

  def as_json(options={})
    super(:only => [:id, :body, :title, :inline_image, :main_image, :description, :post_date],
          :include => {}
    )
  end

end
