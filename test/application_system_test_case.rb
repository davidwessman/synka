# frozen_string_literal: true

require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by(
    :selenium,
    using: :chrome, screen_size: [1400, 1400],
    options: {
      options: Selenium::WebDriver::Chrome::Options.new(
        args: %w[disable-notifications]
      ),
    }
  )
  setup(:set_host)

  def set_host
    Rails.application.routes.default_url_options[:host] = \
      Capybara.current_session.server.host
    Rails.application.routes.default_url_options[:port] = \
      Capybara.current_session.server.port
  end

  # override API MOCK
  def api_setup
  end

  def sign_in_as(user)
    visit(sign_in_url)
    fill_in("email", with: user.email)
    fill_in("password", with: "passpass")
    within("form") do
      click_on("Sign in")
    end
  end
end
