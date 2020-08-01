class CharacterBackground  < ActiveRecord::Base

  def as_json(options={})
    super(:only => [:id, :background])
  end

end
