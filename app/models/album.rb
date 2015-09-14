class Album < ActiveRecord::Base
  has_one :image, :as => :imageable, :dependent => :destroy
  has_many :songs
end
