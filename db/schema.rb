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

ActiveRecord::Schema[7.0].define(version: 2023_03_08_130121) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "account_transactions", force: :cascade do |t|
    t.integer "transaction_value", default: 0, null: false
    t.integer "kind", default: 0, null: false
    t.bigint "bank_account_id", null: false
    t.string "destination_bank_account"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bank_account_id"], name: "index_account_transactions_on_bank_account_id"
    t.index ["user_id"], name: "index_account_transactions_on_user_id"
  end

  create_table "bank_accounts", force: :cascade do |t|
    t.string "account_number", default: "", null: false
    t.integer "transaction_limit", default: 0, null: false
    t.bigint "bank_agency_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "account_balance", default: 0, null: false
    t.index ["account_number"], name: "index_bank_accounts_on_account_number", unique: true
    t.index ["bank_agency_id"], name: "index_bank_accounts_on_bank_agency_id"
  end

  create_table "bank_agencies", force: :cascade do |t|
    t.string "agency_number", default: "", null: false
    t.string "address", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "account_transactions", "bank_accounts"
  add_foreign_key "account_transactions", "users"
  add_foreign_key "bank_accounts", "bank_agencies"
end
