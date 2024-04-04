class StreamingService < ApplicationRecord
  has_many :streaming_links, dependent: :destroy
  validates :name, presence: true
  has_many :embeds, dependent: :destroy


  def self.ransackable_associations(auth_object = nil)
    %w[embeds streaming_links]
  end

  def self.ransackable_attributes(auth_object = nil)
    %w[created_at icon id name updated_at]
  end

  def as_json(options = {})
    super(:only => [:name, :id],
          :include => {
            :streaming_links => {
              :only => [:link],
              :include => {
                :song => {
                  :only => [:title, :album_id],
                }
              }
            }
          }
    )
  end
end
