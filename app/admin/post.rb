ActiveAdmin.register Post do

  permit_params :body,:title,:main_image,:inline_image

  form(:html => { :multipart => true }) do |f|
    f.inputs do
      f.input :title
      f.input :body, :input_html => { :class => 'tinymce' }
      f.input :main_image, :as => :file
      f.input :main_image_cache, :as => :hidden
      f.input :inline_image, :as => :file
      f.input :inline_image_cache, :as => :hidden
    end
    f.actions
  end


end
