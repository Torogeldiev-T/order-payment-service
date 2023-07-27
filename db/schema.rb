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

ActiveRecord::Schema[7.0].define(version: 2023_07_27_113654) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "order_lines", force: :cascade do |t|
    t.bigint "order_id"
    t.string "order_item_name", null: false
    t.decimal "order_item_price", precision: 10, scale: 2, null: false
    t.integer "order_item_units"
    t.decimal "total_price", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_lines_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.datetime "posted_at"
    t.string "client_fullname", null: false
    t.string "client_phone_number", null: false
    t.string "client_email", null: false
    t.string "address"
    t.decimal "total_amount", precision: 10, scale: 2
    t.string "status", null: false
    t.text "payment_service_metadata"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "order_lines", "orders"
end
