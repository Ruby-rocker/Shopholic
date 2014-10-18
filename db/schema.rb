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

ActiveRecord::Schema.define(:version => 20140416085953) do

  create_table "auctions", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "title"
    t.text     "description"
    t.integer  "reserved_price"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.datetime "auction_ended"
  end

  create_table "biddings", :force => true do |t|
    t.string   "bidder"
    t.integer  "bid_price"
    t.integer  "auction_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
  end

  add_index "biddings", ["auction_id"], :name => "index_biddings_on_auction_id"

  create_table "brands", :force => true do |t|
    t.string   "brand_name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "category_id"
  end

  create_table "carts", :force => true do |t|
    t.integer "User_id",    :null => false
    t.integer "Product_id", :null => false
    t.integer "Quantity",   :null => false
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "master_carts", :id => false, :force => true do |t|
    t.integer "user_id",   :null => false
    t.integer "total_amt", :null => false
    t.integer "cart_id",   :null => false
  end

  create_table "master_orders", :force => true do |t|
    t.integer  "user_id"
    t.integer  "total_amt"
    t.string   "status"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "orders", :force => true do |t|
    t.integer  "mo_id"
    t.integer  "user_id"
    t.integer  "product_id"
    t.decimal  "price",        :precision => 10, :scale => 0
    t.integer  "quantity"
    t.string   "status"
    t.text     "baddress"
    t.integer  "zipcode"
    t.string   "city"
    t.string   "state"
    t.decimal  "total_amount", :precision => 10, :scale => 0
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
  end

  create_table "products", :force => true do |t|
    t.integer  "category_id"
    t.integer  "brand_id"
    t.string   "name"
    t.string   "description"
    t.decimal  "price",               :precision => 8, :scale => 2
    t.datetime "created_at",                                        :null => false
    t.datetime "updated_at",                                        :null => false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer  "available_quantity"
  end

  create_table "ratings", :force => true do |t|
    t.integer  "user_id"
    t.integer  "auction_id"
    t.integer  "value"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",   :null => false
    t.string   "encrypted_password",     :default => "",   :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,    :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
    t.string   "address"
    t.integer  "zipcode"
    t.string   "fname"
    t.string   "lname"
    t.string   "city"
    t.string   "state"
    t.boolean  "role",                   :default => true
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "wish_lists", :force => true do |t|
    t.integer  "product_id"
    t.integer  "user_id"
    t.integer  "quantity"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
