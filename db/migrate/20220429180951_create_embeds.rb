class CreateEmbeds < ActiveRecord::Migration[7.0]
  def self.up
    create_table :embeds do |t|
      t.string :player_identifier
      t.string :artist_link
      t.string :color
      t.string :text_color
      t.string :embed_code
      t.belongs_to :streaming_service
      t.belongs_to :song
      t.timestamps
    end
  end
  def self.down
    drop_table :embeds
  end
end
