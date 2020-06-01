ActiveAdmin.register StreamingLink do

  permit_params :link, :album_id, :song_id, :streaming_service_id

  form(:html => { :multipart => true }) do |f|
    f.inputs do
      f.input :link, :label => 'Link'
      f.input :album_id, :label => 'Album', :as => :select, :collection => Album.all.map{|a| ["#{a.title}", a.id]}
      f.input :song_id, :label => 'Song', :as => :select, :collection => Song.all.map{|s| ["#{s.title}", s.id]}
      f.input :streaming_service, :label => 'Streaming Service', :as => :select, :collection => StreamingService.all.map{|b| ["#{b.name}", b.id]}
    end
    f.actions
  end
end