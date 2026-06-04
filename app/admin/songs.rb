ActiveAdmin.register Song do

  permit_params :title,
                :trt,
                :notes,
                :lyrics,
                :album_id,
                :song_order,
                streaming_links_attributes: [:id, :link, :streaming_service_id, :_destroy],
                embeds_attributes: [:id, :player_identifier, :artist_link, :color, :text_color, :song_id, :streaming_service_id, :embed_code, :_destroy ]

  form(:html => {:multipart => true}) do |f|
    f.inputs do
      f.input :title
      f.input :trt, :label => 'Total Running Time'
      f.input :song_order, :label => 'Sequence on Album'
      f.input :album_id, :label => 'Album', :as => :select, :collection => Album.all.map{|a| ["#{a.title}", a.id]}
      f.input :lyrics, :input_html => { :class => 'tinymce' }
      f.input :notes, :input_html => { :class => 'tinymce' }
      f.inputs do
        f.has_many :streaming_links, heading: "Streaming Links", allow_destroy: true, new_record: "Add a link", remove_record: "Delete link" do |s|
          s.input :link, :label => 'Link'
          s.input :streaming_service, :label => 'Streaming Service', :as => :select, :collection => StreamingService.all.map{|b| ["#{b.name}", b.id]}
        end
        f.has_many :embeds, heading: "Embeds", allow_destroy: true, new_record: "Create Embed", remove_record: "Delete" do |e|
          e.input :embed_code
          e.input :player_identifier
          e.input :artist_link
          e.input :color
          e.input :text_color
          e.input :streaming_service_id, :label => 'Streaming Service', :as => :select, :collection => StreamingService.all.map{|a| ["#{a.name}", a.id]}
        end
      end
    end
    f.actions
  end
  
end
