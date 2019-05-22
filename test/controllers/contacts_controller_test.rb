require "test_helper"

class ContactsControllerTest < ActionDispatch::IntegrationTest
  test "should create contact" do
    sign_in_as(users(:business))
    space = spaces(:business)

    get(new_account_contact_url())
    assert_response(:success)

    attributes = {name: "David Wessman", phone: "+46701231234"}
    assert_difference("Contact.count", 1) do
      post(account_contacts_url, params: {contact: attributes})
    end

    assert_redirected_to(account_contact_url(Contact.order(:created_at).last))
  end

  test "show contact" do
    sign_in_as(users(:business))
    space = spaces(:business)
    contact = contacts(:business_first)
    get(account_contact_url(contact))
    assert_response(:success)
  end

  test "should update contact" do
    sign_in_as(users(:business))
    contact = contacts(:business_first)

    get(account_contact_url(contact))
    assert_response(:success)

    attributes = {email: "david@synka.app"}
    patch(account_contact_url(contact), params: {contact: attributes})

    assert_redirected_to(account_contact_url(contact))
    contact.reload
    assert_equal(contact.email, "david@synka.app")
  end
end
