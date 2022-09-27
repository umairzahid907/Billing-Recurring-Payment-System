# frozen_string_literal: true

class TransactionPolicy < ApplicationPolicy
  def index?
    user.admin?
  end
end
