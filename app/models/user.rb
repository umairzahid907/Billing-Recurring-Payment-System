# frozen_string_literal: true

class User < ApplicationRecord
  after_create :register_customer
  validates :name, length: { maximum: 50 }
  validate :avatar_format
  enum role: { buyer: 0, admin: 1 }
  devise :invitable, :database_authenticatable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  has_many :plans, dependent: :nullify
  has_many :usages, dependent: :nullify
  has_many :subscriptions, dependent: :destroy
  has_many :transactions, dependent: :destroy
  has_one_attached :avatar, dependent: :destroy

  private

  def register_customer
    response = Stripe::Customer.create({ email: email })
    update(stripe_price_id: response[:id])
  end

  def avatar_format
    return unless avatar.attached?
    return if avatar.blob.content_type.start_with? 'image/'

    avatar.purge_later
    errors.add(:avatar, 'needs to be an image')
  end
end
