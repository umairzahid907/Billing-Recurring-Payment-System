class SubscriptionsController < ApplicationController
  before_action :set_subscription, only: %i[destroy]
  before_action :authenticate_user!
  def create
    @subscription = Subscription.new(subscription_params)
    if @subscription.save
      redirect_to plans_url, notice: 'Successfully subscribed.'
      perform_transaction
    else
      redirect_to plans_url, notice: 'Could not subscribe.'
    end
  end

  def destroy
    if @subscription.destroy
      redirect_to plans_url, notice: 'Unsubscribed.'
    else
      redirect_to plans_url, notice: 'Could not unsubscribe.'
    end
  end

  private

  def subscription_params
    params.permit(:user_id, :plan_id)
  end

  def set_subscription
    @subscription = Subscription.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "This subscription doesn't exist!"
    redirect_to plans_url
  end

  def perform_transaction
    Transaction.create(user_id: @subscription.user_id, subscription_id: @subscription.id, amount: @subscription.plan.monthly_fee)
  end
end
