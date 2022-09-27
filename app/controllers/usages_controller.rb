# frozen_string_literal: true

class UsagesController < ApplicationController
  before_action :set_usage, only: %i[edit update destroy]
  after_action :add_to_stripe, only: %i[create]
  after_action :update_to_stripe, only: %i[update]
  def new
    @usage = Usage.new
  end

  def create
    @usage = Usage.new(usage_params)
    if @usage.save
      redirect_to users_url, notice: 'usage was successfully added.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @usage.update(usage_params)
      redirect_to users_url, notice: 'usage was successfully updated.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    if @usage.destroy
      redirect_to users_url, notice: 'usage was successfully destroyed.'
    else
      redirect_to users_url, alert: 'Could not delete this usage.'
    end
  end

  private

  def set_usage
    @usage = Usage.find(params[:id])
  end

  def usage_params
    params.require(:usage).permit(:feature_id, :user_id, :units_used)
  end

  def add_to_stripe
    feature = @usage.feature
    bill = usage_bill
    response = Stripe::Price.create({
                                      unit_amount: bill,
                                      currency: 'usd',
                                      product_data: {
                                        name: feature.name
                                      }
                                    })
    @usage.update(:stripe_price_id, response[:id])
  end

  def update_to_stripe
    bill = usage_bill
    Stripe::Price.update({
                           unit_amount: bill
                         })
  end

  def usage_bill
    feature = @usage.feature
    if @usage.units_used > feature.max_limit
      (@usage.units_used - feature.max_limit) * feature.unit_price
    else
      0
    end
  end

  def update_subscription

  end
end
