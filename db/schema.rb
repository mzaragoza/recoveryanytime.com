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

ActiveRecord::Schema.define(version: 20141015185800) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: true do |t|
    t.string   "email",                  default: "",   null: false
    t.string   "encrypted_password",     default: "",   null: false
    t.string   "first_name",             default: "",   null: false
    t.string   "last_name",              default: "",   null: false
    t.string   "phone",                  default: "",   null: false
    t.string   "photo",                  default: "",   null: false
    t.datetime "start_date"
    t.datetime "end_date"
    t.boolean  "active",                 default: true, null: false
    t.boolean  "send_sms",               default: true, null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,    null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["confirmation_token"], name: "index_admins_on_confirmation_token", unique: true, using: :btree
  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree
  add_index "admins", ["unlock_token"], name: "index_admins_on_unlock_token", unique: true, using: :btree

  create_table "clicks", force: true do |t|
    t.integer  "clickable_id"
    t.string   "clickable_type", default: ""
    t.integer  "user_id"
    t.string   "action",         default: ""
    t.text     "referer",        default: ""
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contacts", force: true do |t|
    t.string   "first_name",       default: ""
    t.string   "last_name",        default: ""
    t.string   "email",            default: ""
    t.string   "phone",            default: ""
    t.text     "message",          default: ""
    t.text     "response_message", default: ""
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "email_campaing_users", force: true do |t|
    t.integer  "email_campaing_id"
    t.integer  "user_id"
    t.boolean  "opt_in",            default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "email_campaings", force: true do |t|
    t.string   "name",       default: "",   null: false
    t.string   "list_id",    default: "",   null: false
    t.boolean  "active",     default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "facilities", force: true do |t|
    t.string   "type_of",           default: ""
    t.string   "name",              default: ""
    t.string   "address",           default: ""
    t.string   "city",              default: ""
    t.string   "state",             default: ""
    t.string   "zip",               default: ""
    t.text     "description",       default: ""
    t.string   "contact_name",      default: ""
    t.string   "contact_email",     default: ""
    t.string   "contact_phone",     default: ""
    t.string   "image",             default: ""
    t.string   "link",              default: ""
    t.boolean  "active",            default: true
    t.boolean  "main",              default: false, null: false
    t.integer  "position",          default: 0,     null: false
    t.integer  "views",             default: 0,     null: false
    t.integer  "clicks",            default: 0,     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "short_description", default: ""
  end

  create_table "fellowship_users", force: true do |t|
    t.integer  "fellowship_id"
    t.integer  "user_id"
    t.boolean  "opt_in",        default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fellowships", force: true do |t|
    t.string   "name",        default: ""
    t.text     "description", default: ""
    t.boolean  "active",      default: true
    t.string   "image",       default: ""
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "abbr",        default: ""
  end

  create_table "promotions", force: true do |t|
    t.string   "name",       default: "",   null: false
    t.string   "image",      default: "",   null: false
    t.string   "link",       default: "",   null: false
    t.boolean  "active",     default: true, null: false
    t.integer  "views",      default: 0,    null: false
    t.integer  "clicks",     default: 0,    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username",               default: "",    null: false
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "first_name",             default: "",    null: false
    t.string   "last_name",              default: "",    null: false
    t.string   "gender",                 default: "",    null: false
    t.string   "address",                default: "",    null: false
    t.string   "city",                   default: "",    null: false
    t.string   "state",                  default: "",    null: false
    t.string   "zip",                    default: "",    null: false
    t.string   "recovery_type",          default: "",    null: false
    t.string   "phone",                  default: "",    null: false
    t.string   "photo",                  default: "",    null: false
    t.boolean  "agree_newsletter",       default: false, null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,     null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "sober_date"
    t.date     "birthday"
    t.boolean  "active",                 default: true
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree

end
