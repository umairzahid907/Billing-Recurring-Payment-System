# frozen_string_literal: true

class PlanPolicy < ApplicationPolicy
  def new?
    user.admin?
  end

  alias create? new?
  alias update? new?
  alias destroy? new?
end
