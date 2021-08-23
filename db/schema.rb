# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_08_19_191049) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", id: :serial, force: :cascade do |t|
    t.string "namespace", limit: 255
    t.text "body"
    t.string "resource_id", limit: 255, null: false
    t.string "resource_type", limit: 255, null: false
    t.integer "author_id"
    t.string "author_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", id: :serial, force: :cascade do |t|
    t.string "email", limit: 255, default: "", null: false
    t.string "encrypted_password", limit: 255, default: "", null: false
    t.string "reset_password_token", limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "albums", id: :serial, force: :cascade do |t|
    t.string "title", limit: 255
    t.text "description"
    t.string "cover", limit: 255
    t.float "price"
    t.date "released"
    t.string "buylink", limit: 255
    t.string "format", limit: 255
    t.string "brief_description", limit: 255
    t.boolean "is_live", default: false, null: false
    t.integer "rainbow_table"
    t.string "rainbow_portrait"
  end

  create_table "posts", id: :serial, force: :cascade do |t|
    t.string "title", limit: 255
    t.text "body"
    t.string "main_image", limit: 255
    t.string "inline_image", limit: 255
    t.string "description", limit: 255
    t.boolean "overlay_bright"
    t.boolean "is_live", default: false, null: false
    t.datetime "post_date"
  end

  create_table "shows", id: :serial, force: :cascade do |t|
    t.string "title", limit: 255
    t.datetime "showdate"
    t.text "description"
    t.string "location", limit: 255
    t.string "link", limit: 255
    t.string "flyer", limit: 255
    t.string "brief_description", limit: 255
    t.boolean "is_live", default: false, null: false
  end

  create_table "songs", id: :serial, force: :cascade do |t|
    t.string "title", limit: 255
    t.string "trt", limit: 255
    t.text "notes"
    t.text "lyrics"
    t.integer "song_order"
    t.integer "album_id"
    t.index ["album_id"], name: "index_songs_on_album_id"
  end

  create_table "streaming_links", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "link"
    t.bigint "streaming_service_id"
    t.bigint "song_id"
    t.bigint "album_id"
    t.index ["album_id"], name: "index_streaming_links_on_album_id"
    t.index ["song_id"], name: "index_streaming_links_on_song_id"
    t.index ["streaming_service_id"], name: "index_streaming_links_on_streaming_service_id"
  end

  create_table "streaming_services", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "icon_url"
  end

  create_table "videos", id: :serial, force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "title"
    t.string "description"
    t.string "video_type"
    t.string "video_service_id"
    t.integer "song_id"
    t.index ["song_id"], name: "index_videos_on_song_id"
  end

end
