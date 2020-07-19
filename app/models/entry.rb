class Entry  < ActiveRecord::Base
  belongs_to :character
  belongs_to :log
  belongs_to :prompt
end
