class CreateStreamingLinks < ActiveRecord::Migration[5.2]
  def up
    create_table :streaming_links do |t|
      t.timestamps
      t.string :link
    end
  end

  def down
    drop_table :streaming_links
  end
end
