class StreamingService < ApplicationRecord
  has_many :streaming_links, dependent: :destroy
  validates :name, presence: true
  has_many :embeds, dependent: :destroy

  def as_json(options = {})

  end
end
