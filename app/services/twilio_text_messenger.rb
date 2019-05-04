# frozen_string_literal: true

class TwilioTextMessenger
  include Rails.application.routes.url_helpers
  attr_reader(:message)

  def initialize(message)
    @message = message
  end

  def call
    client = Twilio::REST::Client.new
    return false unless @message.draft?
    @message.transaction do
      tw_message = client.messages.create({
        from: Rails.application.secrets.twilio_phone_number,
        to: @message.contact.phone,
        body: @message.content,
        status_callback: status_callbacks_message_url(@message, host: ENV.fetch("APP_URL", "localhost:3000")),
      })
      @message.update!(status: :processed,
                       processed_at: Time.zone.now,
                       delivery: {'MessageSid': tw_message.sid})
    end
    true
  end
end
