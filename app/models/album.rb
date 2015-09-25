class Album < ActiveRecord::Base
  has_one :image, :as => :imageable, :dependent => :destroy
  has_many :songs
  has_one :albumformat
  has_one :albumtype
end
