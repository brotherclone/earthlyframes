class Song < ActiveRecord::Base
  validates :title, presence: true
  belongs_to :album, :foreign_key =>'albums_id'
end
