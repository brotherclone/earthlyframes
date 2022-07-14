class MusicFormat < ApplicationRecord
  validates :name, presence: true
  has_many :release_formats, dependent: :destroy
  has_many :albums, :through => :release_formats

  def as_json(options = {})
    super(:only => [:name],
          :include => {
            :albums => {
              :only => [:title]
            }
          }
    )
  end
end
