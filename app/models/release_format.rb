class ReleaseFormat < ApplicationRecord
  belongs_to :album
  belongs_to :music_format
end
