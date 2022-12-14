# frozen_string_literal: true

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

ActiveRecord::Schema.define(version: 20_220_924_223_948) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'active_storage_attachments', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'record_type', null: false
    t.bigint 'record_id', null: false
    t.bigint 'blob_id', null: false
    t.datetime 'created_at', null: false
    t.index ['blob_id'], name: 'index_active_storage_attachments_on_blob_id'
    t.index %w[record_type record_id name blob_id], name: 'index_active_storage_attachments_uniqueness',
                                                    unique: true
  end

  create_table 'active_storage_blobs', force: :cascade do |t|
    t.string 'key', null: false
    t.string 'filename', null: false
    t.string 'content_type'
    t.text 'metadata'
    t.bigint 'byte_size', null: false
    t.string 'checksum', null: false
    t.datetime 'created_at', null: false
    t.index ['key'], name: 'index_active_storage_blobs_on_key', unique: true
  end

  create_table 'features', force: :cascade do |t|
    t.string 'name', limit: 50, null: false
    t.integer 'unit_price', null: false
    t.integer 'max_unit_limit', null: false
    t.bigint 'plan_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['plan_id'], name: 'index_features_on_plan_id'
  end

  create_table 'plans', force: :cascade do |t|
    t.bigint 'user_id'
    t.string 'name', limit: 50, null: false
    t.integer 'monthly_fee', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'stripe_price_id', default: 'null'
    t.index ['user_id'], name: 'index_plans_on_user_id'
  end

  create_table 'subscriptions', force: :cascade do |t|
    t.bigint 'user_id'
    t.bigint 'plan_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['plan_id'], name: 'index_subscriptions_on_plan_id'
    t.index %w[user_id plan_id], name: 'index_subscriptions_on_user_id_and_plan_id', unique: true
    t.index ['user_id'], name: 'index_subscriptions_on_user_id'
  end

  create_table 'transactions', force: :cascade do |t|
    t.integer 'amount', null: false
    t.bigint 'user_id'
    t.bigint 'subscription_id'
    t.integer 'state', default: 0, null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['subscription_id'], name: 'index_transactions_on_subscription_id'
    t.index ['user_id'], name: 'index_transactions_on_user_id'
  end

  create_table 'usages', force: :cascade do |t|
    t.bigint 'feature_id'
    t.bigint 'user_id'
    t.integer 'units_used', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index %w[feature_id user_id], name: 'index_usages_on_feature_id_and_user_id', unique: true
    t.index ['feature_id'], name: 'index_usages_on_feature_id'
    t.index ['user_id'], name: 'index_usages_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.string 'confirmation_token'
    t.datetime 'confirmed_at'
    t.datetime 'confirmation_sent_at'
    t.string 'unconfirmed_email'
    t.string 'name', limit: 50
    t.integer 'role', default: 0, null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'invitation_token'
    t.datetime 'invitation_created_at'
    t.datetime 'invitation_sent_at'
    t.datetime 'invitation_accepted_at'
    t.integer 'invitation_limit'
    t.string 'invited_by_type'
    t.bigint 'invited_by_id'
    t.integer 'invitations_count', default: 0
    t.string 'stripe_customer_id', default: 'null'
    t.index ['confirmation_token'], name: 'index_users_on_confirmation_token', unique: true
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['invitation_token'], name: 'index_users_on_invitation_token', unique: true
    t.index ['invited_by_id'], name: 'index_users_on_invited_by_id'
    t.index %w[invited_by_type invited_by_id], name: 'index_users_on_invited_by_type_and_invited_by_id'
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'active_storage_attachments', 'active_storage_blobs', column: 'blob_id'
  add_foreign_key 'features', 'plans'
  add_foreign_key 'plans', 'users'
  add_foreign_key 'subscriptions', 'plans'
  add_foreign_key 'subscriptions', 'users'
  add_foreign_key 'transactions', 'subscriptions'
  add_foreign_key 'transactions', 'users'
  add_foreign_key 'usages', 'features'
  add_foreign_key 'usages', 'users'
end
