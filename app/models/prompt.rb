class Prompt < ActiveRecord::Base

  enum encounter_type: [:normal, :start, :penultimate, :end]
  has_many :entries
  belongs_to :song

  def as_json(options={})
    super(:only => [:id, :prompt_title, :prompt_text, :song_id, :prompt_image, :damage, :encounter_type])
  end

end
