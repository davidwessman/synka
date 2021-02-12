require 'test_helper'

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  chrome_opts = {
    'goog:chromeOptions' => {
      'args' => %w[no-sandbox headless disable-gpu --window-size=1920x1080]
    }
  }

  Capybara.register_driver(:custom_chrome_headless) do |app|
    client = Selenium::WebDriver::Remote::Http::Default.new
    client.read_timeout = 120
    Capybara::Selenium::Driver.new(
      app,
      browser: :chrome,
      desired_capabilities:
        Selenium::WebDriver::Remote::Capabilities.chrome(chrome_opts),
      http_client: client
    )
  end

  if ENV.fetch('HEADLESS', 'default') == 'false'
    driven_by(
      :selenium,
      using: :chrome,
      screen_size: [1400, 1400],
      options: {
        options:
          Selenium::WebDriver::Chrome::Options.new(
            args: %w[disable-notifications]
          )
      }
    )
  else
    driven_by(:custom_chrome_headless)
  end

  def sign_in_as(user)
    visit(sign_in_url)
    fill_in('email', with: user.email)
    fill_in('password', with: 'passpass')
    within('form') { click_on('Sign in') }
  end
end
