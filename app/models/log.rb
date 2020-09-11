class Log  < ActiveRecord::Base
  has_many :characters
  has_one :tag
end
