class SubscriptionsController < ApplicationController
  before_action :set_subscription, only: %i[destroy]
  before_action :make_payment, only: %i[create]

  def create
  end
  def success
    @subscription = Subscription.new(subscription_params)
    if @subscription.save
      redirect_to plans_url, notice: 'Subscribed successfully.'
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
    params.permit(:user_id, :plan_id, :stripe_subscription_id)
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

  def make_payment
    plan = Plan.find(params[:plan_id])
    @session = Stripe::Checkout::Session.create({
      payment_method_types: ['card'],
      line_items: [
        price: plan.stripe_price_id,
        quantity: 1,
      ],
      mode: 'subscription',
      success_url: subscription_success_url(user_id: params[:user_id], plan_id: params[:plan_id]),
      cancel_url: root_url,
    })
    p @session
  end
end
