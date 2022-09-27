# frozen_string_literal: true

class UsagesController < ApplicationController
  before_action :set_usage, only: %i[edit update destroy]

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
end
