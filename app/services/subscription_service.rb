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
    if transaction.save
      transaction
    else
      nil
    end
  end
end
