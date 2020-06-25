ActiveAdmin.register Video do

  permit_params :title, :description, :video_service_id, :video_type, :song_id

  form(:html => { :multipart => true }) do |f|
    f.inputs do
      f.input :title
      f.input :video_type, :label => 'Type', :as => :select, :collection => ["Vimeo", "YouTube"]
      f.input :video_service_id, :label => 'Id'
      f.input :description, :input_html => { :class => 'tinymce' }
      f.input :song_id, :label => 'Song', :as => :select, :collection => Song.all.map{|s| ["#{s.title}", s.id]}
    end
    f.actions
  end

end
