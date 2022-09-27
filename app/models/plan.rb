# frozen_string_literal: true

class Plan < ApplicationRecord
  after_create :add_to_stripe

  validates :name, presence: true, length: { maximum: 50 }
  validates :monthly_fee, presence: true

  belongs_to :user
  has_many :features, dependent: :destroy
  has_many :subscriptions, dependent: :destroy

  private

  def add_to_stripe
    response = Stripe::Price.create(
      {
        unit_amount: monthly_fee,
        currency: 'usd',
        recurring: { interval: 'month' },
        product_data:
        {
          name: name
        }
      }
    )
    update(stripe_price_id: response[:id])
  end
end
