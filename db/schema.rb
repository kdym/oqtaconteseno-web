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

ActiveRecord::Schema.define(version: 20171010105757) do

  create_table "app_users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "facebook_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "events", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nome"
    t.integer  "tipo"
    t.datetime "data_inicio"
    t.datetime "data_fim"
    t.integer  "app_user_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.text     "descricao",   limit: 65535
    t.boolean  "gratis"
    t.float    "latitude",    limit: 24
    t.float    "longitude",   limit: 24
    t.index ["app_user_id"], name: "index_events_on_app_user_id", using: :btree
  end

  create_table "events_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "nome"
    t.binary "icone", limit: 16777215
  end

  create_table "ratings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "app_user_id"
    t.integer  "event_id"
    t.text     "comentario",  limit: 65535
    t.integer  "nota"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["app_user_id"], name: "index_ratings_on_app_user_id", using: :btree
    t.index ["event_id"], name: "index_ratings_on_event_id", using: :btree
  end

  create_table "search_parameters", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "tipos"
    t.integer  "periodo"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "app_user_id"
    t.index ["app_user_id"], name: "fk_rails_d270f1c3a4", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "image"
    t.integer  "role"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "events", "app_users"
  add_foreign_key "ratings", "app_users"
  add_foreign_key "ratings", "events"
  add_foreign_key "search_parameters", "app_users"
end
