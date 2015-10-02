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

ActiveRecord::Schema.define(version: 20151002134546) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "albums", force: true do |t|
    t.string "title"
    t.date   "releasedate"
    t.text   "description"
  end

  create_table "images", force: true do |t|
    t.string  "name"
    t.integer "imageable_id"
    t.string  "imageable_type"
  end

  add_index "images", ["imageable_id", "imageable_type"], name: "index_images_on_imageable_id_and_imageable_type", using: :btree

  create_table "posts", force: true do |t|
    t.string "title"
    t.text   "body"
  end

  create_table "releases", force: true do |t|
    t.string  "title"
    t.string  "formatname"
    t.string  "price"
    t.integer "albums_id"
  end

  add_index "releases", ["albums_id"], name: "index_releases_on_albums_id", using: :btree

  create_table "shows", force: true do |t|
    t.string   "title"
    t.datetime "showdate"
    t.text     "description"
    t.string   "location"
    t.string   "link"
  end

  create_table "songs", force: true do |t|
    t.string  "title"
    t.string  "trt"
    t.text    "notes"
    t.text    "lyrics"
    t.integer "albums_id"
  end

  add_index "songs", ["albums_id"], name: "index_songs_on_albums_id", using: :btree

end
