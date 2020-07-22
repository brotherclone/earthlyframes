class Prompt < ActiveRecord::Base

  enum encounter_type: [:normal, :start, :penultimate, :end]
  has_many :entries
  belongs_to :song

end
