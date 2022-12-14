# frozen_string_literal: true

class Subscription < ApplicationRecord
  belongs_to :user
  belongs_to :plan
  validates :user_id, uniqueness: { scope: :plan_id }
  has_many :usages, dependent: :destroy
  has_many :transactions, dependent: :destroy
end
