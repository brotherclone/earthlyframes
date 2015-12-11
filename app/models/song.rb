class Song < ActiveRecord::Base
  validates :title, presence: true
  belongs_to :album
  accepts_nested_attributes_for :album
end
