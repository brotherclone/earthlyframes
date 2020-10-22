ActiveAdmin.register Song do

  permit_params :title, :trt, :notes, :lyrics, :album_id, :song_order,
  streaming_links_attributes: [:id, :link, :streaming_service_id]

  form(:html => {:multipart => true}) do |f|
    f.inputs do
      f.input :title
      f.input :trt, :label => 'Total Running Time'
      f.input :song_order, :label => 'Sequence on Album'
      f.input :album_id, :label => 'Album', :as => :select, :collection => Album.all.map{|a| ["#{a.title}", a.id]}
      f.input :lyrics, :input_html => { :class => 'tinymce' }
      f.input :notes, :input_html => { :class => 'tinymce' }
      f.inputs do
        f.has_many :streaming_links, heading: "Streaming Links", allow_destroy: true, new_record: true do |s|
          s.input :link, :label => 'Link'
          s.input :streaming_service, :label => 'Streaming Service', :as => :select, :collection => StreamingService.all.map{|b| ["#{b.name}", b.id]}
        end
      end
    end
    f.actions
  end

  index do
    selectable_column
    column :title
    column :album
  end

end
