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

ActiveRecord::Schema[7.2].define(version: 2024_08_06_104133) do
  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "contact_email"
    t.string "phone"
    t.string "address"
    t.string "segment"
    t.string "size"
    t.boolean "job_offer", default: false
    t.boolean "ruby_stack", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status", default: "Ativo"
    t.string "site"
    t.string "category"
    t.string "uf"
    t.boolean "approval_status", default: false
    t.string "color"
  end
end
