class StreamingLinksHaveStreamingServices < ActiveRecord::Migration[5.2]
  def up
    add_reference :streaming_links, :streaming_service, index:true
  end

  def down
    remove_reference :streaming_links, :streaming_service
  end

end
