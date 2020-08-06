require "test_helper"

class TemplateTest < ActiveSupport::TestCase
  test "convert template to message" do
    contact = contacts(:business_first)
    content_template = "Hello %contact.name% and welcome to %space.title%"

    template = Template.new(
      contact: contact,
      content: content_template
    )
    message = template.message
    assert_equal(
      "Hello #{contact.name} and welcome to #{contact.space.title}",
      message.content
    )
  end
end
