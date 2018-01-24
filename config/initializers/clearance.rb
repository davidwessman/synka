# frozen_string_literal: true

Clearance.configure do |config|
  config.mailer_sender = 'david@wessman.co'
  config.rotate_csrf_on_sign_in = true
  config.routes = false
  config.allow_sign_up = false
end
