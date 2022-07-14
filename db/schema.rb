# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_04_29_180951) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "album_streaming_links", force: :cascade do |t|
    t.string "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "album_id"
    t.bigint "streaming_service_id"
    t.index ["album_id"], name: "index_album_streaming_links_on_album_id"
    t.index ["streaming_service_id"], name: "index_album_streaming_links_on_streaming_service_id"
  end

  create_table "albums", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "cover"
    t.date "released"
    t.string "buy_link"
    t.text "brief_description"
    t.boolean "is_live"
    t.integer "rainbow_table"
    t.string "rainbow_portrait"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "price"
  end

  create_table "constellations", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "embeds", force: :cascade do |t|
    t.string "player_identifier"
    t.string "artist_link"
    t.string "color"
    t.string "text_color"
    t.string "embed_code"
    t.bigint "streaming_service_id"
    t.bigint "song_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["song_id"], name: "index_embeds_on_song_id"
    t.index ["streaming_service_id"], name: "index_embeds_on_streaming_service_id"
  end

  create_table "music_formats", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.string "main_image"
    t.string "description"
    t.boolean "is_live"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "release_formats", force: :cascade do |t|
    t.bigint "music_format_id"
    t.bigint "album_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["album_id"], name: "index_release_formats_on_album_id"
    t.index ["music_format_id"], name: "index_release_formats_on_music_format_id"
  end

  create_table "song_constellations", force: :cascade do |t|
    t.bigint "song_id"
    t.bigint "constellation_id"
    t.integer "sequence_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["constellation_id"], name: "index_song_constellations_on_constellation_id"
    t.index ["song_id"], name: "index_song_constellations_on_song_id"
  end

  create_table "songs", force: :cascade do |t|
    t.string "title"
    t.string "trt"
    t.text "notes"
    t.text "lyrics"
    t.integer "song_order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "album_id"
    t.index ["album_id"], name: "index_songs_on_album_id"
  end

  create_table "streaming_links", force: :cascade do |t|
    t.string "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "song_id"
    t.bigint "streaming_service_id"
    t.index ["song_id"], name: "index_streaming_links_on_song_id"
    t.index ["streaming_service_id"], name: "index_streaming_links_on_streaming_service_id"
  end

  create_table "streaming_services", force: :cascade do |t|
    t.string "name"
    t.string "icon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "videos", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "video_type"
    t.string "video_service_id"
    t.bigint "song_id"
    t.index ["song_id"], name: "index_videos_on_song_id"
  end

end
