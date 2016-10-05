ActiveAdmin.register Song do

  permit_params :title, :trt, :notes, :lyrics, :album_id, :song_order

  form(:html => { :multipart => true }) do |f|
    f.inputs do
      f.input :title
      f.input :trt, :label => 'Total Running Time'
      f.input :song_order, :label => 'Sequence on Album'
      f.input :album_id, :label => 'Album', :as => :select, :collection => Album.all.map{|a| ["#{a.title}", a.id]}
      f.input :lyrics, :input_html => { :class => 'tinymce' }, :hint => 'Lyrics for the song.'
      f.input :notes, :input_html => { :class => 'tinymce' }, :hint => 'Notes on the song.'
    end
    f.actions
  end

end
