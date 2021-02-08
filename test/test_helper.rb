# frozen_string_literal: true

require File.expand_path("../config/environment", __dir__)
require "rails/test_help"
require "clearance/test_unit"
require "sidekiq/testing"
Dir[Rails.root.join("test/support/**/*.rb")].each { |f| require f }

Sidekiq::Testing.fake!

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all
  # tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

class ActionDispatch::IntegrationTest
  def sign_in_as(user)
    post(session_url, params: {session: {email: user.email,
                                         password: "passpass",}})
  end

  def sign_out
    delete(sign_out_url)
  end
end
