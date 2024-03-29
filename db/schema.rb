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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120229150933) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "imports", :force => true do |t|
    t.string   "spread"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "inscriptions", :force => true do |t|
    t.integer  "lesson_id"
    t.integer  "user_id"
    t.datetime "date"
    t.boolean  "flag_paye"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "inscriptions", ["lesson_id"], :name => "index_inscriptions_on_lesson_id"
  add_index "inscriptions", ["user_id"], :name => "index_inscriptions_on_user_id"

  create_table "labels", :force => true do |t|
    t.string   "name"
    t.string   "avatar"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "lessons", :force => true do |t|
    t.integer  "syllabus_id"
    t.datetime "horaire"
    t.boolean  "flag_recurrent"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "lessons", ["syllabus_id"], :name => "index_lessons_on_syllabus_id"

  create_table "organisateurs", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "avatar"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "syllabuses", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "avatar"
    t.integer  "organisateur_id"
    t.integer  "label_id"
    t.integer  "categorie_id"
    t.float    "prixbase"
    t.float    "reduction"
    t.integer  "duree"
    t.boolean  "flag_actif",            :default => false
    t.boolean  "flag_date",             :default => false
    t.boolean  "flag_interne",          :default => false
    t.boolean  "flag_lieu_defini",      :default => false
    t.integer  "nb_min_apprenants"
    t.integer  "nb_max_apprenants"
    t.string   "lien"
    t.string   "contact_reservation"
    t.string   "adresse_etablissement"
    t.string   "adresse_num_voie"
    t.string   "adresse_complement"
    t.integer  "adresse_codepostal"
    t.string   "adresse_ville"
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
  end

  add_index "syllabuses", ["categorie_id"], :name => "index_syllabuses_on_categorie_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
