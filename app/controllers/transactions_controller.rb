class TransactionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @transactions = Transaction.where(user_id: params[:user_id])
  end

  def create
    @transaction = Transaction.new(transaction_params)
    if @transaction.save
      redirect_to root_url, notice: 'Successfully transfered.'
    else
      redirect_to root_url, notice: 'Could not transfer.'
    end
  end

  private

  def transaction_params
    params.permit(:user_id, :subscription_id, :state, :amount)
  end
end
