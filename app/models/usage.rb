# frozen_string_literal: true

class Usage < ApplicationRecord
  validates :units_used, presence: true

  belongs_to :feature
  belongs_to :user
end
