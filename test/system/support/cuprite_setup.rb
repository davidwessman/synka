# frozen_string_literal: true
# First, load Cuprite Capybara integration
require "capybara/cuprite"
require_relative "./ferrum_logger"

# Then, we need to register our driver to be able to use it later
# with #driven_by method.
Capybara.register_driver(:blinka_cuprite) do |app|
  Capybara::Cuprite::Driver.new(
    app,
    window_size: [1920, 1080],
    # See additional options for Dockerized environment in the respective section of this article
    browser_options: {
    },
    # Increase Chrome startup wait time (required for stable CI builds)
    process_timeout: 40,
    # Not sure if this is needed
    timeout: 20,
    # Enable debugging capabilities
    inspector: true,
    # Allow running Chrome in a headful mode by setting HEADLESS env
    # var to a falsey value
    headless: !ENV["HEADLESS"].in?(%w[n 0 no false]),
    logger: FerrumLogger.new,
    js_errors: true
  )
end

# Configure Capybara to use :cuprite driver by default
Capybara.default_driver = Capybara.javascript_driver = :blinka_cuprite

module CupriteHelpers
  # Drop #pause anywhere in a test to stop the execution.
  # Useful when you want to checkout the contents of a web page in the middle of a test
  # running in a headful mode.
  def pause
    page.driver.pause
  end

  # Drop #debug anywhere in a test to open a Chrome inspector and pause the execution
  def debug(*args)
    page.driver.debug(*args)
  end
end
