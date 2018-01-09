# frozen_string_literal: true

Koala.configure do |config|
  config.access_token = ENV.fetch('FB_ACCESS_TOKEN', nil)
  config.app_access_token = ENV.fetch('FB_APP_ACCESS_TOKEN', nil)
  config.app_id = ENV.fetch('FB_APP_ID', nil)
  config.app_secret = ENV.fetch('FB_APP_SECRET', nil)
  # See Koala::Configuration for more options, including details on
  # how to send requests through your own proxy servers.
end
