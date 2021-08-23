class Character < ActiveRecord::Base
  belongs_to :character_background
  belongs_to :character_setting
  belongs_to :character_descriptor
  belongs_to :character_role
  belongs_to :user
  belongs_to :log
  has_many :entries
  validates :name, presence: true


end
