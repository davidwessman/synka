# frozen_string_literal: true

class NexmoTextMessenger
  include Rails.application.routes.url_helpers
  attr_reader(:message)

  def initialize(message)
    @message = message
  end

  def call
    return false unless @message.draft?
    @message.transaction do
      response = Nexmo.sms.send(
        from: ENV['NEXMO_NUMBER'],
        to: @message.contact.phone,
        text: @message.content,
      )
      if response.http_response.code != "200"
        @message.update!(status: :failed,
                        processed_at: Time.zone.now)
        return false
      end
      message = response[:messages].first

      # status_callback: status_callbacks_message_url(@message, host: ENV.fetch("APP_URL", "localhost:3000")),
      @message.update!(status: :processed,
                       processed_at: Time.zone.now,
                       delivery: {message_id: message[:message_id]})
    end
    true
  end
end
