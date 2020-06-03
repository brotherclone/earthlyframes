class CreateStreamingServices < ActiveRecord::Migration[5.2]
  def up
    create_table :streaming_services do |t|
      t.timestamps
      t.string :name
      t.string :icon_url
    end
  end

  def down
    drop_table :streaming_services
  end
end
