require "test_helper"

class ContactsControllerTest < ActionDispatch::IntegrationTest
  test "should create contact" do
    sign_in_as(users(:business))
    space = spaces(:business)

    get(new_space_contact_url(space))
    assert_response(:success)

    attributes = {space_id: space.to_param, name: "David Wessman", phone: "+46701231234"}
    assert_difference("Contact.count", 1) do
      post(space_contacts_url(space), params: {contact: attributes})
    end

    assert_redirected_to(space_contact_url(space, Contact.order(:created_at).last))
  end

  test "show contact" do
    sign_in_as(users(:business))
    space = spaces(:business)
    contact = contacts(:business_first)
    get(space_contact_url(space, contact))
    assert_response(:success)
  end

  test "should update contact" do
    sign_in_as(users(:business))
    contact = contacts(:business_first)

    get(space_contact_url(contact.space, contact))
    assert_response(:success)

    attributes = {email: "david@synka.app"}
    patch(space_contact_url(contact.space, contact), params: {contact: attributes})

    assert_redirected_to(space_contact_url(contact.space, contact))
    contact.reload
    assert_equal(contact.email, "david@synka.app")
  end
end
