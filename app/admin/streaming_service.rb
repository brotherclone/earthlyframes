ActiveAdmin.register StreamingService do

  permit_params :link, :icon_url

  form(:html => { :multipart => true }) do |f|
    f.inputs do
      f.input :name, :label => 'Service Name'
      f.input :icon_url, :label => 'Icon URL'
    end
    f.actions
  end
end