# frozen_string_literal: true

class Subscription < ApplicationRecord
  validates :user_id, uniqueness: { scope: :plan_id }

  belongs_to :user
  belongs_to :plan
  has_many :usages, dependent: :destroy
  has_many :transactions, dependent: :destroy
end
