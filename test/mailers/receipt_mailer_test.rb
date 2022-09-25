require 'test_helper'

class ReceiptMailerTest < ActionMailer::TestCase
  test "transaction_created" do
    mail = ReceiptMailer.transaction_created
    assert_equal "Transaction created", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
