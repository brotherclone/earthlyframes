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

ActiveRecord::Schema.define(version: 2020_07_19_155733) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_id", null: false
    t.string "resource_type", null: false
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
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

  create_table "albums", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "cover"
    t.float "price"
    t.date "released"
    t.string "buylink"
    t.string "format"
    t.string "brief_description"
    t.boolean "is_live", default: false, null: false
  end

  create_table "character_backgrounds", force: :cascade do |t|
    t.string "background"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "character_descriptors", force: :cascade do |t|
    t.string "descriptor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "log_id"
    t.index ["log_id"], name: "index_character_descriptors_on_log_id"
  end

  create_table "character_roles", force: :cascade do |t|
    t.string "character_role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "log_id"
    t.index ["log_id"], name: "index_character_roles_on_log_id"
  end

  create_table "character_settings", force: :cascade do |t|
    t.string "time"
    t.string "place"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "characters", force: :cascade do |t|
    t.string "name"
    t.string "additional_bio"
    t.integer "current_health", default: 3, null: false
    t.integer "max_health", default: 3, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "character_role_id"
    t.bigint "character_descriptor_id"
    t.bigint "character_background_id"
    t.bigint "character_setting_id"
    t.bigint "user_id"
    t.index ["character_background_id"], name: "index_characters_on_character_background_id"
    t.index ["character_descriptor_id"], name: "index_characters_on_character_descriptor_id"
    t.index ["character_role_id"], name: "index_characters_on_character_role_id"
    t.index ["character_setting_id"], name: "index_characters_on_character_setting_id"
    t.index ["user_id"], name: "index_characters_on_user_id"
  end

  create_table "entries", force: :cascade do |t|
    t.string "entry_text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "log_id"
    t.bigint "prompt_id"
    t.bigint "character_id"
    t.index ["character_id"], name: "index_entries_on_character_id"
    t.index ["log_id"], name: "index_entries_on_log_id"
    t.index ["prompt_id"], name: "index_entries_on_prompt_id"
  end

  create_table "logs", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.string "main_image"
    t.string "inline_image"
    t.string "description"
    t.boolean "overlay_bright"
    t.boolean "is_live", default: false, null: false
    t.datetime "post_date"
  end

  create_table "prompts", force: :cascade do |t|
    t.string "prompt_text"
    t.string "prompt_image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "song_id"
    t.index ["song_id"], name: "index_prompts_on_song_id"
  end

  create_table "shows", force: :cascade do |t|
    t.string "title"
    t.datetime "showdate"
    t.text "description"
    t.string "location"
    t.string "link"
    t.string "flyer"
    t.string "brief_description"
    t.boolean "is_live", default: false, null: false
  end

  create_table "songs", force: :cascade do |t|
    t.string "title"
    t.string "trt"
    t.text "notes"
    t.text "lyrics"
    t.integer "song_order"
    t.bigint "album_id"
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

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "videos", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.string "description"
    t.string "video_type"
    t.string "video_service_id"
    t.bigint "song_id"
    t.index ["song_id"], name: "index_videos_on_song_id"
  end

end
