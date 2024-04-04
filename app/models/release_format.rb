class ReleaseFormat < ApplicationRecord
  belongs_to :album
  belongs_to :music_format

  def self.ransackable_attributes(auth_object = nil)
    %w[
      album_id
      created_at
      id
      music_format_id
      updated_at
    ]
  end
end
