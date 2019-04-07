# frozen_string_literal: true

Koala.configure do |config|
  config.app_id = ENV.fetch("FB_APP_ID", "")
  config.app_secret = ENV.fetch("FB_APP_SECRET", "")
  # See Koala::Configuration for more options, including details on
  # how to send requests through your own proxy servers.
end
