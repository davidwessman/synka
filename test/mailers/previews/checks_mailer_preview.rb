# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/checks_mailer
class ChecksMailerPreview < ActionMailer::Preview
  def failed
    ChecksMailer.failed(Location.first.id)
  end
end
