class RemoveVideos < ActiveRecord::Migration[7.0]
  def up
    drop_table :videos
  end

  def down
    create_table :videos do |t|
      t.string :title
      t.text :description
      t.integer :video_type
      t.string :video_service_id
      t.bigint :song_id
    end
    add_index :videos, :song_id
  end
end
