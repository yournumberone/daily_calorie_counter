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

ActiveRecord::Schema[7.0].define(version: 2022_09_19_073935) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "daily_diets", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "planned_calories"
    t.integer "total_calories", default: 0
    t.decimal "total_proteins", precision: 10, scale: 1, default: "0.0"
    t.decimal "total_fats", precision: 10, scale: 1, default: "0.0"
    t.decimal "total_carbohydrates", precision: 10, scale: 1, default: "0.0"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "date"], name: "index_daily_diets_on_user_id_and_date", unique: true
    t.index ["user_id"], name: "index_daily_diets_on_user_id"
  end

  create_table "meals", force: :cascade do |t|
    t.string "meal"
    t.decimal "calories", precision: 10, scale: 1
    t.decimal "protein_g", precision: 10, scale: 1
    t.decimal "fat_total_g", precision: 10, scale: 1
    t.decimal "carbohydrates_total_g", precision: 10, scale: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "date"
    t.bigint "daily_diet_id", null: false
    t.index ["daily_diet_id"], name: "index_meals_on_daily_diet_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.decimal "calories", precision: 5, scale: 1
    t.decimal "protein_g", precision: 5, scale: 1
    t.decimal "fat_total_g", precision: 5, scale: 1
    t.decimal "carbohydrates_total_g", precision: 5, scale: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["name"], name: "index_products_on_name"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "meals", "daily_diets"
end
