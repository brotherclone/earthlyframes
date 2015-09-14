class Song < ActiveRecord::Base
  has_one :album
end
