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

ActiveRecord::Schema.define(version: 20160209232222) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.integer  "barbecue_id", null: false
    t.integer  "user_id",     null: false
    t.string   "action"
    t.string   "extra_data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "activities", ["barbecue_id"], name: "index_activities_on_barbecue_id", using: :btree
  add_index "activities", ["user_id"], name: "index_activities_on_user_id", using: :btree

  create_table "barbecue_ingredients", force: :cascade do |t|
    t.integer  "ingredient_id", null: false
    t.integer  "barbecue_id",   null: false
    t.integer  "quantity",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "barbecues", force: :cascade do |t|
    t.string   "title",       limit: 255, null: false
    t.datetime "begin_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",                 null: false
    t.text     "description"
  end

  create_table "ingredients", force: :cascade do |t|
    t.string   "title",         limit: 255, null: false
    t.integer  "average_price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "supplies", force: :cascade do |t|
    t.integer  "ingredient_id", null: false
    t.integer  "barbecue_id",   null: false
    t.integer  "user_id",       null: false
    t.integer  "quantity",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "",      null: false
    t.string   "encrypted_password",     limit: 255, default: "",      null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "name",                               default: "Guest", null: false
    t.string   "provider",               limit: 255
    t.string   "uid",                    limit: 255
    t.boolean  "guest",                              default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "activities", "barbecues"
  add_foreign_key "activities", "users"
end
