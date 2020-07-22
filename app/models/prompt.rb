class Prompt < ActiveRecord::Base
  has_many :entries
  belongs_to :song
end
