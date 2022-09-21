# frozen_string_literal: true

class User < ApplicationRecord
  validates :name, length: { maximum: 50 }
  enum role: { buyer: 0, admin: 1 }
  devise :invitable, :database_authenticatable,
         :recoverable, :rememberable, :validatable,
         :confirmable
end
