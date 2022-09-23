class CheckoutController < ApplicationController

  def create
    plan = Plan.find(params[:id])
    @session = Stripe::Checkout::Session.create({
      payment_method_types: ['card'],
      line_items: [
        price_data: {
          unit_amount: plan.monthly_fee,
          currency: 'usd',
          product_data: {
            name: plan.name
          }
        },
        quantity: 1,
      ],
      mode: 'payment',
      success_url: root_url,
      cancel_url: root_url,
    })

  end
end
