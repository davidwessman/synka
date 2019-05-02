# frozen_string_literal: true

class TwilioTextMessenger
  attr_reader(:message)

  def initialize(message)
    @message = message
  end

  def call
    client = Twilio::REST::Client.new
    return false unless @message.draft?
    @message.transaction do
      client.messages.create({
        from: Rails.application.secrets.twilio_phone_number,
        to: @message.contact.phone,
        body: @message.content,
      })
      @message.update!(status: :sent, sent_at: Time.zone.now)
    end
    true
  end
end
