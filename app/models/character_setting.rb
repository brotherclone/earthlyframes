class CharacterSetting  < ActiveRecord::Base

  def as_json(options={})
    super(:only => [:id, :time, :place])
  end

end
