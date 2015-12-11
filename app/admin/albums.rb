ActiveAdmin.register Album do

  permit_params :title, :cover, :description, :price, :released, :buylink, :format

  form(:html => { :multipart => true }) do |f|
    f.inputs do
      f.input :title
      f.input :description, :input_html => { :class => 'tinymce' }
      f.input :price
      f.input :released, :as => :datepicker
      f.input :buylink
      f.input :format
      f.input :cover, :as => :file
      f.input :cover_cache, :as => :hidden
    end
    f.actions
  end

end
