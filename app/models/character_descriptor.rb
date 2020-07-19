class CharacterDescriptor < ActiveRecord::Base
  belongs_to :log
  accepts_nested_attributes_for :log
end
