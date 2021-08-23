class StreamingLink <  ActiveRecord::Base
  belongs_to :album
  accepts_nested_attributes_for :album
  belongs_to :song
  accepts_nested_attributes_for :song
  belongs_to :streaming_service
  accepts_nested_attributes_for :streaming_service


  def streaming_service_name
    streaming_service.name.to_s
  end

end
