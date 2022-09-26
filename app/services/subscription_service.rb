class SubscriptionService
  def initialize(subscription)
    @subscription = subscription
  end

  def perform_transaction(amount)
    transaction = Transaction.new(
                  user_id: @subscription.user_id,
                  subscription_id: @subscription.id,
                  amount: @subscription.plan.monthly_fee
                )
    transaction.save
  end
end
