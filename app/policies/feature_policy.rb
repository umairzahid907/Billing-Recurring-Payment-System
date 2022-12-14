# frozen_string_literal: true

class FeaturePolicy < ApplicationPolicy
  def new?
    user.admin?
  end

  alias create? new?
  alias update? new?
  alias destroy? new?
end
