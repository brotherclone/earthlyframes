ActiveAdmin.register Post do

  permit_params :body, :title, :main_image,:main_image_cache, :description, :is_live

  form(:html => {:multipart => true}) do |f|
    f.inputs do
      f.input :title
      f.input :description
      f.input :body, :input_html => { :class => 'tinymce' }
      f.input :main_image, :as => :file
      f.input :main_image_cache, :as => :hidden
      f.input :is_live, :label => 'Publish?', :as => :radio
    end
    f.actions
  end

end
