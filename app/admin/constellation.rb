ActiveAdmin.register Constellation do

  permit_params :name, :description, song_constellations_attributes: [:id, :song_id, :sequence_number, :_destroy]

  form(html: { multipart: true }) do |f|
    f.inputs do
      f.input :name
      f.input :description
      f.inputs do
        f.has_many :song_constellations, heading: "Songs", allow_destroy: true,  new_record: "Add a song", remove_record: "Delete a song" do |s|
          s.input :sequence_number, :label => 'Sequence Number'
          s.input :song, :label => 'Song', :as => :select, :collection => Song.all.map{|b| ["#{b.album.title} - #{b.title}", b.id]}
        end
      end
    end
    f.actions
  end
end
