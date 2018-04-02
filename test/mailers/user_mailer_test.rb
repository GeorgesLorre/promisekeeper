require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "new_promise" do
    mail = UserMailer.new_promise
    assert_equal "New promise", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
