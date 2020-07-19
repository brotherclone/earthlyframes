class Log < ApplicationRecord
  has_many :entries
  has_many :character_backgrounds
  has_many :character_roles
end
