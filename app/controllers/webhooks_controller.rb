class WebhooksController < ApplicationController
  skip_before_action :authenticate_user!
  skip_before_action :verify_authenticity_token

  def create
    payload = request.body.read
    sig_header = request.env['HTTP_STRIPE_SIGNATURE']
    event = nil

    begin
      event = Stripe::Webhook.construct_event(
        payload, sig_header, 'whsec_GbdI9YkkbDqe2RXnyHU8xeWPOp2lwRAo'
      )
    rescue JSON::ParserError => e
      status 400
      return
    rescue Stripe::SignatureVerificationError => e
      # Invalid signature
      puts "Signature error"
      p e
      return
    end

    # Handle the event
    case event.type
    when 'checkout.session.completed'
      session = event.data.object
      user = User.find_by(stripe_customer_id: session.customer)
      plan = Plan.find_by(stripe_price_id, session.id)
      subscription = Subscription.new(user_id: user.id, plan_id: plan.id)
      if @subscription.save
        transaction = Transaction.create(user_id: user.id, subscription_id: subscription_id, amount: session.amount)
        redirect_to plans_url, notice: 'Subscribed successfully.'
      else
        redirect_to plans_url, notice: 'Could not subscribe.'
      end
    end
  end
end
