# frozen_string_literal: true

module UserHelper
  def get_plan(user)
    user.subscriptions.last.plan if user.subscriptions.any?
  end

  def get_subs(user)
    user.subscriptions if user.subscriptions.any?
  end
end
