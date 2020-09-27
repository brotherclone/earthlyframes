class Consequence < ActiveRecord::Base

  enum condition: [:unscathed, :wounded, :near_dying, :dead]
  belongs_to :prompt

end
