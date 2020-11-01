# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_10_31_173910) do

  create_table "bakes", force: :cascade do |t|
    t.integer "total_weight"
    t.text "process"
    t.integer "rating"
    t.integer "user_id"
    t.integer "formula_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "formula_authors", force: :cascade do |t|
    t.integer "user_id"
    t.integer "formula_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "formulas", force: :cascade do |t|
    t.string "name"
    t.decimal "hydration", precision: 4, scale: 3
    t.decimal "salt", precision: 4, scale: 3
    t.decimal "starter", precision: 4, scale: 3
    t.decimal "preferment", precision: 4, scale: 3
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end