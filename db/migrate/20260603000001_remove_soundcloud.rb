class RemoveSoundcloud < ActiveRecord::Migration[7.0]
  def up
    soundcloud = StreamingService.find_by(name: "SoundCloud")
    if soundcloud
      Embed.where(streaming_service_id: soundcloud.id).delete_all
      StreamingLink.where(streaming_service_id: soundcloud.id).delete_all
      AlbumStreamingLink.where(streaming_service_id: soundcloud.id).delete_all
      soundcloud.destroy
    end

    Post.where("title = ?", "Open Jukebox").each do |post|
      cleaned = post.body
        .gsub(/ <br \/><iframe src="https:\/\/w\.soundcloud\.com\/.*?<\/iframe><\/p>/m, '</p>')
        .gsub(/<div style="font-size: 10px.*?<\/div>/m, '')
      post.update_columns(body: cleaned)
    end
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
