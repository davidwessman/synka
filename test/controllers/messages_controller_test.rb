require "test_helper"

class MessagesControllerTest < ActionDispatch::IntegrationTest
  test "should create message" do
    sign_in_as(users(:business))
    contact = contacts(:business_first)

    get(space_contact_url(contact.space, contact))
    assert_response(:success)

    attributes = {content: "An awesome message!"}
    assert_difference("Message.count", 1) do
      post(contact_messages_url(contact), params: {message: attributes})
    end

    assert_redirected_to(space_contact_url(contact.space, contact))

    message = Message.order(created_at: :desc).first
    assert_equal(message.content, "An awesome message!")
    assert_equal(message.user, users(:business))
  end
end
