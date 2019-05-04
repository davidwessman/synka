require "test_helper"

class CallbacksMessagesControllerTest < ActionDispatch::IntegrationTest
  test "handle status callback" do
    message = messages(:processed)
    message.delivery = {'MessageSid': "AAXXXXXX"}
    message.save!

    post(status_callbacks_message_url(message), params: {'MessageSid': "AAXXXXXX", 'MessageStatus': "sent"})
    assert_response(:success)

    message.reload
    assert(message.sent?)

    post(status_callbacks_message_url(message), params: {'MessageSid': "AAXXXXXX", 'MessageStatus': "delivered"})
    assert_response(:success)

    message.reload
    assert(message.delivered?)
  end
end
