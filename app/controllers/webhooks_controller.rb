class WebhooksController < ApplicationController
  #skip_before_action :authenticate_user!
  #skip_before_action :verify_authenticity_token

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
      @user = User.find_by(stripe_customer_id: session.customer)
      @user.update_attribute(name: success)
    end

    render json: { message: 'success' }
  end
end
