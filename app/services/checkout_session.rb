# frozen_string_literal: true

class CheckoutSession
  def initialize(object, user, success_url, cancel_url)
    @object = object
    @user = user
    @success_url = success_url
    @cancel_url = cancel_url
  end

  def create
    Stripe::Checkout::Session.create({
                                       customer: @user.stripe_customer_id,
                                       payment_method_types: ['card'],
                                       line_items: [
                                         price: @object.stripe_price_id,
                                         quantity: 1
                                       ],
                                       mode: 'subscription',
                                       success_url: @success_url,
                                       cancel_url: @cancel_url
                                     })
  end
end
