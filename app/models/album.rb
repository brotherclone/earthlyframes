class Album < ActiveRecord::Base
  has_one :image, :as => :imageable, :dependent => :destroy
  has_many :songs
  def self.release_types
    %w{'EP' 'LP' 'Single'}
  end
  def self.release_formats
    %w{'Digital' 'CD' 'Vinyl' 'Flash Drive+'}
  end
end
