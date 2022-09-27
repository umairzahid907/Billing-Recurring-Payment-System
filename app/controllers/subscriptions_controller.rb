# frozen_string_literal: true

class SubscriptionsController < ApplicationController
  before_action :set_subscription, only: %i[destroy]
  before_action :make_payment, only: %i[create]
  after_action :perform_transaction, only: %i[success]
  def create
    authorize Subscription
    @subscription = Subscription.new(subscription_params)
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
    authorize Subscription
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
  end

  def perform_transaction
    transaction = SubscriptionService.new(@subscription).perform_transaction
    return unless transaction

    ReceiptMailer.with(user: @subscription.user, transaction: transaction).transaction_created.deliver_later
  end

  def make_payment
    plan = Plan.find(params[:plan_id])
    redirect_to root_url, alert: 'Unable to subscribe' unless current_user.stripe_customer_id
    success_url = subscription_success_url(user_id: params[:user_id], plan_id: params[:plan_id])
    session = CheckoutSession.new(plan, current_user, success_url, root_url)
    @session = session.create
  end
end
