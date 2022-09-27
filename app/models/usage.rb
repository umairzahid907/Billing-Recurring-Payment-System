# frozen_string_literal: true

class Usage < ApplicationRecord
  belongs_to :feature
  belongs_to :user
  validates :units_used, presence: true
end
