class Constellation < ApplicationRecord
  validates :name, presence: true
  has_many :song_constellations, dependent: :destroy
  has_many :songs, :through => :song_constellations
  accepts_nested_attributes_for :song_constellations, :allow_destroy => true
end
