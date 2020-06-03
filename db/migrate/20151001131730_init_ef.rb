class InitEf < ActiveRecord::Migration[5.2]
  def up
    create_table :albums do |d|
      d.string :title
      d.date :releasedate
      d.text :description
    end

    create_table :releases do |r|
      r.string :title
      r.string :format
      r.string :price
      r.belongs_to :albums, index: true
    end

    create_table :songs do |s|
      s.string :title
      s.string :trt
      s.text :notes
      s.text :lyrics
      s.belongs_to :albums, index: true
    end

    create_table :posts do |p|
      p.string :title
      p.text :body
    end

    create_table :shows do |h|
      h.string :title
      h.datetime :when
      h.text :description
      h.string :location
      h.string :link
    end

    create_table :images do |i|
      i.string :name
      i.references :imageable, polymorphic: true, index: true
    end
  end

  def down
    drop_table :albums
    drop_table :releases
    drop_table :songs
    drop_table :shows
    drop_table :images
    drop_table :posts
  end

end
