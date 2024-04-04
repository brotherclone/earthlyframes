class MusicFormat < ApplicationRecord
  validates :name, presence: true
  has_many :release_formats, dependent: :destroy
  has_many :albums, :through => :release_formats

  def self.ransackable_associations(auth_object = nil)
    %w[albums release_formats]
  end

  def self.ransackable_attributes(auth_object = nil)
    %w[created_at id name updated_at]
  end

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
