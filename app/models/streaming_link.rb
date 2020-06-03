class StreamingLink <  ActiveRecord::Base
  belongs_to :album
  accepts_nested_attributes_for :album
  belongs_to :song
  accepts_nested_attributes_for :song
  belongs_to :streaming_service
  accepts_nested_attributes_for :streaming_service
end
