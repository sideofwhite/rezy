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

ActiveRecord::Schema.define(version: 20160702232009) do

  create_table "admins", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "applicants", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "firstName"
    t.string   "lastName"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "features", force: :cascade do |t|
    t.integer  "bed"
    t.integer  "bath"
    t.integer  "rent"
    t.text     "available"
    t.boolean  "dishwasher"
    t.boolean  "washer_dryer"
    t.boolean  "hardwood"
    t.boolean  "deck"
    t.boolean  "air"
    t.boolean  "cat"
    t.boolean  "dog"
    t.boolean  "bbq"
    t.text     "title"
    t.text     "description"
    t.boolean  "new_kitchen"
    t.string   "neighbourhood"
    t.integer  "rental_id"
    t.boolean  "year_lease"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "sq_feet"
    t.string   "property_type"
    t.boolean  "furnished"
    t.integer  "deposit"
    t.index ["rental_id"], name: "index_features_on_rental_id"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "galleries", force: :cascade do |t|
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "rental_id"
    t.index ["rental_id"], name: "index_galleries_on_rental_id"
  end

  create_table "issues", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.boolean  "open",        default: true
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "rental_id"
    t.integer  "user_id"
    t.index ["rental_id"], name: "index_issues_on_rental_id"
    t.index ["user_id"], name: "index_issues_on_user_id"
  end

  create_table "owners", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rentals", force: :cascade do |t|
    t.string   "address"
    t.string   "addressSecondary"
    t.string   "city"
    t.string   "postal"
    t.string   "province"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "user_id"
    t.boolean  "approved",           default: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "slug"
    t.integer  "street_number"
    t.string   "street"
    t.index ["slug"], name: "index_rentals_on_slug", unique: true
    t.index ["user_id"], name: "index_rentals_on_user_id"
  end

  create_table "requests", force: :cascade do |t|
    t.string   "salary"
    t.string   "occupation"
    t.boolean  "smoker"
    t.boolean  "petowner"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "rental_id"
    t.index ["rental_id"], name: "index_requests_on_rental_id"
    t.index ["user_id"], name: "index_requests_on_user_id"
  end

  create_table "tenants", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "firstName"
    t.string   "lastName"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
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
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "type"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
