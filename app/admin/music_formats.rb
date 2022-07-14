ActiveAdmin.register MusicFormat do
  permit_params :name
  form(:html => {:multipart => true}) do |f|
    f.inputs do
      f.input :name
    end
    f.actions
    end
end
