# frozen_string_literal: true

class User < ApplicationRecord
  after_create :register_customer
  validates :name, length: { maximum: 50 }
  enum role: { buyer: 0, admin: 1 }
  devise :invitable, :database_authenticatable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  has_many :plans
  has_many :subscriptions, dependent: :destroy
  has_many :transactions, dependent: :destroy

  private

  def register_customer
    response = Stripe::Customer.create({
                  email: email
                })
    update_attribute :stripe_customer_id, response[:id]
  end
end
