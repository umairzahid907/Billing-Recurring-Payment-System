class SubscriptionPolicy < ApplicationPolicy
  def create?
    user.buyer?
  end
end
