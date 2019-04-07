# frozen_string_literal: true

require File.expand_path("../config/environment", __dir__)
require "rails/test_help"
require "clearance/test_unit"
require "sidekiq/testing"
Sidekiq::Testing.fake!
Dir[Rails.root.join("test/support/**/*.rb")].each { |f| require f }

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all
  # tests in alphabetical order.
  fixtures :all
  setup :api_setup

  # Add more helper methods to be used by all tests here...
  def api_setup
    return if ENV.fetch("SKIP_API_MOCK", false)

    require "webmock/minitest"
    WebMock.disable_net_connect!(allow_localhost: true)
    stub_request(:any, /facebook.com/).to_rack(FakeFacebook)
  end

  def week_sample(from = "09:00", to = "15:00")
    hash = {mon: [[from, to]],
            tue: [[from, to]],
            wed: [[from, to]],
            thu: [[from, to]],
            fri: [[from, to]],
            sat: [[from, to]],
            sun: [[from, to]],}
    Week.new(hash: hash)
  end
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
