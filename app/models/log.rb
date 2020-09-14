class Log  < ActiveRecord::Base
  has_many :characters
  has_one :tag

  def as_json(options={})
    super(:only => [:id, :title])
  end
end
