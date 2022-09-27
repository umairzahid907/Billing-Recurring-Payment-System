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
    rescue JSON::ParserError
      # Invalid payload
      status 400
      return
    rescue Stripe::SignatureVerificationError
      # Invalid signature
      status 400
      return
    end

    # Handle the event
    case event.type
    when 'checkout.session.completed'
      session = event.data.object
      p session
    end

    render json: { message: 'success' }
  end
end
