ActiveAdmin.register Show do

  permit_params :title, :showdate, :description, :location, :link, :flyer, :brief_description, :is_live

  form(:html => {:multipart => true}) do |f|
    f.inputs do
      f.input :title
      f.input :showdate, as: :datepicker
      f.input :brief_description
      f.input :description,:hint => 'Show Description'
      f.input :location
      f.input :link, :label => 'Link to event or venue'
      f.input :is_live, :label => 'Publish?', :as => :radio
      f.input :flyer, :as => :file
      f.input :flyer_cache, :as => :hidden
    end
    f.actions
  end


end
