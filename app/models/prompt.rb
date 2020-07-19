class Prompt < ApplicationRecord
  has_many :entries
  belongs_to :song
end
