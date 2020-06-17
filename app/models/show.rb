class Show < ActiveRecord::Base
  mount_uploader :flyer, PhotosUploader
  validates :title, :showdate, presence: true

  def as_json(options={})
    super(:only => [:id, :title, :showdate, :brief_description, :description, :location, :link, :flyer],
          :include => {}
    )
  end

end
