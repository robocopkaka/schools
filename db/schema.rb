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

ActiveRecord::Schema.define(version: 20151208180542) do

  create_table "schools", force: :cascade do |t|
    t.string   "school_name"
    t.string   "school_image"
    t.text     "school_description"
    t.text     "school_address"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "location"
    t.string   "category"
    t.string   "website"
    t.boolean  "approved",           default: false
    t.string   "picture"
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "deleted",            default: false
    t.string   "classification"
  end

  add_index "schools", ["location"], name: "index_schools_on_location"
  add_index "schools", ["school_name"], name: "index_schools_on_school_name"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "remember_digest"
    t.string   "activation_digest"
    t.string   "password_digest"
    t.datetime "activated_at"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.boolean  "activated",         default: false
    t.boolean  "admin"
  end

end
