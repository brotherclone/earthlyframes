class CharacterDescriptor < ActiveRecord::Base

  def as_json(options={})
    super(:only => [:id, :descriptor, :image_url])
  end

end
