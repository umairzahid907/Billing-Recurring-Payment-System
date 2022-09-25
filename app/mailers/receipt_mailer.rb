class ReceiptMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.receipt_mailer.transaction_created.subject
  #
  def transaction_created
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
