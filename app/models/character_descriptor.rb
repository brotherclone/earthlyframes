class CharacterDescriptor < ActiveRecord::Base

  def as_json(options={})
    super(:only => [:id, :descriptor])
  end

end
