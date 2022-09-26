class TransactionsController < ApplicationController

  def index
    authorize Transaction
    if params[:user_id].present?
      @transactions = Transaction.where(user_id: params[:user_id])
    else
      @transactions = Transaction.all
    end
  end
end
