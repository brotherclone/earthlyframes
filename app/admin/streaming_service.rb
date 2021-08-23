ActiveAdmin.register StreamingService do

  permit_params :name, :icon_url

  form(:html => { :multipart => true }) do |f|
    f.inputs do
      f.input :name, :label => 'Service Name'
      f.input :icon_url, :label => 'Font Awesome Icon ID'
    end
    f.actions
  end
end