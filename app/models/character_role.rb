class CharacterRole  < ActiveRecord::Base

  def as_json(options={})
    super(:only => [:id, :character_role])
  end

end
