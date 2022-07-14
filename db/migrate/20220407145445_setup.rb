class Setup < ActiveRecord::Migration[7.0]

  def self.up

    create_table :admin_users do |t|
      t.string :email, null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.string :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at
      t.timestamps null: false
    end

    add_index :admin_users, :email, unique: true
    add_index :admin_users, :reset_password_token, unique: true

    create_table :active_admin_comments do |t|
      t.string :namespace
      t.text :body
      t.references :resource, polymorphic: true
      t.references :author, polymorphic: true
      t.timestamps
    end

    add_index :active_admin_comments, [:namespace]

    create_table :albums do |t|
      t.string :title
      t.text :description
      t.string :cover
      t.float :price
      t.date :released
      t.string :buy_link
      t.text :brief_description
      t.boolean :is_live
      t.integer :rainbow_table
      t.string :rainbow_portrait
      t.timestamps
    end

    create_table :music_formats do |t|
      t.string :name
      t.timestamps
    end

    create_table :release_formats do |t|
      t.belongs_to :music_format
      t.belongs_to :album
      t.timestamps
    end

    create_table :posts do |t|
      t.string :title
      t.text :body
      t.string :main_image
      t.string :description
      t.boolean :is_live
      t.timestamps
    end

    create_table :songs do |t|
      t.string :title
      t.string :trt
      t.text :notes
      t.text :lyrics
      t.integer :song_order
      t.timestamps
    end

    add_reference :songs, :album, index: true

    create_table :streaming_services do |t|
      t.string :name
      t.string :icon
      t.timestamps
    end

    create_table :streaming_links do |t|
      t.string :link
      t.timestamps
    end

    create_table :album_streaming_links do |t|
      t.string :link
      t.timestamps
    end

    add_reference :streaming_links, :song, index: true
    add_reference :streaming_links, :streaming_service, index: true
    add_reference :album_streaming_links, :album, index: true
    add_reference :album_streaming_links, :streaming_service, index: true

    create_table :videos do |t|
      t.string :title
      t.text :description
      t.integer :video_type
      t.string :video_service_id
    end

    add_reference :videos, :song, index: true

  end

  def self.down
    remove_reference :videos, :song
    drop_table :videos
    remove_reference :streaming_links, :song
    remove_reference :streaming_links, :streaming_service
    remove_reference :album_streaming_links, :album
    remove_reference :album_streaming_links, :streaming_service
    drop_table :streaming_links
    drop_table :album_streaming_links
    drop_table :streaming_services
    remove_reference :songs, :album
    drop_table :songs
    drop_table :posts
    drop_table :release_formats
    drop_table :music_formats
    drop_table :albums
    drop_table :active_admin_comments
    drop_table :admin_users
  end

end
