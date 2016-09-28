ActiveAdmin.register Album do

  permit_params :title, :cover, :description, :price, :released, :buylink, :format, :brief_description, :is_live

  form(:html => {:multipart => true}) do |f|
    f.inputs do
      f.input :title
      f.input :brief_description
      f.input :format
      f.input :description, :input_html => {:class => 'tinymce'}, :label => 'Description'
      f.input :price
      f.input :released, :as => :datepicker
      f.input :buylink
      f.input :is_live, :label => 'Publish?', :as => :radio
      f.input :cover, :as => :file
      f.input :cover_cache, :as => :hidden
    end
    f.actions
  end

end
