# frozen_string_literal: true

class TwilioTextMessenger
  attr_reader(:message, :phone)

  def initialize(phone, message)
    @phone = phone
    @message = message
    #@user = User.find(user_id)
  end

  def call
    client = Twilio::REST::Client.new
    client.messages.create({
      from: Rails.application.secrets.twilio_phone_number,
      to: @phone,
      body: @message,
    })
  end
end
