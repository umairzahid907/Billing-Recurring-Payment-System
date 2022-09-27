# frozen_string_literal: true

class Transaction < ApplicationRecord
  enum state: { success: 0, failed: 1 }

  validates :amount, presence: true

  belongs_to :user
  belongs_to :subscription
end
