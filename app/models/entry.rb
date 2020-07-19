class Entry < ApplicationRecord
  belongs_to :character
  belongs_to :log
  belongs_to :prompt
end
