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

ActiveRecord::Schema.define(:version => 20141116000024) do

  create_table "customer_services", :force => true do |t|
    t.string   "year_customer_service"
    t.string   "trimester_customer_service"
    t.string   "month_customer_service"
    t.string   "date_customer_service"
    t.string   "region_customer_service"
    t.string   "uf_customer_service"
    t.string   "description_customer_service"
    t.string   "code_subject_customer_service"
    t.string   "description_subject_customer_service"
    t.string   "code_problem_customer_service"
    t.string   "description_problem_customer_service"
    t.string   "genre_customer_service"
    t.string   "cep_customer_service"
    t.integer  "supplier_id"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
  end

  add_index "customer_services", ["supplier_id"], :name => "index_customer_services_on_supplier_id"

  create_table "ratings", :force => true do |t|
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "description_rating"
    t.float    "value_rating"
    t.integer  "unity_procon_id"
    t.integer  "user_id"
  end

  add_index "ratings", ["unity_procon_id"], :name => "index_ratings_on_unity_procon_id"
  add_index "ratings", ["user_id"], :name => "index_ratings_on_user_id"

  create_table "regions", :force => true do |t|
    t.string   "description_region"
    t.integer  "quantity_region"
    t.integer  "quantity_direct_complaint"
    t.integer  "quantity_preliminary_service"
    t.integer  "quantity_calculation"
    t.integer  "quantity_cip"
    t.integer  "quantity_forward_supervision"
    t.integer  "quantity_initial_jec"
    t.integer  "quantity_letter_complaint"
    t.integer  "quantity_simple_consult"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  create_table "suppliers", :force => true do |t|
    t.string   "type_supplier"
    t.string   "social_reason_supplier"
    t.string   "fantasy_name_supplier"
    t.string   "cnpj"
    t.string   "cnaep_main_code_supplier"
    t.string   "description_cnaep_code_supplier"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  create_table "uf_helpers", :force => true do |t|
    t.string   "description_uf"
    t.string   "quantity_uf"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.integer  "quantity_direct_complaint"
    t.integer  "quantity_preliminary_service"
    t.integer  "quantity_calculation"
    t.integer  "quantity_cip"
    t.integer  "quantity_forward_supervision"
    t.integer  "quantity_initial_jec"
    t.integer  "quantity_letter_complaint"
    t.integer  "quantity_simple_consult"
  end

  create_table "unity_procons", :force => true do |t|
    t.string   "address_unity_procon"
    t.string   "name_coordinator_unity_procon"
    t.string   "uf_procon"
    t.string   "email_unity_procon"
    t.string   "list_phones"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.integer  "position_unity_procon"
    t.float    "average_pontuation"
    t.float    "latitude"
    t.float    "longitude"
  end

  create_table "users", :force => true do |t|
    t.string   "name_user"
    t.string   "email_user"
    t.integer  "rating_id"
    t.integer  "session_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.string   "address_user"
  end

  add_index "users", ["address_user"], :name => "index_users_on_address_user"
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
