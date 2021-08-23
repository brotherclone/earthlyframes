ActiveAdmin.register Post do

  permit_params :body, :title, :main_image, :inline_image, :description, :overlay_bright, :is_live, :post_date

  form(:html => {:multipart => true}) do |f|
    f.inputs do
      f.input :title
      f.input :description
      f.input :body, :input_html => { :class => 'tinymce' }
      f.input :post_date, as: :datepicker
      f.input :main_image, :as => :file
      f.input :main_image_cache, :as => :hidden
      f.input :overlay_bright, :as => :radio
      f.input :is_live, :label => 'Publish?', :as => :radio
      f.input :inline_image, :as => :file
      f.input :inline_image_cache, :as => :hidden
    end
    f.actions
  end

end
