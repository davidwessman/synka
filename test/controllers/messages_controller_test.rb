require "test_helper"

class MessagesControllerTest < ActionDispatch::IntegrationTest
  test "should create message" do
    sign_in_as(users(:business))
    contact = contacts(:business_first)

    get(account_contact_url(contact))
    assert_response(:success)

    attributes = {contact_id: contact.to_param, content: "An awesome message!"}
    assert_difference("Message.count", 1) do
      post(account_messages_url(contact), params: {message: attributes})
    end

    assert_redirected_to(account_url)

    message = contact.messages.recent.first
    assert_equal(message.content, "An awesome message!")
    assert_equal(message.user, users(:business))
  end
end
