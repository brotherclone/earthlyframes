class CharacterRole < ApplicationRecord
  belongs_to :log
  validates_uniqueness_of :background, scope: :log_id
end
