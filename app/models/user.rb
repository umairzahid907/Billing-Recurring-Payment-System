# frozen_string_literal: true

class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  enum role: { buyer: 0, admin: 1 }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable
end
