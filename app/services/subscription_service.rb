# frozen_string_literal: true

class SubscriptionService
  def initialize(subscription)
    @subscription = subscription
  end

  def perform_transaction
    transaction = Transaction.new(
      user_id: @subscription.user_id,
      subscription_id: @subscription.id,
      amount: @subscription.plan.monthly_fee
    )
    transaction if transaction.save
  end
end
