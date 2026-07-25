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

ActiveRecord::Schema[8.1].define(version: 2026_07_25_151142) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.bigint "author_id"
    t.string "author_type"
    t.text "body"
    t.datetime "created_at", null: false
    t.string "namespace"
    t.bigint "resource_id"
    t.string "resource_type"
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

  create_table "admin_users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "remember_created_at"
    t.datetime "reset_password_sent_at"
    t.string "reset_password_token"
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "album_streaming_links", force: :cascade do |t|
    t.bigint "album_id"
    t.datetime "created_at", null: false
    t.string "link"
    t.bigint "streaming_service_id"
    t.datetime "updated_at", null: false
    t.index ["album_id"], name: "index_album_streaming_links_on_album_id"
    t.index ["streaming_service_id"], name: "index_album_streaming_links_on_streaming_service_id"
  end

  create_table "albums", force: :cascade do |t|
    t.text "brief_description"
    t.string "buy_link"
    t.string "cover"
    t.datetime "created_at", null: false
    t.text "description"
    t.boolean "is_live"
    t.float "price"
    t.string "rainbow_portrait"
    t.integer "rainbow_table"
    t.date "released"
    t.string "title"
    t.datetime "updated_at", null: false
    t.index ["is_live", "rainbow_table"], name: "index_albums_on_is_live_and_rainbow_table"
    t.index ["is_live"], name: "index_albums_on_is_live"
    t.index ["rainbow_table"], name: "index_albums_on_rainbow_table"
  end

  create_table "constellations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.text "description"
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "embeds", force: :cascade do |t|
    t.string "artist_link"
    t.string "color"
    t.datetime "created_at", null: false
    t.string "embed_code"
    t.string "player_identifier"
    t.bigint "song_id"
    t.bigint "streaming_service_id"
    t.string "text_color"
    t.datetime "updated_at", null: false
    t.index ["song_id"], name: "index_embeds_on_song_id"
    t.index ["streaming_service_id"], name: "index_embeds_on_streaming_service_id"
  end

  create_table "music_formats", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.text "body"
    t.datetime "created_at", null: false
    t.string "description"
    t.boolean "is_live"
    t.string "main_image"
    t.string "title"
    t.datetime "updated_at", null: false
    t.index ["is_live"], name: "index_posts_on_is_live"
  end

  create_table "release_formats", force: :cascade do |t|
    t.bigint "album_id"
    t.datetime "created_at", null: false
    t.bigint "music_format_id"
    t.datetime "updated_at", null: false
    t.index ["album_id"], name: "index_release_formats_on_album_id"
    t.index ["music_format_id"], name: "index_release_formats_on_music_format_id"
  end

  create_table "song_constellations", force: :cascade do |t|
    t.bigint "constellation_id"
    t.datetime "created_at", null: false
    t.integer "sequence_number"
    t.bigint "song_id"
    t.datetime "updated_at", null: false
    t.index ["constellation_id"], name: "index_song_constellations_on_constellation_id"
    t.index ["song_id"], name: "index_song_constellations_on_song_id"
  end

  create_table "songs", force: :cascade do |t|
    t.bigint "album_id"
    t.datetime "created_at", null: false
    t.text "lyrics"
    t.text "notes"
    t.integer "song_order"
    t.string "title"
    t.string "trt"
    t.datetime "updated_at", null: false
    t.index ["album_id"], name: "index_songs_on_album_id"
  end

  create_table "streaming_links", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "link"
    t.bigint "song_id"
    t.bigint "streaming_service_id"
    t.datetime "updated_at", null: false
    t.index ["song_id"], name: "index_streaming_links_on_song_id"
    t.index ["streaming_service_id"], name: "index_streaming_links_on_streaming_service_id"
  end

  create_table "streaming_services", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "icon"
    t.string "name"
    t.datetime "updated_at", null: false
  end
end
