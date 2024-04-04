class Constellation < ApplicationRecord
  validates :name, presence: true
  has_many :song_constellations, dependent: :destroy
  has_many :songs, :through => :song_constellations
  accepts_nested_attributes_for :song_constellations, :allow_destroy => true

  def self.ransackable_associations(auth_object = nil)
    %w[song_constellations songs]
  end

  def self.ransackable_attributes(auth_object = nil)
    %w[created_at description id name updated_at]
  end

end
