class CharacterRole  < ActiveRecord::Base

  def as_json(options={})
    super(:only => [:id, :role])
  end

end
