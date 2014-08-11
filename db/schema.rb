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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140810200022) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "authentications", force: true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "badges_sashes", force: true do |t|
    t.integer  "badge_id"
    t.integer  "sash_id"
    t.boolean  "notified_user", default: false
    t.datetime "created_at"
  end

  add_index "badges_sashes", ["badge_id", "sash_id"], name: "index_badges_sashes_on_badge_id_and_sash_id", using: :btree
  add_index "badges_sashes", ["badge_id"], name: "index_badges_sashes_on_badge_id", using: :btree
  add_index "badges_sashes", ["sash_id"], name: "index_badges_sashes_on_sash_id", using: :btree

  create_table "comments", force: true do |t|
    t.integer  "commentable_id",   default: 0
    t.string   "commentable_type", default: ""
    t.string   "title",            default: ""
    t.text     "body",             default: ""
    t.string   "subject",          default: ""
    t.integer  "user_id",          default: 0,  null: false
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "discussion_id"
    t.integer  "nest_level"
  end

  add_index "comments", ["commentable_id"], name: "index_comments_on_commentable_id", using: :btree
  add_index "comments", ["discussion_id"], name: "index_comments_on_discussion_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "course_enrollments", force: true do |t|
    t.integer  "user_id"
    t.integer  "course_id"
    t.boolean  "completed",  default: false
    t.string   "step"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "courses", force: true do |t|
    t.string   "name"
    t.integer  "lesson_count"
    t.integer  "level"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "slug"
    t.string   "description"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer  "posi"
    t.integer  "instructor_id"
  end

  add_index "courses", ["slug"], name: "index_courses_on_slug", using: :btree

  create_table "courses_users", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "course_id"
  end

  create_table "delayed_jobs", force: true do |t|
    t.integer  "priority",   default: 0
    t.integer  "attempts",   default: 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "discussions", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "group_id"
    t.integer  "user_id"
    t.string   "slug"
    t.string   "tags"
    t.integer  "trending_value", default: 0
  end

  add_index "discussions", ["group_id"], name: "index_discussions_on_group_id", using: :btree
  add_index "discussions", ["slug"], name: "index_discussions_on_slug", using: :btree

  create_table "exercises", force: true do |t|
    t.string   "start_state"
    t.text     "end_state"
    t.text     "hints"
    t.text     "explanation"
    t.integer  "lesson_id"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "description"
    t.string   "slug"
    t.string   "title"
    t.text     "errorone"
    t.text     "errortwo"
    t.string   "inputtext"
    t.text     "endtext"
    t.integer  "pointvalue"
    t.text     "hintwo"
    t.string   "question"
    t.boolean  "complete",         default: false
    t.integer  "bqpointvalue"
    t.boolean  "questioncomplete"
    t.boolean  "multistep",        default: false
    t.string   "notation"
    t.integer  "posi"
    t.boolean  "random",           default: false
    t.boolean  "sparepieces",      default: false
    t.string   "orientation",      default: "white"
  end

  add_index "exercises", ["slug"], name: "index_exercises_on_slug", using: :btree

  create_table "exercises_users", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "exercise_id"
  end

  create_table "friendly_id_slugs", force: true do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 40
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", unique: true, using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "groups", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "leader_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "slug"
  end

  add_index "groups", ["slug"], name: "index_groups_on_slug", using: :btree

  create_table "groups_users", id: false, force: true do |t|
    t.integer "group_id"
    t.integer "user_id"
  end

  add_index "groups_users", ["group_id"], name: "index_groups_users_on_group_id", using: :btree
  add_index "groups_users", ["user_id"], name: "index_groups_users_on_user_id", using: :btree

  create_table "guests", force: true do |t|
    t.integer  "rating"
    t.integer  "puzzle_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "guests_puzzles", id: false, force: true do |t|
    t.integer "guest_id"
    t.integer "puzzle_id"
    t.boolean "correct"
  end

  create_table "lessons", force: true do |t|
    t.string   "name"
    t.string   "author"
    t.text     "description"
    t.integer  "course_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "slug"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer  "posi"
  end

  add_index "lessons", ["slug"], name: "index_lessons_on_slug", using: :btree

  create_table "lessons_users", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "lesson_id"
  end

  create_table "merit_actions", force: true do |t|
    t.integer  "user_id"
    t.string   "action_method"
    t.integer  "action_value"
    t.boolean  "had_errors",    default: false
    t.string   "target_model"
    t.integer  "target_id"
    t.boolean  "processed",     default: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "merit_activity_logs", force: true do |t|
    t.integer  "action_id"
    t.string   "related_change_type"
    t.integer  "related_change_id"
    t.string   "description"
    t.datetime "created_at"
  end

  create_table "merit_score_points", force: true do |t|
    t.integer  "score_id"
    t.integer  "num_points", default: 0
    t.string   "log"
    t.datetime "created_at"
  end

  create_table "merit_scores", force: true do |t|
    t.integer "sash_id"
    t.string  "category", default: "default"
  end

  create_table "newsletters", force: true do |t|
    t.string   "subject"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "openings_join_table", id: false, force: true do |t|
    t.integer "parent_id"
    t.integer "child_id"
  end

  add_index "openings_join_table", ["child_id"], name: "openings_join_table_child_id_index", using: :btree
  add_index "openings_join_table", ["parent_id"], name: "openings_join_table_parent_id_index", using: :btree

  create_table "openings_tree", id: false, force: true do |t|
    t.integer "id"
    t.string  "move",       limit: 8
    t.integer "popularity"
    t.string  "name"
  end

  create_table "organizations", force: true do |t|
    t.string   "name",                   default: "", null: false
    t.text     "description",            default: ""
    t.string   "country",                default: ""
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "username"
  end

  add_index "organizations", ["confirmation_token"], name: "index_organizations_on_confirmation_token", unique: true, using: :btree
  add_index "organizations", ["email"], name: "index_organizations_on_email", unique: true, using: :btree
  add_index "organizations", ["reset_password_token"], name: "index_organizations_on_reset_password_token", unique: true, using: :btree

  create_table "puzzles", force: true do |t|
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "title"
    t.integer  "difficulty"
    t.text     "description"
    t.string   "start"
    t.string   "end"
    t.integer  "pointvalue"
    t.string   "notation"
    t.string   "slug"
    t.integer  "rating",               default: 1200
    t.integer  "posi"
    t.boolean  "blackfirst"
    t.string   "orientation",          default: "white"
    t.integer  "average_duration",     default: 90
    t.integer  "average_success_rate", default: 50
  end

  add_index "puzzles", ["slug"], name: "index_puzzles_on_slug", using: :btree

  create_table "puzzles_users", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "puzzle_id"
    t.boolean "correct"
    t.integer "duration"
    t.integer "rating_update"
  end

  create_table "quizzes", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.text     "questions"
    t.text     "answers"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "slug"
    t.integer  "lesson_id"
    t.integer  "pointvalue"
    t.string   "fen"
  end

  add_index "quizzes", ["slug"], name: "index_quizzes_on_slug", using: :btree

  create_table "quizzes_users", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "quiz_id"
  end

  create_table "redactor_assets", force: true do |t|
    t.integer  "user_id"
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "redactor_assets", ["assetable_type", "assetable_id"], name: "idx_redactor_assetable", using: :btree
  add_index "redactor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_redactor_assetable_type", using: :btree

  create_table "sashes", force: true do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree

  create_table "tags", force: true do |t|
    t.string  "name"
    t.string  "parent"
    t.string  "hex"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                             default: "",                   null: false
    t.string   "encrypted_password",                default: ""
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                     default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                                       null: false
    t.datetime "updated_at",                                                       null: false
    t.string   "username"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "bio"
    t.string   "country"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "website"
    t.string   "fbtoken"
    t.string   "invitation_token",       limit: 60
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
    t.string   "slug"
    t.integer  "sash_id"
    t.integer  "level",                             default: 0
    t.boolean  "confirmable",                       default: false
    t.string   "unconfirmed_email"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.integer  "video_quality",                     default: 360
    t.boolean  "allow_d_comment_notifs",            default: true
    t.boolean  "allow_c_comment_notifs",            default: true
    t.boolean  "allow_badge_notifs",                default: true
    t.integer  "rating",                            default: 1000
    t.integer  "puzzle_id"
    t.boolean  "moderator",                         default: false
    t.boolean  "newsletter",                        default: true
    t.boolean  "premium",                           default: false
    t.integer  "streak",                            default: 0
    t.integer  "best_streak",                       default: 0
    t.datetime "streak_date"
    t.string   "timezone"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "blackcolor",                        default: "rgb(69, 78, 92)"
    t.string   "whitecolor",                        default: "rgb(136, 213, 194)"
    t.boolean  "notation"
    t.boolean  "highlights"
    t.boolean  "badges_pref",                       default: true
    t.boolean  "se_index",                          default: true
    t.boolean  "all_view",                          default: true
    t.boolean  "student_list",                      default: true
    t.string   "piecetheme",                        default: "wikipedia"
    t.integer  "streaks_pref",                      default: 18
    t.boolean  "motivate_pref",                     default: true
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["invitation_token"], name: "index_users_on_invitation_token", unique: true, using: :btree
  add_index "users", ["invited_by_id"], name: "index_users_on_invited_by_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["slug"], name: "index_users_on_slug", using: :btree

  create_table "users_videos", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "video_id"
  end

  create_table "videos", force: true do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "title"
    t.text     "description"
    t.integer  "lesson_id"
    t.string   "slug"
    t.text     "summary"
    t.integer  "vimeoid"
  end

  add_index "videos", ["slug"], name: "index_videos_on_slug", using: :btree

  create_table "votes", force: true do |t|
    t.integer  "votable_id"
    t.string   "votable_type"
    t.integer  "voter_id"
    t.string   "voter_type"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "votes", ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope", using: :btree
  add_index "votes", ["votable_id", "votable_type"], name: "index_votes_on_votable_id_and_votable_type", using: :btree
  add_index "votes", ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope", using: :btree
  add_index "votes", ["voter_id", "voter_type"], name: "index_votes_on_voter_id_and_voter_type", using: :btree

end
