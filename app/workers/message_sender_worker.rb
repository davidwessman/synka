# frozen_string_literal: true

class MessageSenderWorker
  include Sidekiq::Worker

  def perform(message_id)
    message = Message.includes(:contact).find(message_id)
    if ENV["NEXMO_API_KEY"].present?
      NexmoTextMessenger.new(message).call
    else
      TwilioTextMessenger.new(message).call
    end
  end
end
