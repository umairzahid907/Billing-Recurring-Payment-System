class TransactionsController < ApplicationController

  def index
    @transactions = Transaction.where(user_id: params[:user_id])
  end
end
