ActiveAdmin.register Song do
  permit_params :title, :trt, :notes, :lyrics, :album_id, :song_order

  form(:html => {:multipart => true}) do |f|
    f.inputs do
      f.input :album_id, :label => 'Album', :as => :select, :collection => Album.all.map{|a| ["#{a.title}", a.id]}
      f.input :title
      f.input :trt
      f.input :song_order
      f.input :notes, :input_html => { :class => 'tinymce' }
      f.input :lyrics, :input_html => { :class => 'tinymce' }
    end
    f.actions
    end
end