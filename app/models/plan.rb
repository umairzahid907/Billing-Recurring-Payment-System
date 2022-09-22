class Plan < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :monthly_fee, presence: true
  belongs_to :user
  has_many :features, dependent: :destroy
end
