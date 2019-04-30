# frozen_string_literal: true

class MessageSenderWorker
  include Sidekiq::Worker

  def perform(message_id)
    message = Message.includes(:contact).find(message_id)
    TwilioTextMessenger.new(message).call
  end
end
