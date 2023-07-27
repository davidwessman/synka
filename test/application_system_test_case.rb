# frozen_string_literal: true

require "test_helper"
require "minitest/hooks/default"
# Load configuration files and helpers
Dir[File.join(__dir__, "system/support/**/*.rb")].each { |file| require file }

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  include CupriteHelpers
  include Minitest::Hooks

  driven_by(Capybara.javascript_driver)

  def before_all
    super
    PrecompileAssets.setup
  end

  def sign_in_as(user)
    visit(sign_in_url)
    fill_in("email", with: user.email)
    fill_in("password", with: "passpass")
    within("form") { click_on("Sign in") }
  end
end
