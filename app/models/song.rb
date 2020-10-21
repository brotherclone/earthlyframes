class Song < ActiveRecord::Base
  validates :title, presence: true
  belongs_to :album
  has_one :video
  accepts_nested_attributes_for :album
  has_many :streaming_links
  accepts_nested_attributes_for :streaming_links
  has_many :prompts
end
