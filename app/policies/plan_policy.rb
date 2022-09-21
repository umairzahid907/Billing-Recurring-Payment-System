class PlanPolicy < ApplicationPolicy
  def new?
    user.admin?
  end

  def create?
    new?
  end

  def edit?
    create?
  end

  def destroy?
    create?
  end
end
