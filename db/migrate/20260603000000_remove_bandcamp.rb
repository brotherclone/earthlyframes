class RemoveBandcamp < ActiveRecord::Migration[7.0]
  def up
    bandcamp = StreamingService.find_by(name: "Bandcamp")
    return unless bandcamp

    StreamingLink.where(streaming_service_id: bandcamp.id).delete_all
    AlbumStreamingLink.where(streaming_service_id: bandcamp.id).delete_all
    Album.where("buy_link LIKE ?", "%bandcamp.com%").update_all(buy_link: nil)
    bandcamp.destroy
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
