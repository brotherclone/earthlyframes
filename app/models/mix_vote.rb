class MixVote < ApplicationRecord
  validates :email, presence: true
  validates :mix_selections, presence: true
  validates :selected_mix, presence: true, if: -> { false } # deprecated, keep for migration compatibility
  validates :selected_cover, presence: true
end

