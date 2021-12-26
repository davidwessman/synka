# frozen_string_literal: true

class MessageSenderWorker
  include Sidekiq::Worker

  def perform(message_id)
    message = Message.includes(:contact).find(message_id)
    NexmoTextMessenger.new(message).call
  end
end
