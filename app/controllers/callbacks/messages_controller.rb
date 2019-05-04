# frozen_string_literal: true

class Callbacks::MessagesController < ApplicationController
  skip_before_action(:verify_authenticity_token)

  def status
    @message = Message.find(params[:id])

    if @message.delivery_status(twilio_params)
      head(200, content_typ: "text/html")
    else
      head(422, content_type: "text/html")
    end
  end

  private

  def twilio_params
    params.permit("MessageSid", "MessageStatus")
  end
end
