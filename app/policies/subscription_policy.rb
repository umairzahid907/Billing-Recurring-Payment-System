class SubscriptionPolicy < ApplicationPolicy
  def create?
    user.buyer?
  end

  def destroy?
    user.buyer? && record.user_id == user.id
  end
end
