# frozen_string_literal: true

require File.expand_path('../config/environment', __dir__)
require 'rails/test_help'
require 'clearance/test_unit'
Dir[Rails.root.join("test/support/**/*.rb")].each {|f| require f}

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  setup :api_setup

  # Add more helper methods to be used by all tests here...
  def api_setup
    unless ENV.fetch('SKIP_API_MOCK', false)
      require 'webmock/minitest'
      WebMock.disable_net_connect!(allow_localhost: true)
      stub_request(:any, /graph.facebook.com/).to_rack(FakeFacebook)
    end
  end
end

class ActionDispatch::IntegrationTest
  def sign_in_as(user)
    post(session_url, params: { session: { email: user.email,
                                           password: 'passpass' } })
  end

  def sign_out
    delete(sign_out_url)
  end
end
