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

ActiveRecord::Schema.define(version: 2022_09_29_081049) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

  create_table "animals", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "kanji"
    t.string "icon"
    t.index ["name"], name: "index_animals_on_name", unique: true
  end

  create_table "bookmarks", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "facility_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["facility_id"], name: "index_bookmarks_on_facility_id"
    t.index ["user_id", "facility_id"], name: "index_bookmarks_on_user_id_and_facility_id", unique: true
    t.index ["user_id"], name: "index_bookmarks_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.string "other_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_categories_on_name", unique: true
  end

  create_table "facilities", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.string "close_day"
    t.string "opening_hours"
    t.string "tel_number"
    t.string "address"
    t.string "access"
    t.string "parking"
    t.string "price"
    t.string "web_site"
    t.text "remarks"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "prefecture_id"
    t.float "latitude"
    t.float "longitude"
    t.integer "suggest", default: 0
  end

  create_table "facility_categories", force: :cascade do |t|
    t.bigint "facility_id", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_facility_categories_on_category_id"
    t.index ["facility_id", "category_id"], name: "index_facility_categories_on_facility_id_and_category_id", unique: true
    t.index ["facility_id"], name: "index_facility_categories_on_facility_id"
  end

  create_table "favorite_animals", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "animal_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["animal_id"], name: "index_favorite_animals_on_animal_id"
    t.index ["user_id", "animal_id"], name: "index_favorite_animals_on_user_id_and_animal_id", unique: true
    t.index ["user_id"], name: "index_favorite_animals_on_user_id"
  end

  create_table "favorite_categories", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_favorite_categories_on_category_id"
    t.index ["user_id", "category_id"], name: "index_favorite_categories_on_user_id_and_category_id", unique: true
    t.index ["user_id"], name: "index_favorite_categories_on_user_id"
  end

  create_table "managements", force: :cascade do |t|
    t.bigint "facility_id", null: false
    t.bigint "animal_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["animal_id"], name: "index_managements_on_animal_id"
    t.index ["facility_id", "animal_id"], name: "index_managements_on_facility_id_and_animal_id", unique: true
    t.index ["facility_id"], name: "index_managements_on_facility_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.string "image", null: false
    t.bigint "user_id", null: false
    t.bigint "facility_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["facility_id"], name: "index_posts_on_facility_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "reports", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "facility_id", null: false
    t.text "admin_comment"
    t.integer "content_id", null: false
    t.text "body", null: false
    t.string "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["facility_id"], name: "index_reports_on_facility_id"
    t.index ["user_id"], name: "index_reports_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "name", null: false
    t.string "crypted_password"
    t.string "salt"
    t.integer "role", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "avatar"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "bookmarks", "facilities"
  add_foreign_key "bookmarks", "users"
  add_foreign_key "facility_categories", "categories"
  add_foreign_key "facility_categories", "facilities"
  add_foreign_key "favorite_animals", "animals"
  add_foreign_key "favorite_animals", "users"
  add_foreign_key "favorite_categories", "categories"
  add_foreign_key "favorite_categories", "users"
  add_foreign_key "managements", "animals"
  add_foreign_key "managements", "facilities"
  add_foreign_key "posts", "facilities"
  add_foreign_key "posts", "users"
  add_foreign_key "reports", "facilities"
  add_foreign_key "reports", "users"
end
