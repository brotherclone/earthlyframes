class Show < ActiveRecord::Base
  validates :title, :showdate, presence: true
end
