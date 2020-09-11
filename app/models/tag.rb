class Tag <  ActiveRecord::Base
  belongs_to :user
  accepts_nested_attributes_for :user
  belongs_to :log
  accepts_nested_attributes_for :log
end
