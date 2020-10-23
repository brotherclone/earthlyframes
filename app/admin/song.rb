ActiveAdmin.register Song do

  permit_params :title

  form(:html => {:multipart => true}) do |f|
    f.inputs do
      f.input :title
    end
    f.actions
  end


end
