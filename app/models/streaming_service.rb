class StreamingService < ApplicationRecord
  has_many :streaming_links, dependent: :destroy
  validates :name, presence: true
  has_many :embeds, dependent: :destroy

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
