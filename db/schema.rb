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

ActiveRecord::Schema.define(version: 20150911132251) do

  create_table "dailies", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "my_image4"
    t.string   "my_image5"
    t.string   "my_image6"
    t.string   "title"
    t.string   "hashtag"
    t.integer  "kg"
    t.string   "upsize"
    t.string   "downsize"
    t.integer  "tall"
    t.string   "image_file"
    t.string   "head"
    t.string   "top"
    t.string   "bottom"
    t.string   "shoes"
    t.string   "accessory"
    t.string   "etc"
    t.integer  "viewcount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dailyreplies", force: :cascade do |t|
    t.integer  "daily_id"
    t.integer  "user_id"
    t.string   "nickname"
    t.string   "comment"
    t.string   "age"
    t.string   "sex"
    t.string   "job"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "helps", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.string   "hashtag"
    t.integer  "tall"
    t.integer  "kg"
    t.string   "upsize"
    t.string   "downsize"
    t.string   "explain"
    t.string   "image_file"
    t.string   "my_image1"
    t.string   "my_image2"
    t.string   "my_image3"
    t.string   "userid"
    t.integer  "likeone"
    t.integer  "liketwo"
    t.integer  "manleftlike"
    t.integer  "manrightlike"
    t.integer  "womanleftlike"
    t.integer  "womanrightlike"
    t.integer  "viewcount"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "replies", force: :cascade do |t|
    t.integer  "help_id"
    t.integer  "user_id"
    t.string   "nickname"
    t.string   "comment"
    t.string   "age"
    t.string   "sex"
    t.string   "job"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",               default: "", null: false
    t.string   "nickname",               default: "", null: false
    t.string   "job",                    default: "", null: false
    t.string   "sex",                    default: "", null: false
    t.string   "age",                    default: "", null: false
    t.string   "tall",                   default: "", null: false
    t.string   "weight",                 default: "", null: false
    t.string   "topsize",                default: "", null: false
    t.string   "bottomsize",             default: "", null: false
    t.string   "footsize",               default: "", null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
