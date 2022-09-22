class Transaction < ApplicationRecord
  belongs_to :user
  enum state: { success: 0, failed: 1 }
  belongs_to :subscription
  validates :amount, presence: true
end
