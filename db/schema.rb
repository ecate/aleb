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

ActiveRecord::Schema.define(:version => 20120228175525) do

  create_table "categories", :force => true do |t|
    t.string   "nom"
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

  create_table "label_syllabuses", :force => true do |t|
    t.integer  "syllabus_id"
    t.integer  "label_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "label_syllabuses", ["label_id"], :name => "index_label_syllabuses_on_label_id"
  add_index "label_syllabuses", ["syllabus_id"], :name => "index_label_syllabuses_on_syllabus_id"

  create_table "labels", :force => true do |t|
    t.string   "nom"
    t.string   "avatar"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "lessons", :force => true do |t|
    t.integer  "syllabus_id"
    t.date     "date"
    t.time     "debut"
    t.boolean  "flag_recurrent"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "lessons", ["syllabus_id"], :name => "index_lessons_on_syllabus_id"

  create_table "organisateurs", :force => true do |t|
    t.string   "nom"
    t.text     "description"
    t.string   "avatar"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "syllabuses", :force => true do |t|
    t.string   "titre"
    t.text     "description"
    t.string   "logo"
    t.integer  "categorie_id"
    t.float    "prixbase"
    t.float    "reduction"
    t.time     "duree"
    t.boolean  "flag_actif"
    t.boolean  "flag_pas_date"
    t.boolean  "flag_interne"
    t.integer  "nb_min_apprenants"
    t.integer  "nb_max_apprenants"
    t.string   "lien"
    t.string   "contact_reservation"
    t.string   "adresse_etablissement"
    t.string   "adresse_num_voie"
    t.string   "adresse_complement"
    t.integer  "adresse_codepostal"
    t.boolean  "flag_lieu_defini"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  add_index "syllabuses", ["categorie_id"], :name => "index_syllabuses_on_categorie_id"

  create_table "users", :force => true do |t|
    t.string   "prenom"
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
