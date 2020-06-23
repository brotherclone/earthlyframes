ActiveAdmin.register Album do

  permit_params :title, :cover, :description, :price, :released, :buylink, :format, :brief_description, :is_live,
                streaming_links_attributes: [:id, :link, :streaming_service_id]

  form(:html => {:multipart => true}) do |f|
    f.inputs do
      f.input :title
      f.input :brief_description
      f.input :format
      f.input :description, :label => 'Description'
      f.input :price
      f.input :released, :as => :datepicker
      f.input :buylink
      f.input :is_live, :label => 'Publish?', :as => :radio
      f.input :cover, :as => :file
      f.input :cover_cache, :as => :hidden
      f.inputs do
        f.has_many :streaming_links, heading: "Streaming Links", allow_destroy: true, new_record: true do |s|
          s.input :link, :label => 'Link'
          s.input :streaming_service, :label => 'Streaming Service', :as => :select, :collection => StreamingService.all.map{|b| ["#{b.name}", b.id]}
        end
      end
    end
    f.actions
  end

end
