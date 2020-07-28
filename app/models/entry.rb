class Entry  < ActiveRecord::Base
  belongs_to :character
  belongs_to :prompt
  accepts_nested_attributes_for :character
  accepts_nested_attributes_for :prompt
end
