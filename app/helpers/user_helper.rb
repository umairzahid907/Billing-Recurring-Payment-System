# frozen_string_literal: true
module UserHelper
  def get_plan(user)
    if user.subscriptions.any?
      user.subscriptions.last.plan
    end
  end
end
