class Feature < ApplicationRecord
  belongs_to :plan
  has_many :usages, dependent: :destroy
  validates :name, presence: true, length: { maximum: 50 }
  validates :unit_price, presence: true
  validates :max_unit_limit, presence: true
end
