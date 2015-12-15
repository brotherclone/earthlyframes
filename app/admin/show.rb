ActiveAdmin.register Show do

  permit_params :title,:showdate,:description,:location,:link,:flyer

  form(:html => { :multipart => true }) do |f|
    f.inputs do
      f.input :title
      f.input :showdate, as: :datepicker
      f.input :description, :input_html => { :class => 'tinymce' }
      f.input :location
      f.input :link, :label => 'Link to event or venue'
      f.input :flyer, :as => :file
      f.input :flyer_cache, :as => :hidden
    end
    f.actions
  end


end
