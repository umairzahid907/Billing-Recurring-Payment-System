# frozen_string_literal: true

class TransactionsController < ApplicationController
  def index
    authorize Transaction
    @transactions = if params[:user_id].present?
                      Transaction.where(user_id: params[:user_id])
                    else
                      Transaction.all
                    end
  end
end
