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

ActiveRecord::Schema.define(:version => 0) do

  create_table "userContentService", :force => true do |t|
    t.integer   "contentServiceID", :default => 0, :null => false
    t.integer   "userID",           :default => 0, :null => false
    t.timestamp "created_at",                      :null => false
    t.timestamp "updated_at",                      :null => false
  end

  create_table "users", :force => true do |t|
    t.string    "firstName"
    t.string    "middleName"
    t.string    "lastName"
    t.string    "username",                              :null => false
    t.string    "email",                                 :null => false
    t.string    "encryptedPassword",                     :null => false
    t.binary    "yodleeUserContext", :limit => 16777215
    t.timestamp "created_at",                            :null => false
    t.timestamp "updated_at",                            :null => false
    t.string    "salt"
  end

  create_table "yodleeContentServiceInfo", :force => true do |t|
    t.integer "contentServiceId",          :limit => 8
    t.integer "serviceId",                 :limit => 8
    t.string  "contentServiceDisplayName"
    t.string  "contactUrl"
    t.string  "contactPhoneNumber"
    t.string  "contactEmailAddress"
    t.string  "homeUrl"
    t.string  "siteDisplayName"
    t.integer "siteId",                    :limit => 8
    t.string  "loginUrl"
    t.string  "organizationDisplayName"
    t.integer "organizationId",            :limit => 8
    t.string  "passwordHelpUrl"
    t.string  "registrationUrl"
  end

end
