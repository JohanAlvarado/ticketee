ActiveRecord::Schema.define(version: 20130910200108) do

  create_table "assets", force: true do |t|
    t.string   "asset"
    t.integer  "ticket_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.text     "text"
    t.integer  "ticket_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "state_id"
    t.integer  "previous_state_id"
  end

  create_table "projects", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "states", force: true do |t|
    t.string "name"
    t.string "color"
    t.string "background"
  end

  create_table "tags", force: true do |t|
    t.string "name"
  end

  create_table "tags_tickets", id: false, force: true do |t|
    t.integer "tag_id"
    t.integer "ticket_id"
  end

  create_table "tickets", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "state_id"
  end

  add_index "tickets", ["project_id"], name: "index_tickets_on_project_id"
  add_index "tickets", ["state_id"], name: "index_tickets_on_state_id"

end
