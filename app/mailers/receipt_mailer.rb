# frozen_string_literal: true

class ReceiptMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.receipt_mailer.transaction_created.subject
  #
  def transaction_created
    @user = params[:user]
    @transaction = params[:transaction]

    mail to: @user.email
  end
end
