class CreateVideos < ActiveRecord::Migration[5.2]
  def up
    create_table :videos do |t|
      t.timestamps
      t.string :title
      t.string :description
      t.string :video_type
      t.string :video_service_id
    end
  end

  def down
    drop_table :videos
  end
end
