# frozen_string_literal: true

module ApplicationHelper
  def admin?
    current_user.admin?
  end

  def buyer?
    current_user.buyer?
  end
end
