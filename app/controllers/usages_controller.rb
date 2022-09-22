class UsagesController < ApplicationController
  before_action :set_usage, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  def index
  end

  def show
  end

  def new
    @usage = Usage.new
  end

  def edit
  end

  def create
    @usage = Usage.new(usage_params)
    if @usage.save
      redirect_to root_url, notice: 'usage was successfully added.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @usage.update(usage_params)
      redirect_to root_url, notice: 'usage was successfully updated.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    if @usage.destroy
      redirect_to root_url, notice: 'usage was successfully destroyed.'
    else
      redirect_to root, alert: 'Could not delete this usage.'
    end
  end

  private
    def set_usage
      @usage = usage.find(params[:id])
    end

    def usage_params
      params.require(:usage).permit(:feature_id, :subscription_id, :units_used)
    end
end
