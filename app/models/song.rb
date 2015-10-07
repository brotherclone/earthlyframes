class Song < ActiveRecord::Base
  validates :title, :albums_id, presence: true
  belongs_to :album, :foreign_key =>'albums_id'
end
