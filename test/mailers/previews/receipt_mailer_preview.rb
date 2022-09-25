# Preview all emails at http://localhost:3000/rails/mailers/receipt_mailer
class ReceiptMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/receipt_mailer/transaction_created
  def transaction_created
    ReceiptMailer.transaction_created
  end

end
