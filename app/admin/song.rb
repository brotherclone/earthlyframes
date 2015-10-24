ActiveAdmin.register Song do

  permit_params :title, :trt, :notes, :lyrics, :albums_id

end
