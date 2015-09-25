# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150925202419) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "albumformats", force: true do |t|
    t.string "name"
  end

  create_table "albums", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.date     "release"
    t.text     "description"
    t.integer  "albumtypes_id"
    t.integer  "albumformats_id"
  end

  add_index "albums", ["albumformats_id"], name: "index_albums_on_albumformats_id", using: :btree
  add_index "albums", ["albumtypes_id"], name: "index_albums_on_albumtypes_id", using: :btree

  create_table "albumtypes", force: true do |t|
    t.string "name"
  end

  create_table "images", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.string   "img"
  end

  add_index "images", ["imageable_id"], name: "index_images_on_imageable_id", using: :btree

  create_table "posts", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.text     "post"
    t.datetime "published"
  end

  create_table "shows", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.text     "description"
    t.datetime "date"
    t.string   "location"
  end

  create_table "songs", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "album_id"
    t.string   "title"
    t.integer  "sequence"
    t.text     "notes"
    t.text     "lyrics"
  end

  add_index "songs", ["album_id"], name: "index_songs_on_album_id", using: :btree

end
