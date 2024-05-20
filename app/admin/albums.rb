ActiveAdmin.register Album do

  permit_params :title,
                :cover,
                :description,
                :price,
                :released,
                :buy_link,
                :brief_description,
                :is_live,
                :rainbow_table,
                :rainbow_portrait,
                release_formats_attributes: [:id, :name, :music_format_id, :_destroy],
                album_streaming_links_attributes: [:id, :link, :streaming_service_id, :_destroy]

  form(:html => {:multipart => true}) do |f|
    f.inputs do
      f.input :title
      f.input :brief_description
      f.input :description, :input_html => { :class => 'tinymce' }
      f.input :price
      f.input :released, :as => :datepicker
      f.inputs do
        f.has_many :release_formats, heading: "Formats", allow_destroy: true do |c|
          c.input :music_format, :as => :select, :collection => MusicFormat.all.map{ |m| [m.name, m.id]}
        end
      end
      f.input :buy_link
      f.input :is_live, :label => 'Publish?', :as => :radio
      f.input :cover, :as => :file
      f.input :cover_cache, :as => :hidden
      f.input :rainbow_table, :label => 'Rainbow Table', :as => :select, :collection => Album.rainbow_tables.keys, :selected=>'not_associated'
      f.input :rainbow_portrait, :as => :file
      f.input :rainbow_portrait_cache, :as => :hidden
      f.inputs do
        f.has_many :album_streaming_links, heading: "Streaming Links", allow_destroy: true do |s|
          s.input :link, :label => 'Link'
          s.input :streaming_service, :label => 'Streaming Service', :as => :select, :collection => StreamingService.all.map{|b| ["#{b.name}", b.id]}
        end
      end
    end
    f.actions
  end
end