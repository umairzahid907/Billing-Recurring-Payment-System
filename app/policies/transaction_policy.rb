class TransactionPolicy < ApplicationPolicy
  def index?
    user.admin?
  end
end
