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

ActiveRecord::Schema.define(version: 2021_02_05_073315) do

  create_table "wallet_accounts", force: :cascade do |t|
    t.string "tag"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "wallet_credits", force: :cascade do |t|
    t.integer "wallet_account_id", null: false
    t.decimal "amount"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["wallet_account_id"], name: "index_wallet_credits_on_wallet_account_id"
  end

  create_table "wallet_debits", force: :cascade do |t|
    t.integer "wallet_account_id", null: false
    t.decimal "amount"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["wallet_account_id"], name: "index_wallet_debits_on_wallet_account_id"
  end

  create_table "wallet_transactions", force: :cascade do |t|
    t.integer "wallet_account_id", null: false
    t.decimal "amount"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "type"
    t.string "to"
    t.index ["wallet_account_id"], name: "index_wallet_transactions_on_wallet_account_id"
  end

  add_foreign_key "wallet_credits", "wallet_accounts"
  add_foreign_key "wallet_debits", "wallet_accounts"
  add_foreign_key "wallet_transactions", "wallet_accounts"
end
