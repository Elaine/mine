# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090416030222) do

  create_table "activities", :force => true do |t|
    t.integer  "user_id"
    t.integer  "item_id"
    t.string   "item_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "admins", :force => true do |t|
    t.string   "name"
    t.string   "hashed_password"
    t.string   "salt"
    t.integer  "role_id"
    t.boolean  "enable",          :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "advertises", :force => true do |t|
    t.integer  "company_id"
    t.text     "description"
    t.string   "address"
    t.string   "phone"
    t.string   "contact"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
  end

  create_table "albums", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.text     "description"
    t.integer  "photos_count", :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "views_count",  :default => 0
  end

  create_table "answers", :force => true do |t|
    t.integer  "ask_id"
    t.integer  "user_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "status",     :default => false
  end

  create_table "ask_categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "asks", :force => true do |t|
    t.integer  "user_id"
    t.integer  "ask_category_id"
    t.string   "title"
    t.text     "content"
    t.integer  "score",           :default => 5
    t.integer  "answers_count",   :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "end_at"
    t.boolean  "solved",          :default => false
    t.boolean  "closed",          :default => false
    t.integer  "views_count",     :default => 0
  end

  create_table "board_categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_type", :default => 1
  end

  create_table "boards", :force => true do |t|
    t.integer  "board_category_id"
    t.integer  "type_id"
    t.integer  "user_id"
    t.string   "to"
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "businesses", :force => true do |t|
    t.integer  "user_id"
    t.string   "city"
    t.string   "name"
    t.string   "address"
    t.string   "phone"
    t.integer  "serve_category_id"
    t.text     "description"
    t.string   "bus"
    t.integer  "price"
    t.boolean  "master",             :default => true
    t.integer  "want",               :default => 0
    t.integer  "gone",               :default => 0
    t.integer  "serve_photos_count", :default => 0
    t.integer  "views_count",        :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "working",            :default => "不详"
    t.string   "park",               :default => "不详"
    t.string   "box",                :default => "不详"
    t.string   "takeaway",           :default => "不详"
    t.string   "creditcard",         :default => "不详"
    t.integer  "votes_count",        :default => 0
  end

  create_table "comments", :force => true do |t|
    t.integer  "item_id"
    t.string   "item_type"
    t.string   "reply"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "poster_id"
    t.string   "poster_type"
  end

  create_table "companies", :force => true do |t|
    t.string   "login_name"
    t.string   "hashed_password"
    t.string   "salt"
    t.string   "company_email"
    t.string   "master_name"
    t.text     "description"
    t.string   "address"
    t.string   "phone"
    t.string   "fax"
    t.string   "website"
    t.string   "postal"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "company_category_id"
    t.integer  "views_count",         :default => 0
    t.integer  "comments_count",      :default => 0
    t.integer  "products_count",      :default => 0
  end

  create_table "company_categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "company_photos", :force => true do |t|
    t.integer  "company_id"
    t.integer  "parent_id"
    t.string   "content_type"
    t.string   "filename"
    t.string   "thumbnail"
    t.integer  "size"
    t.integer  "width"
    t.integer  "height"
    t.boolean  "avatar"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "entries", :force => true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "content"
    t.integer  "comments_count",   :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "views_count",      :default => 0
    t.integer  "recommend_counts", :default => 0
  end

  create_table "event_categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "eventors", :force => true do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.string   "phone"
    t.integer  "members"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", :force => true do |t|
    t.integer  "user_id"
    t.integer  "event_category_id"
    t.string   "title"
    t.string   "city"
    t.integer  "people"
    t.integer  "money"
    t.integer  "phone"
    t.text     "term"
    t.text     "introduction"
    t.text     "notes"
    t.string   "location"
    t.datetime "started_at"
    t.datetime "end_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "closed",            :default => false
    t.boolean  "offical",           :default => false
    t.integer  "views_count",       :default => 0
    t.integer  "members",           :default => 0
    t.integer  "comments_count",    :default => 0
  end

  create_table "forum_categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "forums", :force => true do |t|
    t.string   "title"
    t.integer  "topics_count",      :default => 0
    t.integer  "posts_count",       :default => 0
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "forum_category_id"
  end

  create_table "friendships", :force => true do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "passed",     :default => true
  end

  create_table "grades", :force => true do |t|
    t.string   "name"
    t.integer  "score"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "level"
  end

  create_table "info_categories", :force => true do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.integer  "infos_count", :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "info_type"
  end

  create_table "info_photos", :force => true do |t|
    t.integer  "info_id"
    t.integer  "parent_id"
    t.string   "content_type"
    t.string   "filename"
    t.string   "thumbnail"
    t.integer  "size"
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "infos", :force => true do |t|
    t.integer  "info_category_id"
    t.string   "title"
    t.text     "content"
    t.integer  "item_id"
    t.integer  "comments_count",   :default => 0
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "views_count",      :default => 0
    t.string   "address"
    t.string   "item_type"
    t.string   "contact"
  end

  create_table "invite_codes", :force => true do |t|
    t.string   "login_name"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "item_photos", :force => true do |t|
    t.integer  "item_id"
    t.integer  "product_id"
    t.integer  "parent_id"
    t.string   "content_type"
    t.string   "filename"
    t.string   "thumbnail"
    t.integer  "size"
    t.integer  "width"
    t.integer  "height"
    t.boolean  "avatar"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "item_type"
  end

  create_table "messages", :force => true do |t|
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.integer  "parent_id"
    t.string   "title"
    t.text     "content"
    t.boolean  "trashed",      :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "manager",      :default => false
  end

  create_table "photos", :force => true do |t|
    t.integer  "user_id"
    t.integer  "album_id"
    t.integer  "parent_id"
    t.string   "title"
    t.text     "description"
    t.integer  "comments_count", :default => 0
    t.string   "content_type"
    t.string   "filename"
    t.string   "thumbnail"
    t.integer  "size"
    t.integer  "width"
    t.integer  "height"
    t.boolean  "primary"
    t.boolean  "avatar"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "views_count",    :default => 0
  end

  create_table "posts", :force => true do |t|
    t.integer  "user_id"
    t.integer  "topic_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "forum_id"
  end

  add_index "posts", ["topic_id"], :name => "index_posts_on_topic_id"

  create_table "products", :force => true do |t|
    t.integer  "item_id"
    t.string   "name"
    t.string   "address"
    t.text     "introduction"
    t.text     "offer_description"
    t.boolean  "is_recommend",      :default => false
    t.decimal  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "discount"
    t.integer  "comments_count",    :default => 0
    t.string   "item_type"
    t.integer  "shop_category_id"
  end

  create_table "reservations", :force => true do |t|
    t.integer  "product_id"
    t.integer  "counts",          :default => 0
    t.string   "truename"
    t.integer  "sex",             :default => 1
    t.string   "phone"
    t.string   "receive_address"
    t.string   "add"
    t.boolean  "status",          :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "serve_categories", :force => true do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "serve_photos", :force => true do |t|
    t.integer  "business_id"
    t.integer  "parent_id"
    t.string   "content_type"
    t.string   "filename"
    t.string   "thumbnail"
    t.integer  "size"
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "shop_categories", :force => true do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.integer  "shops_count",    :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "products_count", :default => 0
  end

  create_table "shops", :force => true do |t|
    t.string   "salt"
    t.string   "hashed_password"
    t.string   "login_name"
    t.integer  "shop_category_id"
    t.integer  "products_count"
    t.string   "shopname"
    t.string   "IDcard"
    t.string   "phone"
    t.string   "email"
    t.string   "address"
    t.string   "postcode"
    t.boolean  "is_recommend",     :default => false
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "comments_count",   :default => 0
  end

  create_table "spaces", :force => true do |t|
    t.integer  "user_id"
    t.string   "title",       :default => "这是你的标题"
    t.string   "address"
    t.text     "description", :default => "这是你的空间描述"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "theme_id",    :default => 1
    t.string   "resolution",  :default => "800x600"
  end

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "taggable_type"
    t.string   "context"
    t.datetime "created_at"
  end

  add_index "taggings", ["context", "taggable_id", "taggable_type"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"
  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "theme_categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "themes", :force => true do |t|
    t.integer  "theme_category_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "uri"
  end

  create_table "topics", :force => true do |t|
    t.integer  "user_id"
    t.integer  "forum_id"
    t.string   "title"
    t.text     "content"
    t.integer  "posts_count", :default => 0
    t.integer  "views_count", :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status"
  end

  create_table "user_infos", :force => true do |t|
    t.string   "true_name"
    t.integer  "user_id"
    t.boolean  "sex"
    t.date     "birthday"
    t.string   "blood"
    t.integer  "height"
    t.integer  "weight"
    t.string   "bodytype"
    t.string   "from"
    t.string   "location"
    t.string   "job"
    t.string   "company"
    t.string   "position"
    t.string   "school"
    t.string   "educational"
    t.string   "belief"
    t.string   "dress"
    t.boolean  "drink",        :default => false
    t.boolean  "smoke",        :default => false
    t.string   "personality"
    t.string   "hobiy"
    t.string   "qq"
    t.string   "msn"
    t.string   "telephone"
    t.string   "mobilephone"
    t.integer  "authenticate", :default => 1
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "overt",        :default => 1
  end

  create_table "users", :force => true do |t|
    t.string   "login_name"
    t.string   "email"
    t.string   "hashed_password"
    t.string   "salt"
    t.integer  "score",           :default => 10
    t.boolean  "enable",          :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "topics_count",    :default => 0
    t.integer  "posts_count",     :default => 0
    t.integer  "asks_count",      :default => 0
    t.integer  "events_count",    :default => 0
    t.integer  "grade_id",        :default => 1
    t.boolean  "enabled",         :default => true
    t.integer  "votes_count",     :default => 0
    t.datetime "last_activity"
    t.integer  "entries_count",   :default => 0
    t.integer  "albums_count",    :default => 0
    t.integer  "comments_count",  :default => 0
    t.integer  "views_count",     :default => 0
    t.integer  "photos_count",    :default => 0
    t.integer  "answers_count",   :default => 0
  end

  create_table "visits", :force => true do |t|
    t.integer  "guest_id"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "votes", :force => true do |t|
    t.integer  "user_id"
    t.integer  "business_id"
    t.integer  "quality",            :default => 3
    t.integer  "environment",        :default => 3
    t.integer  "services",           :default => 3
    t.integer  "members"
    t.decimal  "price"
    t.datetime "time"
    t.string   "recommend"
    t.text     "feel"
    t.integer  "serve_photos_count", :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
