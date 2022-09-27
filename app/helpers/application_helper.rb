# frozen_string_literal: true

module ApplicationHelper
  delegate :admin?, to: :current_user

  delegate :buyer?, to: :current_user
end
